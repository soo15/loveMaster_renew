package com.chest.scheduler;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.chest.ct.mapper.FdrmcntrMapper;
import com.common.map.ComCamelMap;
import com.common.util.DateUtils;
import com.common.util.HttpFile;
import com.common.util.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import net.javacrumbs.shedlock.spring.annotation.EnableSchedulerLock;
import net.javacrumbs.shedlock.spring.annotation.SchedulerLock;

@Service
@EnableScheduling
@EnableSchedulerLock(defaultLockAtMostFor = "10m")
public class KpayRecurReqst {
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Value("#{kakaoPay['KPAY.APP_ADMIN_KEY']}")
    public String KPAY_APP_ADMIN_KEY;
    
    @Value("#{kakaoPay['KPAY.API_URL']}")
    public String KPAY_API_URL;
    
    @Value("#{kakaoPay['KPAY.BIZAPI_URL']}")
    public String BIZAPI_URL;
    
    @Value("#{kakaoPay['KPAY.PG_BIZAPI_KEY']}")
    public String PG_BIZAPI_KEY;
    
    @Value("#{kakaoPay['KPAY.BUCKET_ID_DP']}")
    public String BUCKET_ID_DP;
    
    @Value("#{kakaoPay['KPAY.BUCKET_ID_ST']}")
    public String BUCKET_ID_ST;
    
    @Value("#{kakaoPay['KPAY.BUCKET_ID_BA']}")
    public String BUCKET_ID_BA;
	
	@Autowired
    private FdrmcntrMapper mapper;
	
	/* 매월 10,25일  8,15시 30분 정기기부결제승인  */
    @Scheduled(cron="0 30 8,15 10,25 * *")
	@SchedulerLock(name = "Kakaopay", lockAtMostFor = "10m", lockAtLeastFor = "10m")
    @SuppressWarnings("unchecked")
	public void KpayScheduler( ) {
		logger.debug("Kakaopay Scheduler start !!!");
		
		try {
			// 01.정기결제 대상 가져오기
			Map<String, String> paramMap = new HashMap<String, String>();
			List<ComCamelMap> nPayList = mapper.selectKpayApprList(paramMap);        
			
			for(ComCamelMap nPayInfo : nPayList) {
				Map<String, String> resMap = new HashMap<String, String>();
				try {
					// 02.정기결제 요청
					Map<String, String> tempMap = new HashMap<String, String>();
					tempMap.put("orderNo", String.valueOf(nPayInfo.get("orderNo")));
					tempMap.put("authSn", String.valueOf(nPayInfo.get("authSn")));
					tempMap.put("cid", String.valueOf(nPayInfo.get("cid")));
					tempMap.put("sid", String.valueOf(nPayInfo.get("sid")));					
					tempMap.put("partner_order_id", String.valueOf(nPayInfo.get("partnerOrderId")));
					tempMap.put("partner_user_id", String.valueOf(nPayInfo.get("partnerUserId")));
					tempMap.put("quantity", "1");
					tempMap.put("total_amount", String.valueOf(nPayInfo.get("totalAmount")));
					tempMap.put("tax_free_amount", String.valueOf(nPayInfo.get("taxFreeAmount")));
					
					resMap = kpayRegistApproval(tempMap);
					
					// 04.승인결과 저장
					mapper.updateKpayApprResult(resMap);
						
				} catch(Exception e) {
					logger.error("카카오페이 정기기부배치Error");
					resMap.putAll(nPayInfo);					
					resMap.put("code", "Fail");
					resMap.put("message", "카카오페이 정기기부배치Error:"+e.toString());
					mapper.updateKpayApprResult(resMap);
					e.printStackTrace();
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	private Map<String, String> kpayRegistApproval(Map<String, String> paramMap) throws Exception {
		
		String authUrl = KPAY_API_URL+"/v1/payment/subscription";	// 정기결제요청
		
		Map<String, String> resMap = new HashMap<String, String>();		
		
		HttpUtil httpUtil = new HttpUtil(authUrl);
		httpUtil.setRequestHeader("Authorization", "KakaoAK "+KPAY_APP_ADMIN_KEY);
		
		try{
			//#####################
			// 4.API 통신 시작
			//#####################
			String authResultString = "";
			authResultString = httpUtil.processHTTP(paramMap);
			//System.out.println("authResultString =>>>"+authResultString);
			//############################################################
			//5.API 통신결과 처리
			//############################################################
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(authResultString);
			
			Map<String, String> mapObj = new ObjectMapper().readValue(jsonObj.toString(), Map.class); 						
			resMap.putAll(mapObj);
			
			JSONObject jsonAmount = (JSONObject) jsonObj.get("amount");
			if(jsonAmount != null && !jsonAmount.isEmpty()) {
				Map<String, String> mapAmt = new ObjectMapper().readValue(jsonAmount.toString(), Map.class); 						
				resMap.putAll(mapAmt);
			}
			JSONObject jsonCard = (JSONObject) jsonObj.get("card_info");					
			if(jsonCard != null && !jsonCard.isEmpty()) {
				Map<String, String> mapCard = new ObjectMapper().readValue(jsonCard.toString(), Map.class); 						
				resMap.putAll(mapCard);
			}
						
			resMap.putAll(paramMap);
			resMap.put("code","Success");
			
		} catch (Exception ex) {
			resMap.put("orderNo", paramMap.get("orderNo"));
			resMap.put("authSn", paramMap.get("authSn"));
			resMap.put("code","Fail");
			resMap.put("message", ex.getMessage());				
			ex.printStackTrace();
		}
		
		return resMap;		
	}
	
	/* 매일 7시 30분 입금내역 조회  */
    @Scheduled(cron="0 30 7 * * *")
    @SchedulerLock(name = "KakaopayHstDps", lockAtMostFor = "10m", lockAtLeastFor = "10m")
	@SuppressWarnings("unchecked")
	public void KpayHistory( ) {
    	logger.debug("KakaopayHstDps start !!!");
    	String target_date = DateUtils.getNowDate("yyyyMMdd");
		getKakaoDeposits(target_date);
	}
    
    /* 매일 7시 30분 정산내역 조회  */
    @Scheduled(cron="0 30 7 * * *")
    @SchedulerLock(name = "KakaopayHstSttlm", lockAtMostFor = "10m", lockAtLeastFor = "10m")
    @SuppressWarnings("unchecked")
	public void KpaySettleHistory() {		
    	logger.debug("KakaopayHstSttlm start !!!");
    	String target_date = DateUtils.addDay(DateUtils.getNowDate("yyyyMMdd"), -1);
		getKakaoSettlements(target_date);		
	}
    
    @SuppressWarnings("unchecked")
    public void getKakaoSettlements(String target_date) {
    	List<Map> resList = new ArrayList<Map>();
		
		String bucket_id = BUCKET_ID_BA;	// BUCKET_ID_ST 결제내역 , BUCKET_ID_BA 정산내역 
		String pg_key = PG_BIZAPI_KEY;
		// 결제내역
		//String url = BIZAPI_URL+"/files/v1/payments/history?target_date="+target_date+"&bucket_id="+bucket_id;
		// 정산내역
		String url = BIZAPI_URL+"/files/v1/settlements/history?target_date="+target_date+"&bucket_id="+bucket_id;
		
		HttpFile httpUrl = new HttpFile(url);
		httpUrl.setRequestHeader("Authorization", "PG_BIZAPI_KEY "+pg_key);
		String resStr = httpUrl.sendGetJson();
		
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(resStr);
			
			String fileUrl = String.valueOf(jsonObj.get("url"));
			
			HttpFile httpFile = new HttpFile(fileUrl);
			httpFile.setRequestHeader("Authorization", "PG_BIZAPI_KEY "+pg_key);
			
			File destFile = new File("settle_file");
			httpFile.download(destFile);
			
			jsonObj = (JSONObject) parser.parse(new FileReader(destFile));
			JSONArray jsonList = (JSONArray) jsonObj.get("data");
			
			jsonList.forEach(payObj -> {
				try {
					JSONObject jsonDetail = (JSONObject) payObj;
					Map<String, Object> resMap = new ObjectMapper().readValue(jsonDetail.toString(), Map.class);
					resMap.put("target_date", target_date);
					
					resList.add(resMap);
				
				} catch(Exception e) {
					e.printStackTrace();
				}				
			});
			
			//정산내역 테이블입력
			if(resList.size() > 0) {
				mapper.insertKakaoPaySttlm(resList);
			}
			
					
		} catch (Exception ex) {
			ex.printStackTrace();
		}
    }
    
    @SuppressWarnings("unchecked")
    public void getKakaoDeposits(String target_date) {
    	List<Map> resList = new ArrayList<Map>();
		
		String bucket_id = BUCKET_ID_DP;	// 입금내역
		String pg_key = PG_BIZAPI_KEY;
		String url = BIZAPI_URL+"/files/v1/deposits/history?target_date="+target_date+"&bucket_id="+bucket_id;
		
		HttpFile httpUrl = new HttpFile(url);
		httpUrl.setRequestHeader("Authorization", "PG_BIZAPI_KEY "+pg_key);
		String resStr = httpUrl.sendGetJson();
		
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(resStr);
			
			String fileUrl = String.valueOf(jsonObj.get("url"));
			
			HttpFile httpFile = new HttpFile(fileUrl);
			httpFile.setRequestHeader("Authorization", "PG_BIZAPI_KEY "+pg_key);
			
			File destFile = new File("pay_file");
			httpFile.download(destFile);
			
			jsonObj = (JSONObject) parser.parse(new FileReader(destFile));
			String target_date2 = String.valueOf(jsonObj.get("target_date"));
			
			JSONArray depDetailList = (JSONArray) jsonObj.get("deposit_details");			
			
			for(int i=0; i<depDetailList.size(); i++) {
				
				JSONObject jsonBody = (JSONObject) depDetailList.get(i);
				
				String from_date = String.valueOf(jsonBody.get("from_date"));
				String to_date = String.valueOf(jsonBody.get("to_date"));				
				JSONArray jsonList = (JSONArray) jsonBody.get("data");
				
				jsonList.forEach(payObj -> {
					try {
						JSONObject jsonDetail = (JSONObject) payObj;
						Map<String, Object> resMap = new ObjectMapper().readValue(jsonDetail.toString(), Map.class);
						resMap.put("target_date", target_date2);
						resMap.put("from_date", from_date);
						resMap.put("to_date", to_date);
						
						resList.add(resMap);
					
					} catch(Exception e) {
						logger.error(e.getMessage());
						e.printStackTrace();
					}				
				});
			}
			
			if(resList.size() > 0) {
				mapper.insertKakaoPayHistory(resList);
			}
					
		} catch (Exception ex) {
			logger.error(ex.getMessage());
			ex.printStackTrace();
		}
    }
}
