package com.chest.ct.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chest.ct.service.ImpscntrService;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.service.MailService;
import com.common.util.CookieUtils;
import com.common.util.SessionUtils;
import com.common.util.StringUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.inicis.std.util.SignatureUtil;

@Controller
@RequestMapping(value="/ct/lmpscntr")
public class ImpscntrController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private ImpscntrService service;
    
    @Autowired
    private ComService comService;
    
    @Autowired
    private MailService mailService;
    
    //본인인증 코드
    @Value("#{checkPlus['CHECKPLUS.SITE_CODE']}")
    public String SITECODE;
    		
    //본인인증 사이트 비밀번호
    @Value("#{checkPlus['CHECKPLUS.SITE_PASSWORD']}")
    public String SITEPASSWORD;
    			
    //INIPAY MID
    @Value("#{iniPay['INIPAY.MID_001']}")
    public String MID_001;
    
    //INIPAY SIGNKEY
    @Value("#{iniPay['INIPAY.SIGNKEY_001']}")
    public String SIGNKEY_001;
    
    //네이버페이 CLIENT_ID
    @Value("#{naverPay['NPAY.CLIENT_ID']}")
    public String NPAY_CLIENT_ID;
    
    //네이버페이 CHAINID
    @Value("#{naverPay['NPAY.CHAINID']}")
    public String NPAY_CHAINID;
    
    //네이버페이 MODE (개발/운영)
    @Value("#{naverPay['NPAY.MODE']}")
    public String NPAY_MODE;
    
    private final String _CNTR = "CntrCnsltReqst.";
    
    /***************************************************************************************************
     * ########### 일시기부 개인 ###########
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     *****************************************************************************************************/
    @RequestMapping(value = "/initIndvdl.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initCmreqst(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
//    	mailService.sendMail(paramMap);
    	model.addAttribute("eventCode", 	paramMap.get("eventCode"));
    	model.addAttribute("speclMysAt", paramMap.get("speclMysAt"));   
    	model.addAttribute("setleMthd", paramMap.get("setleMthd"));   
    	
    	model.addAttribute("signKey", 	SIGNKEY_001);    	
    	model.addAttribute("mid", MID_001);
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
    	model.addAttribute("intrstRealm", comService.selectCmmnCodeComboString("HP0022", "S"));
    	model.addAttribute("tabIndex", "0");
    	// 네이버페이
    	model.addAttribute("_clientId", NPAY_CLIENT_ID);
    	model.addAttribute("_chainId", NPAY_CHAINID);
    	model.addAttribute("_mode", NPAY_MODE);
    	
        return "chest:/ct/ct_lmpscntr_indvdl_regist_005";
    }
    
    /***************************************************************************************************
     * ########### 일시기부 ARS ###########
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     *****************************************************************************************************/
    @RequestMapping(value = "/initIndvdlArs.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initIndvdlArs(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("eventCode", 	paramMap.get("eventCode"));
    	model.addAttribute("speclMysAt", paramMap.get("speclMysAt"));   
    	
    	model.addAttribute("signKey", 	SIGNKEY_001);    	
    	model.addAttribute("mid", MID_001);
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
    	model.addAttribute("intrstRealm", comService.selectCmmnCodeComboString("HP0022", "S"));
    	model.addAttribute("tabIndex", "1");
        return "chest:/ct/ct_lmpscntr_indvdl_regist_005_ARS";
    }
    
    /***************************************************************************************************
     * ########### 일시기부 기업 상담 ###########
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     *****************************************************************************************************/
    @RequestMapping(value = "/initEntrprs.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initEntrprs(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("eventCode", 	paramMap.get("eventCode"));
    	model.addAttribute("speclMysAt", paramMap.get("speclMysAt"));   
    	
    	model.addAttribute("reqstManageTy", 	PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);    	
        return "chest:/ct/ct_lmpscntr_entrprs_regist_006";
    }
    
    /***
     * 결제완료 후 나타나는 페이지
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/INIStdPayReturn.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String INIStdPayReturn(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	System.out.println("paramMap webReturn =====" + SessionUtils.setSessionInfo(paramMap) );
    	//check validator
    	Map<String, String> chkMap = service.checkValidator( paramMap );
    	model.addAttribute("chk_result", chkMap.get("chk_result") );
    	model.addAttribute("chk_message", chkMap.get("chk_message") );
    	
    	model.addAttribute("signKey", 	SIGNKEY_001 );    	
    	model.addAttribute("mid", 		MID_001);
    	return "chest:/ct/INIStdPayReturn";
    }
    
    /***
     * 결제완료 후 나타나는 페이지(네이버페이)
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/NaverPayReturn.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String NaverPayReturn(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {    	
    	model.addAttribute("orderNo", paramMap.get("orderNo"));
    	model.addAttribute("speclMysAt", paramMap.get("speclMysAt"));
    	model.addAttribute("eventCode", paramMap.get("eventCode"));
    	model.addAttribute("payType", paramMap.get("payType"));
    	model.addAttribute("popupYn", paramMap.get("popupYn"));
    	return "chest:/ct/NaverPayReturn";
    }
    
    /***
     * 네이버페이 결제창 호출후 리턴 페이지 (옵션)
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/NaverPayAuthReturn.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String NaverPayAuthReturn(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception {
    	logger.debug("paramMap NaverPayAuthReturn =====" + SessionUtils.setSessionInfo(paramMap) );
		
		if("Success".equals(paramMap.get("resultCode"))){
	    	Map<String, Object> detailMap = service.getNaverpayFrmData(paramMap);
	    	ComCamelMap resMap = (ComCamelMap)detailMap.get("detail");
			String jsonStr = (String)resMap.get("resultMssage");
			
			Map<String, String> tempMap = new ObjectMapper().readValue(jsonStr, Map.class);
			tempMap.put("paymentId", paramMap.get("paymentId"));	// 네이버페이 결제번호
			tempMap.put("timestamp", paramMap.get("orderNo"));
			// 기부정보 저장
			try {
				service.insertNpay(tempMap);
			} catch(Exception e) {
				model.addAttribute("resultCode", "Fail");
				model.addAttribute("resultMessage", "결재 실패. 잠시 후 재시도 바랍니다.");
			}
			// 세션 저장
			session.setAttribute("MBTLNUM", tempMap.get("mbtlnum"));
			
			model.addAttribute("orderNo", paramMap.get("orderNo"));
	    	model.addAttribute("speclMysAt", tempMap.get("speclMysAt"));
	    	model.addAttribute("eventCode", tempMap.get("eventCode"));
	    	
		} else {
			model.addAttribute("resultCode", "Fail");
			model.addAttribute("resultMessage", paramMap.get("resultMessage"));		
		}
		
		model.addAttribute("payType", "naverpay");
    	
		return "/chest/ct/KakaoPayReturn";
    }
    
    /***
     * 모바일 결제완료시 승인요쳥
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mobileResult.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String mobileResult(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	System.out.println( "paramMap mobileResult ==" + paramMap.toString() );
    	Map<String, String> resultMap = new HashMap<String, String>();
    	resultMap.putAll(paramMap);
    	
    	String P_STATUS = resultMap.get("P_STATUS");
    	String jihoe = resultMap.get("jihoe");
    	
    	if( P_STATUS.equals("00") ) {
    		resultMap.put("url", resultMap.get("P_REQ_URL"));
    		resultMap.put("P_TID", resultMap.get("P_TID"));
    		resultMap.put("P_MID", PropertyConfig.getPropertiesCon("properties/iniPay", "INIPAY.MID_" + jihoe));
    		
    		
    		ImpscntrController http = new ImpscntrController();
        	StringBuffer result = new StringBuffer();
    		try {
    			result = http.sendPost( resultMap );
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    		String[] splitArr = result.toString().split("&");
    		
    		for( int i=0; i<splitArr.length; i++ ) {
    			String[] resultArr = splitArr[i].split("=");
    			if( resultArr.length == 2 ) {
    				resultMap.put( resultArr[0] ,resultArr[1]);
    			}
    		}
    		
    		resultMap.put("orderNo", resultMap.get("P_OID") );
    		resultMap.put("resultCode", P_STATUS);
    		resultMap.put("resultMsg", resultMap.get("P_RMESG1"));
    		resultMap.put("TotPrice", resultMap.get("P_AMT"));
    		resultMap.put("inicisCrtfcNo", resultMap.get("P_TID"));
    		if( resultMap.get("P_TYPE").equals("CARD") ) {
    			resultMap.put("CARD_Code", resultMap.get("P_FN_CD1"));
    			resultMap.put("CARD_Num", resultMap.get("P_CARD_NUM"));
    		}
    		int cnt = service.insert(resultMap);
    		
    	} else {
    		model.addAttribute("resultCode","Fail");
    		model.addAttribute("resultMessage", resultMap.get("P_RMESG1"));
    	}
    	model.addAttribute("orderNo", resultMap.get("P_OID") );
    	model.addAttribute("eventCode", resultMap.get("eventCode") );
    	model.addAttribute("speclMysAt", resultMap.get("speclMysAt") );
    	model.addAttribute("mbtlnum", resultMap.get("mbtlnum") );
    	
        return "chest:/ct/mobileResult";
    }
    
    /***
     * 결제창을 띄우고 취소를 눌렀을 때 처리되는 메소드 
     * 아무처리도 하지 않고 결제창만 닫아준다
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/close.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String close(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	return "/common/iniPay/close";
    }
    
    /***
     * 로그 테이블 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertTHP_InipayLog.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insertTHP_InipayLog(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	
    	//check validator
    	Map<String, String> chkMap = service.checkValidator( paramMap );
    	String chk_result = chkMap.get("chk_result");
    	if(!chk_result.equals("Success")) {
    		model.addAttribute("chk_result", chk_result );
    		model.addAttribute("chk_message", chkMap.get("chk_message") );
    		return "jsonView";
    	}
    	
    	String jihoe = paramMap.get("jihoe");
    	String timestamp = SignatureUtil.getTimestamp();
    	//mid 가져오고
    	String mid = PropertyConfig.getPropertiesCon("properties/iniPay", "INIPAY.MID_" + jihoe);
    	//사인키도 가져오고
    	String signKey = PropertyConfig.getPropertiesCon("properties/iniPay", "INIPAY.SIGNKEY_" + jihoe);
    	//oid 도 생성 해주고
    	String oid = mid + "_" +  timestamp;
    	String mKey = SignatureUtil.hash(signKey, "SHA-256");
    	
    	model.addAttribute("signKey", signKey);
    	model.addAttribute("mid", mid);
    	model.addAttribute("oid", oid);
    	model.addAttribute("mKey", mKey);
    	
    	
    	//EVENT_CODE 로 SPECL_MYS_AT 값 가져와서 넘겨줌
    	String speclMysAt = service.getSpeclMyAt( paramMap );
    	
    	//String param = "?id=" + signKey + "&mid=" + mid + "&eventCode=" + paramMap.get("eventCode") + "&speclMysAt=" + paramMap.get("speclMysAt");
    	String param = "?id=" + signKey + "&mid=" + mid + "&eventCode=" + paramMap.get("eventCode") + "&speclMysAt=" + speclMysAt + "&metpaySe=" + paramMap.get("metpaySe") + "&cntrAmount=" + paramMap.get("cntrAmount");
    	model.addAttribute("returnUrl", "/INIStdPayReturn.do" + param);
    	model.addAttribute("timestamp", timestamp );
    	
    	paramMap.put("timestamp", timestamp);
    	paramMap.put("mid", mid);
    	
    	System.out.println("paramMap ===" + paramMap.toString()  );
    	model.addAttribute("result", service.insertTHP_InipayLog(SessionUtils.setSessionInfo(paramMap) ));    	
        return "jsonView";
    }
    
    /***
     * 네이버페이로그 테이블 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertTHP_NaverpayLog.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insertTHP_NaverpayLog(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	
    	String jihoe = paramMap.get("jihoe");
    	String npayChainid = PropertyConfig.getPropertiesCon("properties/naverPay", "NPAY.CHAINID_" + jihoe);
    	String timestamp = SignatureUtil.getTimestamp();
    	
    	ObjectMapper omp = new ObjectMapper();
    	String fromJson = omp.writeValueAsString(paramMap);
    	paramMap.put("message", fromJson);
    	
    	model.addAttribute("timestamp", timestamp );
    	// 네이버페이
    	model.addAttribute("_clientId", NPAY_CLIENT_ID);
    	model.addAttribute("_chainId", npayChainid);
    	model.addAttribute("_mode", NPAY_MODE);
    	
    	paramMap.put("timestamp", timestamp);
    	
    	model.addAttribute("result", service.insertTHP_NaverpayLog(SessionUtils.setSessionInfo(paramMap) ));    	
        return "jsonView";
    }
    
    @RequestMapping(value = "/updateTHP_NaverpayLog.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String updateTHP_NaverpayLog(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	paramMap.put("code", paramMap.get("resultCode"));
    	paramMap.put("message", paramMap.get("resultMessage"));
    	
    	model.addAttribute("resultCode", paramMap.get("resultCode"));
    	model.addAttribute("resultMessage", paramMap.get("resultMessage"));
    	model.addAttribute("result", service.updateTHP_NaverpayLog(SessionUtils.setSessionInfo(paramMap) ));    	
        return "jsonView";
    }
    
    @RequestMapping(value = "/makeSignatureData.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String makeSignature(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	Map<String, String> signParam = new HashMap<String, String>();
    	signParam.put("oid", paramMap.get("oid")); 										// 필수
    	signParam.put("price", paramMap.get("price").replaceAll(",", ""));				// 필수
    	signParam.put("timestamp", paramMap.get("timestamp"));							// 필수
    	String signature = SignatureUtil.makeSignature(signParam);
    	model.addAttribute("signature", signature);
    	model.addAttribute("price", paramMap.get("price").replaceAll(",", ""));
    	model.addAttribute("result", "ok");
        return "jsonView";
    }
    
    /***
     * SELECT BOX 
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectSelList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectSelList(@RequestParam ("arr") String json , Model model) throws Exception {
    	
    	Map<String, Object> codeList = null;    	
    	Map<String , String> param =  new HashMap<String ,String>(); 
    	ObjectMapper om = new ObjectMapper();
		List<Map<String, String>> m = om.readValue( json, new TypeReference<List<Map<String, String>>>(){});
		for( int i=0; i<m.size(); i++ ) {
			Map<String, String> list = m.get(i);
			param = new HashMap<String ,String>();  
			for (Map.Entry<String, String> entry : list.entrySet()) {
				String key = entry.getKey();                
		        Object value = entry.getValue();
		        param.put(key, (String) value);
			}
			codeList = new HashMap<String, Object>();
			codeList = service.selectCodeList(param);
			model.addAttribute("codeList"+i, (List<ComCamelMap>) codeList.get("listInfo"));
		}
	
        //은행목록
 		Map<String, String> paramMap = new HashMap<String, String>(); 
        Map<String, Object> resMap = service.selectBankList(paramMap);
        model.addAttribute("bankList", (List<ComCamelMap>) resMap.get("listInfo"));
        
        //결제방법목록
        Map<String, Object> resStmMap = service.selectSetleMthdList(param);
        model.addAttribute("setleMthdList", (List<ComCamelMap>) resStmMap.get("listInfo"));
        
        return "jsonView";
    }
    
    /***
     * 본인인증 성공시 들어가는 페이지
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkPlusSuccess.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String checkPlusSuccess(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
        return "/common/checkPlus/checkplus_success";
    }
    
    /***
     * 본인인증 실패시 들어가는 페이지
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkFail.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String checkFail(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
        return "/common/checkPlus/checkplus_fail";
    }
    
    /***
     * 기부하기 정보 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insert(@RequestParam Map<String, String> paramMap, HttpSession session, Model model ) throws Exception {
    	model.addAttribute("result", service.insert(paramMap));
    	session.setAttribute("MBTLNUM", paramMap.get("mbtlnum"));
        return "jsonView";
    }
    
    /***
     * 기부하기 정보 저장(네이버페이)
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertNpay.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insertNpay(@RequestParam Map<String, String> paramMap, HttpSession session, Model model ) throws Exception {
    	
    	//check validator
    	Map<String, String> chkMap = service.checkValidator( paramMap );
    	if("Fail".equals(chkMap.get("chk_result"))) {
    		model.addAttribute("result", chkMap.get("chk_message"));
    		return "jsonView";
    	}
    	
    	String resStr = "";
    	try {
    		resStr = service.insertNpay(paramMap);
    	} catch(Exception e) {
    		resStr = e.getMessage();
    	}
    	// 세션 저장
    	session.setAttribute("MBTLNUM", paramMap.get("mbtlnum"));

    	model.addAttribute("result", resStr);
    	
        return "jsonView";
    }
    
    /***
     * 댓글 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertTHP_FundMysAnswer.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insertTHP_FundMysAnswer(@RequestParam Map<String, String> paramMap, Model model ) throws Exception {
    	model.addAttribute("result", service.insertTHP_FundMysAnswer(SessionUtils.setSessionInfo(paramMap) ));
        return "jsonView";
    }
    
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/getInipayData.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String payInfo(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {
    	paramMap.put("mbtlnum", (String)session.getAttribute("MBTLNUM"));
    	Map<String, Object> resMap = service.getInipayData(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detailInfo", (Map<String, String>) resMap.get("detail"));
        return "jsonView";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/getNaverpayData.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String getNaverpayData(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {    	
    	paramMap.put("mbtlnum", (String)session.getAttribute("MBTLNUM"));
    	Map<String, Object> resMap = service.getNaverpayData(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detailInfo", (Map<String, String>) resMap.get("detail"));
        return "jsonView";
    }
    
    /***
     * 기부싱딤하기 정보 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertCompany.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insertCompany(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	model.addAttribute("result", service.insertCompany(SessionUtils.setSessionInfo(paramMap)));
        return "jsonView";
    }
    
    /***
     * 이니시스 휴대폰 결제시 승인요청 
     * @param paramMap
     * @return
     * @throws Exception
     */
    private StringBuffer sendPost( Map<String, String> paramMap ) throws Exception {
		URL obj = new URL( paramMap.get("url"));
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		con.setRequestMethod("POST");
		
		String param= "P_TID="+paramMap.get("P_TID");
		param += "&P_MID="+paramMap.get("P_MID");
		
		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(param);
		wr.flush();
		wr.close();

		BufferedReader in = new BufferedReader( new InputStreamReader(con.getInputStream(), "EUC-KR"));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		
		return response;
	}
    
    /***
     * 카카오페이로그 테이블 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertTHP_KakaopayLog.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insertTHP_KakaopayLog(@RequestParam Map<String, String> paramMap, Model model, HttpServletRequest request) throws Exception {
    	
    	//check validator
    	Map<String, String> chkMap = service.checkValidator( paramMap );
    	if("Fail".equals(chkMap.get("chk_result"))) {
    		model.addAttribute("chk_result", "Fail");
    		model.addAttribute("chk_message", chkMap.get("chk_message"));
    		return "jsonView";
    	}
		
		String returnUrl = request.getRequestURL().toString().replace(request.getRequestURI(), "") + "/ct/lmpscntr/KakaoPayReturn.do";
		
		/**** 로그테이블 저장 및 카카오페이 결제준비 API 호출 */
    	String jihoe = paramMap.get("jihoe");
    	String cid = PropertyConfig.getPropertiesCon("properties/kakaoPay", "KPAY.ONECID_" + jihoe);
    	String timestamp = SignatureUtil.getTimestamp();
    	
    	ObjectMapper omp = new ObjectMapper();
    	String frmJson = omp.writeValueAsString(paramMap);
    	paramMap.put("frmData", frmJson);
    	paramMap.put("orderNo", timestamp);
		paramMap.put("cid", cid);
		paramMap.put("partner_order_id", timestamp);
		paramMap.put("partner_user_id", StringUtils.getEncMD5(paramMap.get("mbtlnum")));
		paramMap.put("approval_url", returnUrl+"?reqType=approval");
		paramMap.put("cancel_url", returnUrl+"?reqType=cancel");
		paramMap.put("fail_url", returnUrl+"?reqType=fail");
		paramMap.put("referer", request.getHeader("referer"));
		
		Map<String, String> resMap = service.insertTHP_KakaopayLog(SessionUtils.setSessionInfo(paramMap));
		model.addAttribute("timestamp", timestamp );
    	// 카카오페이 응답 세팅
    	model.addAttribute("tid", resMap.get("tid"));		// 결제 고유 번호
    	model.addAttribute("next_redirect_pc_url", resMap.get("next_redirect_pc_url"));	// 카카오톡으로 결제 요청 메시지(TMS)를 보내기 위한 사용자 정보 입력 화면
    	model.addAttribute("next_redirect_mobile_url", resMap.get("next_redirect_mobile_url"));	// 카카오톡 결제 페이지 Redirect URL
    	model.addAttribute("result_cnt", resMap.get("cnt"));    // INSERT CNT
        return "jsonView";
    }
	
	/***
     * 카카오페이 리턴 페이지
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/KakaoPayReturn.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String KakaoPayReturn(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception {
    	logger.debug("paramMap KakaoPayReturn =====" + paramMap );
		
		if("approval".equals(paramMap.get("reqType"))){
			
			if(StringUtils.isNull(paramMap.get("pg_token"))) {
				paramMap.put("code","Fail");
				paramMap.put("message", "결제취소 되었습니다.");
				service.updateTHP_KakaopayLog(paramMap);
				
				model.addAttribute("resultCode", "Fail");
				model.addAttribute("resultMessage", "결제취소 되었습니다.");	
			} else {			
				// form data 가져오기	frm_data, cid, tid, partner_order_id, partner_user_id
		    	Map<String, Object> detailMap = service.getKakaopayFrmData(paramMap);
		    	ComCamelMap resMap = (ComCamelMap)detailMap.get("detail");
				String jsonStr = (String)resMap.get("frmData");
				
				Map<String, String> tempMap = new ObjectMapper().readValue(jsonStr, Map.class);
				tempMap.put("cid", String.valueOf(resMap.get("cid")));
				tempMap.put("tid", String.valueOf(resMap.get("tid")));
				tempMap.put("partner_order_id", String.valueOf(resMap.get("orderNo")));
				tempMap.put("partner_user_id", StringUtils.getEncMD5(String.valueOf(resMap.get("mbtlnum"))));
				tempMap.put("pg_token", paramMap.get("pg_token"));	
				tempMap.put("orderNo", paramMap.get("orderNo"));
				// 기부정보 저장
				try {
					service.insertKpay(tempMap);					
					// 세션 저장
			    	session.setAttribute("MBTLNUM", tempMap.get("mbtlnum"));
					
					model.addAttribute("orderNo", paramMap.get("orderNo"));
			    	model.addAttribute("speclMysAt", tempMap.get("speclMysAt"));
			    	model.addAttribute("eventCode", tempMap.get("eventCode"));
			    	
				} catch(Exception e) {					
					paramMap.put("code","Fail");
					paramMap.put("message", e.getMessage());
					service.updateTHP_KakaopayLog(paramMap);
					
					model.addAttribute("resultCode", "Fail");
					model.addAttribute("resultMessage", "결제 실패. 잠시 후 재시도 바랍니다.");
					
					e.printStackTrace();
				}
				
			}
	    	
		} else if("fail".equals(paramMap.get("reqType"))) { 
			paramMap.put("code","Fail");
			paramMap.put("message", paramMap.get("resultMessage"));
			service.updateTHP_KakaopayLog(paramMap);
			
			model.addAttribute("resultCode", "Fail");
			model.addAttribute("resultMessage", paramMap.get("resultMessage"));		
		} else if("cancel".equals(paramMap.get("reqType"))) {
			paramMap.put("code","Fail");
			paramMap.put("message", paramMap.get("resultMessage"));			
			service.updateTHP_KakaopayLog(paramMap);
			
			model.addAttribute("resultCode", "Fail");
			model.addAttribute("resultMessage", paramMap.get("resultMessage"));		
		}
		
		model.addAttribute("payType", "kakaopay");
    	
		return "/chest/ct/KakaoPayReturn";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/getKakaopayData.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String getKakaopayData(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {    	
    	paramMap.put("mbtlnum", (String)session.getAttribute("MBTLNUM"));
    	Map<String, Object> resMap = service.getKakaopayData(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detailInfo", (Map<String, String>) resMap.get("detail"));
        return "jsonView";
    }
    
}