package com.chest.ct.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import com.chest.ct.service.FdrmcntrService;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.RequestProc;
import com.common.util.SessionUtils;
//import com.common.util.StringUtils;
import org.apache.commons.lang3.StringUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.inicis.std.util.SignatureUtil;
import com.chest.scheduler.KpayRecurReqst;
import com.chest.scheduler.NpayRecurReqst;;

@Controller
@RequestMapping(value="/ct/fdrmcntr")
public class FdrmcntrController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private FdrmcntrService service;
    
    @Autowired
    private ComService comService;
    
    @Autowired
    private NpayRecurReqst npayBatch;
    
    @Autowired
    private KpayRecurReqst kpayBatch;
    
    @Value("#{chest['gen.filePath']}")
    public String genFilePath;
    
    //본인인증 코드
    @Value("#{checkPlus['CHECKPLUS.SITE_CODE']}")
    public String SITECODE;
    		
    //본인인증 사이트 비밀번호
    @Value("#{checkPlus['CHECKPLUS.SITE_PASSWORD']}")
    public String SITEPASSWORD;
    			
    //계좌인증 인증키
    @Value("#{ksnet['KSNET.AUTH_KEY']}")
    public String AUTH_KEY;
    
    //계좌인증 업체코드
    @Value("#{ksnet['KSNET.FCS_CD']}")
    public String FCS_CD;
    
    //파일다운로드 경로
    @Value("#{chest['DOWNLOAD.FILEPATH']}")
    public String DOWN_FILE;
    
    //INIPAY MID
    @Value("#{iniPay['INIPAY.BILL_MID']}")
    public String BILL_MID_001;
    
    //INIPAY SIGNKEY
    @Value("#{iniPay['INIPAY.SIGNKEY_001']}")
    public String SIGNKEY_001;
    
    //ARS
    @Value("#{iniPay['INIPAY.ARS_URL']}")
    public String ARS_URL;
    
    //계좌인증
    @Value("#{iniPay['INIPAY.KSNET_URL']}")
    public String _KSNET_URL;
    
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
    
    @RequestMapping(value = "/test.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String test(@RequestParam Map<String, String> paramMap, ModelMap model ,HttpServletRequest request ) throws Exception {
        return "chest:/test/pdfTest";
    }
    
    /***
     * 
     ***/
    @RequestMapping(value = "/cancel.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String cancel(@RequestParam Map<String, String> paramMap, ModelMap model ,HttpServletRequest request ) throws Exception {
        return "chest:/test/cancel";
    }
    
    @RequestMapping(value = "/schedulerTrigger.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String schedulerTrigger(@RequestParam Map<String, String> paramMap, ModelMap model ,HttpServletRequest request ) throws Exception {
    	
    	if("password1!".equals(paramMap.get("execpass"))) {
    		if("HIST".equals(paramMap.get("type"))) {	// 네이버페이 결제내역
    			if(StringUtils.isBlank(paramMap.get("paymentId"))) {
    				npayBatch.NpayHistory();
    			} else {
    				npayBatch.getNpayHistoryWPayId(paramMap.get("paymentId"));
    			}
    			
    		} else if("APPR".equals(paramMap.get("type"))) {	// 네이버 정기기부 결제승인
    			npayBatch.NpayScheduler();
    		} else if("KAPPR".equals(paramMap.get("type"))) {	// 카카오 정기기부 결제승인
    			kpayBatch.KpayScheduler();
    		} else if("KDPHIST".equals(paramMap.get("type"))) {	// 카카오 입금내역
    			if(StringUtils.isBlank(paramMap.get("target_date"))) {
    				kpayBatch.KpayHistory();
    			} else {
    				kpayBatch.getKakaoDeposits(paramMap.get("target_date"));
    			}
    		} else if("KSTHIST".equals(paramMap.get("type"))) {	// 카카오 정산내역
    			if(StringUtils.isBlank(paramMap.get("target_date"))) {
    				kpayBatch.KpaySettleHistory();
    			} else {
    				kpayBatch.getKakaoSettlements(paramMap.get("target_date"));
    			}
    		}
    	}
    	
    	model.addAttribute("genFilePath", StringUtils.replace(genFilePath, "\\", "\\\\"));
        return "base";
    }
    
    /***************************************************************************************************
     * ########### 매월기부 개인 ###########
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     *****************************************************************************************************/
    @RequestMapping(value = "/initEvemthcntr.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initCmreqst(@RequestParam Map<String, String> paramMap, ModelMap model ,HttpServletRequest request ) throws Exception {
    	model.addAttribute("eventCode", 	paramMap.get("eventCode"));
    	model.addAttribute("speclMysAt", paramMap.get("speclMysAt"));
    	model.addAttribute("setleMthd", paramMap.get("setleMthd"));   
    	
    	model.addAttribute("signKey", 	SIGNKEY_001 );    	
    	model.addAttribute("mid", 		BILL_MID_001);  	
    	model.addAttribute("downPath", DOWN_FILE );
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
    	model.addAttribute("intrstRealm", comService.selectCmmnCodeComboString("HP0022", "S"));
    	// 네이버페이
    	model.addAttribute("_clientId", NPAY_CLIENT_ID);
    	model.addAttribute("_chainId", NPAY_CHAINID);
    	model.addAttribute("_mode", NPAY_MODE);
    	model.addAttribute("_actionType", "NEW");
        return "chest:/ct/ct_fdrmcntr_evemthcntr_regist_001";
    }

    /***************************************************************************************************
     * ########### 착한가정  ###########
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     *****************************************************************************************************/
    @RequestMapping(value = "/initNicehome.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initNicehome(@RequestParam Map<String, String> paramMap, ModelMap model ) throws Exception {
    	model.addAttribute("eventCode", 	paramMap.get("eventCode"));
    	model.addAttribute("speclMysAt", paramMap.get("speclMysAt"));   
    	model.addAttribute("signKey", 	SIGNKEY_001 );    	
    	model.addAttribute("mid", 		BILL_MID_001);
    	model.addAttribute("downPath", DOWN_FILE );
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
    	model.addAttribute("intrstRealm", comService.selectCmmnCodeComboString("HP0022", "S"));
    	// 네이버페이
    	model.addAttribute("_clientId", NPAY_CLIENT_ID);
    	model.addAttribute("_chainId", NPAY_CHAINID);
    	model.addAttribute("_mode", NPAY_MODE);
    	model.addAttribute("_actionType", "NEW");
        return "chest:/ct/ct_fdrmcntr_nicehome_regist_002";
    }
    
    /***************************************************************************************************
     * ########### 착한가게  ###########
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     *****************************************************************************************************/
    @RequestMapping(value = "/initNicestore.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initNicestore(@RequestParam Map<String, String> paramMap, ModelMap model ) throws Exception {
    	model.addAttribute("eventCode", 	paramMap.get("eventCode"));
    	model.addAttribute("speclMysAt", paramMap.get("speclMysAt"));   
    	
    	String myscl = "0";
    	model.addAttribute("signKey", 	SIGNKEY_001 );    	
    	model.addAttribute("mid", 		BILL_MID_001); 
    	//탭 구분값
    	if( paramMap.containsKey("myscl") ) {
    		myscl = paramMap.get("myscl");
    	}
    	model.addAttribute("myscl", 		myscl);    	
    	model.addAttribute("downPath", DOWN_FILE );
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
    	model.addAttribute("intrstRealm", comService.selectCmmnCodeComboString("HP0022", "S"));
    	// 네이버페이
    	model.addAttribute("_clientId", NPAY_CLIENT_ID);
    	model.addAttribute("_chainId", NPAY_CHAINID);
    	model.addAttribute("_mode", NPAY_MODE);
    	model.addAttribute("_actionType", "NEW");
        return "chest:/ct/ct_fdrmcntr_nicestore_regist_003";
    }
    
    /***************************************************************************************************
     * ########### 착한일터  ###########
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     *****************************************************************************************************/
    @RequestMapping(value = "/initNicespt.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initNicespt(@RequestParam Map<String, String> paramMap, ModelMap model ) throws Exception {
    	model.addAttribute("eventCode", 	paramMap.get("eventCode"));
    	model.addAttribute("speclMysAt", paramMap.get("speclMysAt"));   
    	
    	model.addAttribute("signKey", 	SIGNKEY_001 );    	
    	model.addAttribute("mid", 		BILL_MID_001);    	
    	model.addAttribute("downPath", DOWN_FILE );
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
    	model.addAttribute("intrstRealm", comService.selectCmmnCodeComboString("HP0022", "S"));
    	// 네이버페이
    	model.addAttribute("_clientId", NPAY_CLIENT_ID);
    	model.addAttribute("_chainId", NPAY_CHAINID);
    	model.addAttribute("_mode", NPAY_MODE);
    	model.addAttribute("_actionType", "NEW");
        return "chest:/ct/ct_fdrmcntr_nicespt_regist_004";
    }
    
    /***
     * SELECT BOX 
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/payInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String payInfo(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {
    	paramMap.put("mbtlnum", (String)session.getAttribute("MBTLNUM"));
    	Map<String, Object> resMap = service.payInfo(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detailInfo", (Map<String, String>) resMap.get("detail"));
        return "jsonView";
    }
    
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
     * 네이버페이 인증 정보 세팅
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getNaverpayProperties.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String getNaverPayProperties(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	String jihoe = paramMap.get("jihoe");
    	String npayChainid = PropertyConfig.getPropertiesCon("properties/naverPay", "NPAY.CHAINID_" + jihoe);
    	logger.debug("getNaverpayProperties npayChainid ===" + npayChainid );
    	
    	String timestamp = SignatureUtil.getTimestamp();    	
    	ObjectMapper omp = new ObjectMapper();
    	String fromJson = omp.writeValueAsString(paramMap);
    	paramMap.put("message", fromJson);
    	paramMap.put("timestamp", timestamp);
    	
    	model.addAttribute("chainId", npayChainid );
    	model.addAttribute("timestamp", timestamp );    	
    	model.addAttribute("result_cnt", service.insertTHP_NaverpayLog(SessionUtils.setSessionInfo(paramMap) ));
    	
        return "jsonView";
    }
    
    /***
     * 기부하기 정보 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insert(@RequestParam Map<String, String> paramMap, HttpSession session, MultipartRequest multipartRequest , Model model , HttpServletRequest request ) throws Exception {
    	
    	paramMap.put("reqPage", request.getHeader("referer"));
    	//check validator
    	Map<String, String> chkMap = service.checkValidator( paramMap );
    	String chk_result = chkMap.get("chk_result");
    	if(!chk_result.equals("Success")) {
    		model.addAttribute("chk_result", chk_result );
    		model.addAttribute("chk_message", chkMap.get("chk_message") );
    		model.addAttribute("result", chkMap.get("chk_message"));
    		return "jsonView";
    	}
    	
    	// 세션 저장
    	session.setAttribute("MBTLNUM", paramMap.get("mbtlnum"));
    	
    	model.addAttribute("result", service.insert(SessionUtils.setSessionInfo(paramMap), multipartRequest , request));
    	model.addAttribute("timestamp", SignatureUtil.getTimestamp() );    	
        return "jsonView";
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
    	model.addAttribute("cntrSn", paramMap.get("cntrSn"));
    	model.addAttribute("popupYn", paramMap.get("popupYn"));
    	return "chest:/ct/inpayResult";
    }
    
    /***
     * 네이버페이 리턴값 기부하기 정보 저장(옵션_모바일웹)
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/NpayAuthReturn.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String NpayAuthReturn(@RequestParam Map<String, String> paramMap, HttpSession session, Model model , HttpServletRequest request) throws Exception {
    	
    	String resultCode = (String) paramMap.get("resultCode");    	
    	if("Success".equals(resultCode)) {	
    		
    		Map<String, Object> detailMap = service.getNaverpayFrmData(paramMap);
        	ComCamelMap resMap = (ComCamelMap)detailMap.get("detail");
    		String jsonStr = (String)resMap.get("resultMssage");
    		
    		Map<String, String> tempMap = new ObjectMapper().readValue(jsonStr, Map.class);
    		tempMap.put("reserveId", paramMap.get("reserveId"));			// 등록 예약 번호
    		tempMap.put("tempReceiptId", paramMap.get("tempReceiptId"));	// 임시 접수 번호
			tempMap.put("timestamp", paramMap.get("orderNo"));
    		
    		
			String result = service.insert(SessionUtils.setSessionInfo(tempMap), null ,request);
			if(result.indexOf("success") >= 0) {
		    	String cntrSn = result.substring(result.lastIndexOf("_")+1);			
		    	model.addAttribute("resultCode", "Success" );
		    	model.addAttribute("cntrSn", cntrSn);
			} else {
				model.addAttribute("resultCode", "Fail" );
				model.addAttribute("resultMessage", result);
			}
			
			// 세션 저장
			session.setAttribute("MBTLNUM", tempMap.get("mbtlnum"));
						
    	} else {
    		model.addAttribute("resultCode", "Fail" );
			model.addAttribute("resultMessage", paramMap.get("resultMessage"));
    	}
        
    	return "chest:/ct/inpayResult";
    }
    
    /***
     * ARS 인증
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/arsCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String arsCheck(@RequestParam Map<String, String> paramMap, ModelMap model , HttpServletRequest request ) throws Exception {
    	
    	StringBuffer conPath = request.getRequestURL(); 
    	String path = String.valueOf(conPath);
    	
    	FdrmcntrController http = new FdrmcntrController();
    	StringBuffer result = new StringBuffer();
		try {
			result = http.sendPost( paramMap , ARS_URL );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<String, Object> rs = new ObjectMapper().readValue(result.toString(), HashMap.class) ;
    	model.addAttribute("result", rs );
    	return "jsonView";
    }
    
	/***
	 * 계좌인증
	 * @param paramMap
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "/accountCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String accountCheck(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	
    	StringBuffer result = new StringBuffer();
		try {
			result = accountCheck( paramMap );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<String, Object> rs = new ObjectMapper().readValue(result.toString(), HashMap.class) ;
    	model.addAttribute("result", rs );
    	return "jsonView";
    }
    
    /***
     * 기부하기 정보 저장
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
     * ars 인증 
     * @param paramMap
     * @return
     * @throws Exception
     */
    private StringBuffer sendPost( Map<String, String> paramMap , String ARS_URL ) throws Exception {
    	System.out.println("paramMap ===" + paramMap.toString());
		String dateTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String phoneNumber = paramMap.get("arsPhone1").toString() + paramMap.get("arsPhone2").toString()  + paramMap.get("arsPhone3").toString() ;
		URL obj = new URL(ARS_URL);
		ignoreSsl();
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		con.setRequestMethod("POST");
		String param= "authReqNumber=" + UUID.randomUUID();
		String authKeyNumber = param;
		param += "&requestTime=" + dateTime;
		param += "&serviceType=03";
		param += "&serviceCode=0001";
		param += "&companyCode=43417";
		param += "&phoneNumber=" + phoneNumber; 
		param += "&authNumber=1";
		param += "&info_1=" + paramMap.get("dpstr"); 			//이름
		param += "&info_2=" + paramMap.get("brthdy");			//생년월일
		param += "&info_3=" + paramMap.get("acnutBank");		//은행
		param += "&info_4=" + paramMap.get("acnutno");			//계좌번호
		
		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.write( param.getBytes("UTF-8") );
		wr.flush();
		wr.close();

		BufferedReader in = new BufferedReader( new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		response.append("authKeyNumber=" + authKeyNumber);
		System.out.println( "response===" + response.toString());
		return response;
	}
    
    
    /***
     * 게좌 인증 
     * @param paramMap
     * @return
     * @throws Exception
     */
    private StringBuffer accountCheck( Map<String, String> paramMap ) throws Exception {
    	StringBuffer response = new StringBuffer();
    	JSONObject jsonReq = new JSONObject();
    	JSONArray jsonArray = new JSONArray();
    	JSONObject jsonReqData = new JSONObject();
    	
    	try {
			//인증키	ZkweNiCtRGMt2jPHJRlC
			jsonReq.put("auth_key",     AUTH_KEY);	//필수 : Auth_key 
			jsonReqData.put("fcs_cd",     FCS_CD);		//필수 : 계좌인증 업체코드
			jsonReqData.put("seq_no",     "000001");
			jsonReqData.put("bank_cd",     paramMap.get("bank_cd"));	//은행 코드
			jsonReqData.put("acct_no",     paramMap.get("acct_no"));	//계좌번호	
			jsonReqData.put("id_no",     "");
			jsonReqData.put("amount",     "0");
		
			jsonArray.add(jsonReqData);
			jsonReq.put("reqdata", jsonArray);
//			System.out.println( "REQ DATA:" +  jsonReq.toString() );
			
		    JSONObject jsonResp = new RequestProc().sendPacket(_KSNET_URL, jsonReq);
		    response.append(jsonResp);
		    
//			System.out.println( "RESP DATA:" +  jsonResp.toString() );
//			System.out.println("name:"+(String) jsonResp.get("name"));
//		    System.out.println("reply:"+(String) jsonResp.get("reply"));
//		    System.out.println("reply_msg:"+(String) jsonResp.get("reply_msg"));
        }
        catch(Exception e) {
        	System.out.println("Exception:"+e.toString());
        }
    	return response;
	}
    
    
    public static void ignoreSsl() throws Exception{
        HostnameVerifier hv = new HostnameVerifier() {
        public boolean verify(String urlHostName, SSLSession session) {
                return true;
            }
        };
        trustAllHttpsCertificates();
        HttpsURLConnection.setDefaultHostnameVerifier(hv);
    }

	private static void trustAllHttpsCertificates() throws Exception {
	    TrustManager[] trustAllCerts = new TrustManager[1];
	    TrustManager tm = new miTM();
	    trustAllCerts[0] = tm;
	    SSLContext sc = SSLContext.getInstance("SSL");
	    sc.init(null, trustAllCerts, null);
	    HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
	}

	static class miTM implements TrustManager,X509TrustManager {
	    public X509Certificate[] getAcceptedIssuers() {
	        return null;
	    }
	
	    public boolean isServerTrusted(X509Certificate[] certs) {
	        return true;
	    }
	
	    public boolean isClientTrusted(X509Certificate[] certs) {
	        return true;
	    }
	
	    public void checkServerTrusted(X509Certificate[] certs, String authType)
	            throws CertificateException {
	        return;
	    }
	
	    public void checkClientTrusted(X509Certificate[] certs, String authType)
	            throws CertificateException {
	        return;
	    }
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
		
		String returnUrl = request.getRequestURL().toString().replace(request.getRequestURI(), "") + "/ct/fdrmcntr/KakaoPayReturn.do";
		
		/**** 로그테이블 저장 및 카카오페이 결제준비 API 호출 */
    	String jihoe = paramMap.get("jihoe");
    	String cid = PropertyConfig.getPropertiesCon("properties/kakaoPay", "KPAY.SUBCID_" + jihoe);
    	String timestamp = SignatureUtil.getTimestamp();
    	
    	ObjectMapper omp = new ObjectMapper();
    	String frmJson = omp.writeValueAsString(paramMap);
    	paramMap.put("frmData", frmJson);
    	paramMap.put("orderNo", timestamp);
		paramMap.put("cid", cid);
		paramMap.put("partner_order_id", timestamp);
		paramMap.put("partner_user_id", com.common.util.StringUtils.getEncMD5(paramMap.get("mbtlnum")));
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
			
			if(StringUtils.isBlank((paramMap.get("pg_token")))) {
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
				tempMap.put("partner_user_id", com.common.util.StringUtils.getEncMD5(String.valueOf(resMap.get("mbtlnum"))));
				tempMap.put("pg_token", paramMap.get("pg_token"));	
				tempMap.put("orderNo", paramMap.get("orderNo"));
				// 기부정보 저장
				try {
					String resultStr = service.insert(tempMap, null, null);
					String cntrSn = resultStr.substring(resultStr.lastIndexOf("_")+1);
					// 세션 저장
			    	session.setAttribute("MBTLNUM", tempMap.get("mbtlnum"));
					
			    	model.addAttribute("cntrSn", cntrSn);
			    	
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
		
		model.addAttribute("payType", "recurrent");
    	
		return "/chest/ct/KakaoPayReturn";
    }
}