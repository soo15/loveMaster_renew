package com.chest.ct.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
//import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartRequest;

import com.chest.ct.mapper.ImpscntrMapper;
import com.chest.ct.service.ImpscntrService;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.util.HttpUtil;
import com.common.util.StringUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.inicis.std.util.ParseUtil;

@Service
@Transactional(rollbackFor={Exception.class})
public class ImpscntrServiceImpl implements ImpscntrService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Value("#{naverPay['NPAY.API_URL']}")
    public String NPAY_API_URL;
    
    @Value("#{naverPay['NPAY.PARTNER_ID']}")
    public String NPAY_PARTNER_ID;
    
    @Value("#{naverPay['NPAY.CLIENT_ID']}")
    public String NPAY_CLIENT_ID;
    
    @Value("#{naverPay['NPAY.CLIENT_SECRET']}")
    public String NPAY_CLIENT_SECRET;
    
    @Value("#{kakaoPay['KPAY.APP_ADMIN_KEY']}")
    public String KPAY_APP_ADMIN_KEY;
    
    @Value("#{kakaoPay['KPAY.API_URL']}")
    public String KPAY_API_URL;
    
    @Value("#{chest['gen.filePath']}")
    public String genFilePath;
    
    @Autowired
    private ImpscntrMapper mapper;
    
    public Map<String, Object> selectBankList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectBankList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
    }


	@Override
	public Map<String, Object> selectCodeList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectCodeList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}
	
	@Override
	public Map<String, Object> selectSetleMthdList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectSetleMthdList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}

	@Override
	public int insert(Map<String, String> paramMap ) throws Exception {
		int cnt = 0;
			
		mapper.updateTHP_InipayLog(paramMap);
 		
		if( "00".equals( paramMap.get("resultCode") ) || "0000".equals( paramMap.get("resultCode") ) ) {
			/**** 기부자정보 */
			cnt = mapper.insertTHP_CntrbtrInfo(paramMap);
			/**** 기부자 일시기부정보 */
			cnt = mapper.insertTHP_CntrSingl(paramMap);
			/**** 기부관심분야 */
			cnt = mapper.insertTHP_CntrIntrst(paramMap);
			/**** 정보제공동의 여부 */
			cnt = mapper.insertTHP_CntrInfoAgre(paramMap);
		}
		return cnt;
	}
	
	@Override
	public String insertNpay(Map<String, String> paramMap ) throws Exception {
		int cnt = 0;
		String message = "";
		
		/**** 결제인증번호 세팅 */
		paramMap.put("inicisCrtfcNo", paramMap.get("paymentId"));
		
		/**** 기부자정보 */
		cnt = mapper.insertTHP_CntrbtrInfoNpay(paramMap);
		/**** 기부자 일시기부정보 */
		cnt = mapper.insertTHP_CntrSinglNpay(paramMap);
		/**** 기부관심분야 */
		cnt = mapper.insertTHP_CntrIntrstNpay(paramMap);
		/**** 정보제공동의 여부 */
		String[] agreeList = paramMap.get("agree_arr").toString().split("-");				
		List<Map> list = new ArrayList<Map>();
		Map<String, String> agreMap = new HashMap<String, String>();
		agreMap.put("cntrSn", paramMap.get("cntrSn"));
		agreMap.put("eventCode", paramMap.get("eventCode"));
		agreMap.put("iemCode", "01");
		agreMap.put("agreAt", agreeList[0]);
		list.add(agreMap);
		agreMap = new HashMap<String, String>();
		agreMap.put("cntrSn", paramMap.get("cntrSn"));
		agreMap.put("eventCode", paramMap.get("eventCode"));
		agreMap.put("iemCode", "02");
		agreMap.put("agreAt", agreeList[1]);
		list.add(agreMap);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);			
		cnt = mapper.insertTHP_CntrInfoAgreNpay(map);
		
		/**** 네이버페이 결제승인 */
		Map<String, String> parameter = new HashMap<String, String>();
		parameter = npayRegistApproval( paramMap );	
		message = StringUtils.getNullToString(parameter.get("code"));
		if( message.equals("Success") ) {
			/**** 기부자순번 세팅 */
			parameter.put("cntrSn", paramMap.get("cntrSn"));
			// 결제완료 후 전송받은 결제금액과 기부금액이 일치하는지 확인, 다르면 결제취소 및 에러발생
			if(!String.valueOf(parameter.get("totalPayAmount")).equals(paramMap.get("cntrAmount").replaceAll(",", ""))) {
				paramMap.put("reqPayType", "cancel");
				paramMap.put("cntrAmount", String.valueOf(parameter.get("totalPayAmount")));
				// 결제취소
				parameter = npayRegistApproval( paramMap );
				message = "기부금액과 결제금액이 일치하지 않습니다.";
				if("Success".equals(parameter.get("code"))) {	// 결제취소 성공시 에러발생					
					message += "_" + paramMap.get("timestamp");
					logger.error(message);
					throw new Exception(message);
				} else {	// 결제취소 실패시 메세지 세팅 후 그대로 진행
					parameter.put("message", message);
					message = "Success";
				}
			}
			
		} else {			
			if( message.equals("InvalidMerchant") ) {
				message = "유효하지 않은 가맹점입니다.";
			} else if( message.equals("TimeExpired") ) {
				message = "결제 승인 가능 시간 초과되었습니다.";
			} else if( message.equals("AlreadyOnGoing") ) {
				message = "해당 결제번호로 결제가 이미 진행 중 입니다.";
			} else if( message.equals("AlreadyComplete") ) {
				message = "해당 결제번호로 이미 결제가 완료되었습니다.";
			} else if( message.equals("OwnerAuthFail") ) {
				message = "본인 카드 인증 오류 입니다.";
			} else {
				message = (String) parameter.get("message");
			}
			message += "_" + paramMap.get("timestamp");
			logger.error(message);
			//return message;
			throw new Exception(message);
		}
		
		mapper.updateTHP_NaverpayLog(parameter);
			
		message += "_" + paramMap.get("timestamp");
		return message;
	}


	@Override
	public int insertTHP_InipayLog(Map<String, String> paramMap) throws Exception {
		int cnt = 0;
		String[] agreeList = paramMap.get("agree_arr").toString().split("-");
		paramMap.put("agreAt1", agreeList[0]);
		paramMap.put("agreAt2", agreeList[1]);
		cnt = mapper.insertTHP_InipayLog(paramMap);
		return cnt;
	}
	
	@Override
	public int insertTHP_NaverpayLog(Map<String, String> paramMap) throws Exception {
		int cnt = 0;
		cnt = mapper.insertTHP_NaverpayLog(paramMap);
		return cnt;
	}
	
	@Override
	public int updateTHP_NaverpayLog(Map<String, String> paramMap) throws Exception {
		return mapper.updateTHP_NaverpayLog(paramMap);
	}
	
	@Override
	public int insertCompany(Map<String, String> paramMap) throws Exception {
		int cnt = 0;
		/**** 기부상담신청 */
		cnt = mapper.insertTHP_CntrCnsltReqst(paramMap);
		/**** 기부상담이력 */
		cnt = mapper.insertTHP_CntrCnsltHist(paramMap);
		/**** 정보제공동의 여부 */
//		paramMap.put("cntrSn", paramMap.get("cnsltSn") );
//		paramMap.put("flag", "company");
//		cnt = mapper.insertTHP_CntrInfoAgre(paramMap);
		return cnt;
	}
	
	@Override
	public Map<String, Object> getInipayData(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.getInipayData(paramMap));
		return resMap;
	}
	
	@Override
	public Map<String, Object> getNaverpayData(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.getNaverpayData(paramMap));
		return resMap;
	}
	
	@Override
	public Map<String, Object> getNaverpayFrmData(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.getNaverpayFrmData(paramMap));
		return resMap;
	}

	@Override
	public int insertTHP_FundMysAnswer(Map<String, String> paramMap) throws Exception {
		int cnt = mapper.insertTHP_FundMysAnswer(paramMap);
		return cnt;
	}


	@Override
	public String getSpeclMyAt(Map<String, String> paramMap) throws Exception {
		String value = mapper.getSpeclMyAt(paramMap);
		return value;
	}
	
	private Map<String, String> npayRegistApproval(Map<String, String> paramMap) throws Exception {
		
		Map<String, String> resMap = new HashMap<String, String>();
		
		String paymentId = paramMap.get("paymentId");			// 네이버페이가 발급한 결제 번호
		String reqType = paramMap.get("reqPayType");
		
		String npayChainid = PropertyConfig.getPropertiesCon("properties/naverPay", "NPAY.CHAINID_" + paramMap.get("jihoe"));
		//#####################
		// API 요청 전문 생성
		//#####################
		Map<String, String> authMap = new Hashtable<String, String>();
		authMap.put("paymentId"			    ,paymentId);
		
		String authUrl = "";
		
		if("cancel".equals(reqType)) {
			authUrl = NPAY_API_URL+"/"+ NPAY_PARTNER_ID + "/naverpay/payments/v1/cancel";
			authMap.put("cancelAmount"		, paramMap.get("cntrAmount").replaceAll(",", ""));
			authMap.put("cancelReason"		,"SystemError");
			authMap.put("cancelRequester"	,"2");			
			authMap.put("taxScopeAmount"	, "0");
			authMap.put("taxExScopeAmount"	, paramMap.get("cntrAmount").replaceAll(",", ""));
			
		} else {
			authUrl = NPAY_API_URL+"/"+ NPAY_PARTNER_ID + "/naverpay/payments/v2.2/apply/payment";
		}
		
		HttpUtil httpUtil = new HttpUtil(authUrl);
		httpUtil.setRequestHeader("X-Naver-Client-Id", NPAY_CLIENT_ID);
		httpUtil.setRequestHeader("X-Naver-Client-Secret", NPAY_CLIENT_SECRET);
		httpUtil.setRequestHeader("X-NaverPay-Chain-Id", npayChainid);
		
		try{
			//#####################
			// 4.API 통신 시작
			//#####################
			String authResultString = "";
			authResultString = httpUtil.processHTTP(authMap);
			System.out.println("authResultString =>>>"+authResultString);
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
			
			resMap.putAll(paramMap);
			
			
		} catch (Exception ex) {
			System.out.println(ex);			
		}
		
		return resMap;		
	}
	
	@Override	
	public Map<String, String> checkValidator(Map<String, String> paramMap) throws Exception {
		
		Map<String, String> resMap = new HashMap<String, String>();
		if(StringUtils.isNull(paramMap.get("metpaySe")) || StringUtils.isNull(paramMap.get("cntrAmount"))) {
			resMap.put("chk_result", "Success");
			return resMap;
		}
		
		String metpaySe = StringUtils.getNullToString(paramMap.get("metpaySe"));
		String cntrAmount = StringUtils.getNullToString(paramMap.get("cntrAmount"),"0");
		int moneyOnlyNumeric = Integer.parseInt(cntrAmount.replaceAll(",", ""));
		// 신용카드,네이버페이
		if(metpaySe.equals("01") || metpaySe.equals("04")) {
			if( moneyOnlyNumeric < 3000 ){
				resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "수수료 문제로 인해 3,000이하 기부금은 처리할 수 없습니다.\n\n3,000원 이상 기부를 부탁드립니다.");
    		} else if( moneyOnlyNumeric > 10000000 ){
    			resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "기부가능액은 최대 1000만원입니다.");
    		} else {
    			resMap.put("chk_result", "Success");
    		}
			
		} else if(metpaySe.equals("03")) {
			if( moneyOnlyNumeric < 3000 ){
				resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "수수료 문제로 인해 3,000원 이하 기부금은 처리할 수 없습니다.\n\n3,000원 이상 기부를 부탁드립니다.");
    		} else if(moneyOnlyNumeric > 10000000){
    			resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "계좌이체 기부가능액은 최대 1000만원입니다.");
   			} else {
   				resMap.put("chk_result", "Success");
   			}
			
		} else if(metpaySe.equals("02")) {
			if( moneyOnlyNumeric < 3000 ){
				resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "수수료 문제로 인해 3,000원 이하 기부금은 처리할 수 없습니다.\n\n3,000원 이상 기부를 부탁드립니다.");
    		} else if( moneyOnlyNumeric > 1000000 ){
        		resMap.put("chk_result", "Fail");
				resMap.put("chk_message", "휴대폰 기부가능액은 최대 100만원입니다.");
        	} else {
   				resMap.put("chk_result", "Success");
   			}
		} else {
			resMap.put("chk_result", "Success");
		}
		
		return resMap;		
	}
	
	@Override
	public Map<String, String> insertTHP_KakaopayLog(Map<String, String> paramMap) throws Exception {		
		/**** 결제준비 API 요청 */
		paramMap.put("reqPayType", "ready");
		Map<String, String> resMap = kpayRegistApproval( paramMap );
		paramMap.put("tid", resMap.get("tid"));
		/**** 카카오페이로그 등록 */
		int cnt = mapper.insertTHP_KakaopayLog(paramMap);		
		resMap.put("cnt", cnt+"");

		return resMap;
	}

	private Map<String, String> kpayRegistApproval(Map<String, String> paramMap) throws Exception {
		
		Map<String, String> resMap = new HashMap<String, String>();
		
		String reqType = paramMap.get("reqPayType");
		
		//#####################
		// API 요청 전문 생성
		//#####################
		Map<String, String> authMap = new Hashtable<String, String>();
		authMap.put("cid", 					paramMap.get("cid"));
		authMap.put("partner_order_id",		paramMap.get("orderNo"));		
		authMap.put("partner_user_id",		StringUtils.getEncMD5(paramMap.get("mbtlnum")));
			
		String authUrl = "";
		
		if("ready".equals(reqType)) {		// 결제준비
			authUrl = KPAY_API_URL+"/v1/payment/ready";
			
			authMap.put("item_name",			"사랑의열매");
			authMap.put("item_code",			paramMap.get("eventCode"));
			authMap.put("quantity",				"1");
			authMap.put("total_amount", 		paramMap.get("cntrAmount").replaceAll(",", ""));
			authMap.put("tax_free_amount", 		paramMap.get("cntrAmount").replaceAll(",", ""));			
			authMap.put("approval_url",			paramMap.get("approval_url")+"&orderNo="+paramMap.get("orderNo"));
			authMap.put("cancel_url",			paramMap.get("approval_url")+"&orderNo="+paramMap.get("orderNo"));
			authMap.put("fail_url",				paramMap.get("approval_url")+"&orderNo="+paramMap.get("orderNo"));
		
		} else if("approval".equals(reqType)) {		// 결제승인
			authUrl = KPAY_API_URL+"/v1/payment/approve";
			authMap.put("tid",		paramMap.get("tid"));
			authMap.put("pg_token",	paramMap.get("pg_token"));			
		}
		
		HttpUtil httpUtil = new HttpUtil(authUrl);
		httpUtil.setRequestHeader("Authorization", "KakaoAK "+KPAY_APP_ADMIN_KEY);
		
		try{
			//#####################
			// 4.API 통신 시작
			//#####################
			String authResultString = "";
			authResultString = httpUtil.processHTTP(authMap);
			System.out.println("authResultString =>>>"+authResultString);
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
			resMap.put("code","Fail");
			resMap.put("message", ex.getMessage());				
			ex.printStackTrace();
		}
		
		return resMap;		
	}
	
	@Override
	public String insertKpay(Map<String, String> paramMap ) throws Exception {
		int cnt = 0;
		String message = "";
		
		/**** 결제인증번호 세팅 */
		paramMap.put("inicisCrtfcNo", paramMap.get("tid"));
		
		/**** 기부자정보 */
		cnt = mapper.insertTHP_CntrbtrInfoNpay(paramMap);
		/**** 기부자 일시기부정보 */
		cnt = mapper.insertTHP_CntrSinglNpay(paramMap);
		/**** 기부관심분야 */
		cnt = mapper.insertTHP_CntrIntrstNpay(paramMap);
		/**** 정보제공동의 여부 */
		String[] agreeList = paramMap.get("agree_arr").toString().split("-");				
		List<Map> list = new ArrayList<Map>();
		Map<String, String> agreMap = new HashMap<String, String>();
		agreMap.put("cntrSn", paramMap.get("cntrSn"));
		agreMap.put("eventCode", paramMap.get("eventCode"));
		agreMap.put("iemCode", "01");
		agreMap.put("agreAt", agreeList[0]);
		list.add(agreMap);
		agreMap = new HashMap<String, String>();
		agreMap.put("cntrSn", paramMap.get("cntrSn"));
		agreMap.put("eventCode", paramMap.get("eventCode"));
		agreMap.put("iemCode", "02");
		agreMap.put("agreAt", agreeList[1]);
		list.add(agreMap);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);			
		cnt = mapper.insertTHP_CntrInfoAgreNpay(map);
		
		/**** 카카오페이 결제승인 */
		paramMap.put("reqPayType", "approval");
		Map<String, String> parameter = new HashMap<String, String>();
		parameter = kpayRegistApproval( paramMap );	
		
		message = StringUtils.getNullToString(parameter.get("code"));
		if( message.equals("Success") ) {
			// 기부자순번 세팅
			parameter.put("cntrSn", paramMap.get("cntrSn"));
			
		} else {			
			message = (String) parameter.get("message");
			message += "_" + paramMap.get("orderNo");
			logger.error(message);
			//return message;
			throw new Exception(message);
		}
		
		mapper.updateTHP_KakaopayLog(parameter);
			
		message += "_" + paramMap.get("orderNo");
		return message;
	}
	
	@Override
	public int updateTHP_KakaopayLog(Map<String, String> paramMap) throws Exception {
		return mapper.updateTHP_KakaopayLog(paramMap);
	}
	
	@Override
	public Map<String, Object> getKakaopayData(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.getKakaopayData(paramMap));
		return resMap;
	}
	
	@Override
	public Map<String, Object> getKakaopayFrmData(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.getKakaopayFrmData(paramMap));
		return resMap;
	}
}