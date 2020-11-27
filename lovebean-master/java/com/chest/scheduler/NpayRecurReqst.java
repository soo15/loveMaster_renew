package com.chest.scheduler;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.chest.ct.mapper.FdrmcntrMapper;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.util.DateUtils;
import com.common.util.HttpUtil;
import com.common.util.JsonUtils;
import com.common.util.StringUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.javacrumbs.shedlock.spring.annotation.EnableSchedulerLock;
import net.javacrumbs.shedlock.spring.annotation.SchedulerLock;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Service
@EnableScheduling
@EnableSchedulerLock(defaultLockAtMostFor = "10m")
public class NpayRecurReqst {
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Value("#{naverPay['NPAY.API_URL']}")
    public String NPAY_API_URL;
    
    @Value("#{naverPay['NPAY.PARTNER_ID']}")
    public String NPAY_PARTNER_ID;
    
    @Value("#{naverPay['NPAY.CLIENT_ID']}")
    public String NPAY_CLIENT_ID;
    
    @Value("#{naverPay['NPAY.CLIENT_SECRET']}")
    public String NPAY_CLIENT_SECRET;
    
    @Value("#{naverPay['NPAY.CHAINID']}")
    public String NPAY_CHAINID;
	
	@Autowired
    private FdrmcntrMapper mapper;
	
	/* 매월 10,25일  8,15시 30분 정기기부결제승인  */
    @Scheduled(cron="0 30 8,15 10,25 * *")
    @SchedulerLock(name = "Naverpay", lockAtMostFor = "10m", lockAtLeastFor = "10m")
    @SuppressWarnings("unchecked")
	public void NpayScheduler( ) {
		logger.debug("Scheduler start !!!");
		String authUrlResv = NPAY_API_URL+"/"+ NPAY_PARTNER_ID + "/naverpay/payments/recurrent/pay/v3/reserve";
		String authUrlAppr = NPAY_API_URL+"/"+ NPAY_PARTNER_ID + "/naverpay/payments/recurrent/pay/v3/approval";
		
		try {
			// 01.정기결제 대상 가져오기
			Map<String, String> paramMap = new HashMap<String, String>();
			List<ComCamelMap> nPayList = mapper.selectNpayApprList(paramMap);        
			
			for(ComCamelMap nPayInfo : nPayList) {
				Map<String, String> resMap = new HashMap<String, String>();
				try {
					// 02.반복결제 예약 - 토큰 가져오기				
					resMap = npayRegistApproval(nPayInfo, authUrlResv);
					
					if("Success".equals(resMap.get("code"))){
						// 03.반복결제 승인 전송
						paramMap.clear();
						paramMap.put("recurrentId", resMap.get("recurrentId"));
						paramMap.put("paymentId", resMap.get("paymentId"));
						
						Map<String, String> apprMap = npayRegistApproval(paramMap, authUrlAppr);
						apprMap.putAll(nPayInfo);
						
						// 04.승인결과 저장
						mapper.updateNpayApprResult(apprMap);						
						
						if(!"Success".equals(apprMap.get("code"))) {
							logger.error("결제승인오류");
						}
						
					} else {
						logger.error("결제예약오류");
						resMap.putAll(nPayInfo);
						mapper.updateNpayApprResult(resMap);
					}
				} catch(Exception e) {
					logger.error("정기기부배치Error");
					resMap.putAll(nPayInfo);					
					resMap.put("code", "Fail");
					resMap.put("message", "정기기부배치Error:"+e.toString());
					mapper.updateNpayApprResult(resMap);
					e.printStackTrace();
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/* 매일(월-금) 7시 0분 결제내역 조회  */
    @Scheduled(cron="0 0 7 * * 1-5")
    @SchedulerLock(name = "NaverpayHst", lockAtMostFor = "10m", lockAtLeastFor = "10m")
	@SuppressWarnings("unchecked")
	public void NpayHistory( ) {
		logger.debug("NpayHistory start !!!");
		
		int pageNumber = 1;
		int totalPageCount = 1;
		Map<String, String> paramMap = new HashMap<String, String>();
		//String startTime = DateUtils.addDay(DateUtils.getNowDate("yyyyMMdd"), -10)+"000000";
		//String endTime = DateUtils.addDay(DateUtils.getNowDate("yyyyMMdd"), -4)+"235959";
		String startTime = DateUtils.getDayWeek(-1, Calendar.MONDAY);
		String endTime = DateUtils.getDayWeek(0, Calendar.SUNDAY);
		
		try {
			String lastEndde = (String) mapper.getInqireEndde(paramMap);			
			if(StringUtils.isNull(lastEndde) || lastEndde.compareTo(DateUtils.addDay(startTime, -1)) < 0) {				
				startTime = DateUtils.getDayWeek(-2, Calendar.MONDAY);
			}
			
			JSONObject paramJson = new JSONObject();
			paramJson.put("startTime", startTime+"000000");
			paramJson.put("endTime", endTime+"235959");
			paramJson.put("approvalType", "ALL");	// ALL:전체, APPROVAL:승인, CANCEL:취소, CANCEL_FAIL:취소실패
			paramJson.put("pageNumber", pageNumber);
			paramJson.put("rowsPerPage", 30);
			paramJson.put("collectChainGroup", 1);
			
			List<Map> resList = getNpayHistory(paramJson);
			
			List<Map> apprLst = new ArrayList<Map>();
			List<Map> cancelLst = new ArrayList<Map>();
			resList.forEach(payMap -> {
				String admissionTypeCode = String.valueOf(payMap.get("admissionTypeCode"));
				if(admissionTypeCode.equals("01")) {			// 승인
					apprLst.add(payMap);
				} else if(admissionTypeCode.equals("03")) {		// 취소
					cancelLst.add(payMap);
				}
			});
			
			if(resList.size() > 0) {
				// 결제내역등록
				if(apprLst.size() > 0) {
					mapper.insertNaverPayHistory(apprLst);
				} 
					
				if(cancelLst.size() > 0) {
					mapper.insertNaverPayHistory(cancelLst);
				}
				
				Map<String, String> tempMap = (HashMap) resList.get(0); 
				totalPageCount = Integer.parseInt(String.valueOf(tempMap.get("totalPageCount")));
			}
			
			for(int i=2; totalPageCount > 1 && i <= totalPageCount; i++) {
				paramJson.put("pageNumber", i);
				List<Map> respageList = getNpayHistory(paramJson);
				
				apprLst.clear();
				cancelLst.clear();
				respageList.forEach(payMap -> {
					String admissionTypeCode = String.valueOf(payMap.get("admissionTypeCode"));
					if(admissionTypeCode.equals("01")) {
						apprLst.add(payMap);
					} else if(admissionTypeCode.equals("03")) {
						cancelLst.add(payMap);
					}
				});				
				
				if(apprLst.size() > 0) {
					// 승인
					mapper.insertNaverPayHistory(apprLst);
				} 
					
				if(cancelLst.size() > 0) {
					// 취소
					mapper.insertNaverPayHistory(cancelLst);
				}
			}
						
		} catch(Exception e) {
			e.printStackTrace();
		}
			
	}
    
    @SuppressWarnings("unchecked")
	public void getNpayHistoryWPayId(String paymentId ) {
		logger.debug("getNpayHistoryWPayId start !!!");
		
		try {			
			
			JSONObject paramJson = new JSONObject();
			paramJson.put("paymentId", paymentId);
			paramJson.put("collectChainGroup", 1);
			
			List<Map> resList = getNpayHistory(paramJson);
			
			if(resList.size() == 1) {
				// 결제내역등록
				mapper.insertNaverPayHistory(resList);
			} else if(resList.size() > 1) {
				List<Map> cancelLst = new ArrayList<Map>();
				resList.forEach(payMap -> {
					String admissionTypeCode = String.valueOf(payMap.get("admissionTypeCode"));
					if(admissionTypeCode.equals("03")) {
						cancelLst.add(payMap);
					}
				});
				// 승인,취소 모두 있을경우 취소건만 반영
				mapper.insertNaverPayHistory(cancelLst);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}			
	}
	
	@SuppressWarnings("unchecked")
	private Map<String, String> npayRegistApproval(Map<String, String> paramMap, String authUrl) throws Exception {
		
		String npayChainid = PropertyConfig.getPropertiesCon("properties/naverPay", "NPAY.CHAINID_" + paramMap.get("bhfCode"));
		
		HttpUtil httpUtil = new HttpUtil(authUrl);
		httpUtil.setRequestHeader("X-Naver-Client-Id", NPAY_CLIENT_ID);
		httpUtil.setRequestHeader("X-Naver-Client-Secret", NPAY_CLIENT_SECRET);
		httpUtil.setRequestHeader("X-NaverPay-Chain-Id", npayChainid);
		
		Map<String, String> resMap = new HashMap<String, String>();
		
		try{
			//#####################
			// 4.API 통신 시작
			//#####################
			String authResultString = "";
			authResultString = httpUtil.processHTTP(paramMap);
			logger.debug("npayAppr authResultString =>>>"+authResultString);
			//############################################################
			//5.API 통신결과 처리
			//############################################################			
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(authResultString);
			
			Map<String, String> mapObj = new ObjectMapper().readValue(jsonObj.toString(), Map.class); 						
			resMap.putAll(mapObj);
			JSONObject jsonBody = (JSONObject) jsonObj.get("body");
			if(jsonBody != null && !jsonBody.isEmpty()) {
				Map<String, String> mapBody = new ObjectMapper().readValue(jsonBody.toString(), Map.class); 						
				resMap.putAll(mapBody);
			}
			JSONObject jsonDetail = (JSONObject) jsonBody.get("detail");					
			if(jsonDetail != null && !jsonDetail.isEmpty()) {
				Map<String, String> mapDetail = new ObjectMapper().readValue(jsonDetail.toString(), Map.class); 						
				resMap.putAll(mapDetail);
			}
		} catch (HttpException hex) {
			resMap.put("orderNo", paramMap.get("orderNo"));
			resMap.put("authSn", paramMap.get("authSn"));
			resMap.put("code", "Fail");
			resMap.put("message", hex.getMessage());
		} catch (Exception ex) {
			System.out.println(ex);			
		}
		
		return resMap;		
	}
	
	@SuppressWarnings("unchecked")
	private List<Map> getNpayHistory(JSONObject paramJson) throws Exception {
		
		List<Map> resList = new ArrayList<Map>();		
		
		String authUrl = NPAY_API_URL+"/"+ NPAY_PARTNER_ID + "/naverpay/payments/v2.2/list/history";
		
		HttpUtil httpUtil = new HttpUtil(authUrl);
		httpUtil.setRequestHeader("X-Naver-Client-Id", NPAY_CLIENT_ID);
		httpUtil.setRequestHeader("X-Naver-Client-Secret", NPAY_CLIENT_SECRET);
		httpUtil.setRequestHeader("X-NaverPay-Chain-Id", NPAY_CHAINID);
		
		try{
			//#####################
			// 4.API 통신 시작
			//#####################
			String authResultString = "";
			authResultString = httpUtil.processJsonHTTP(paramJson.toJSONString());
			logger.debug("npayHist authResultString =>>>"+authResultString);
			//############################################################
			//5.API 통신결과 처리
			//############################################################			
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(authResultString);
						
			if("Success".equals(String.valueOf(jsonObj.get("code")))) {			
				JSONObject jsonBody = (JSONObject) jsonObj.get("body");
				JSONArray jsonList = (JSONArray) jsonBody.get("list");
				int totalPageCount = Integer.parseInt(String.valueOf(jsonBody.get("totalPageCount")));
				
				jsonList.forEach(payObj -> {
					try {
						JSONObject jsonDetail = (JSONObject) payObj;
						Map<String, Object> resMap = new ObjectMapper().readValue(jsonDetail.toString(), Map.class);
						Map<String, String> settleMap = (HashMap) resMap.get("settleInfo");
						
						Map<String, String> newMap = new HashMap<String, String>();
						newMap.put("paymentId", String.valueOf(resMap.get("paymentId")));
						newMap.put("admissionTypeCode", String.valueOf(resMap.get("admissionTypeCode")));
						newMap.put("admissionYmdt", String.valueOf(resMap.get("admissionYmdt")));
						
						if(StringUtils.isNull(paramJson.get("startTime"))) {
							newMap.put("inqireBgnde", String.valueOf(resMap.get("admissionYmdt")).substring(0, 8));
							newMap.put("inqireEndde", String.valueOf(resMap.get("admissionYmdt")).substring(0, 8));
						} else {
							newMap.put("inqireBgnde", String.valueOf(paramJson.get("startTime")).substring(0, 8));
							newMap.put("inqireEndde", String.valueOf(paramJson.get("endTime")).substring(0, 8));
						}
						
						newMap.put("excclcAt", String.valueOf(settleMap.get("settleCreated")));
						newMap.put("rcpmnyAmount", String.valueOf(settleMap.get("totalSettleAmount")));
						newMap.put("feeAmount", String.valueOf(settleMap.get("totalCommissionAmount")));						
						newMap.put("totalPageCount", ""+totalPageCount);
						resList.add(newMap);					
											
					} catch(Exception e) {
						e.printStackTrace();
					}				
				});
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();			
		}
		
		return resList;		
	}

}
