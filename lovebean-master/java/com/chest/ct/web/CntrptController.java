package com.chest.ct.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;
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

import com.chest.ct.service.CntrptService;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.CookieUtils;
import com.common.util.RequestProc;
import com.common.util.SessionUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;



/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System 
 * Class Name  : CntrptController.java 
 * Author      : Chest Front
 * Date        : 2019. 9. 5.
 * Description : [ 기부 > 기부참여방법 ]  관련
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 5.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/ct/cntrpt")
public class CntrptController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private CntrptService service;
    
    @Autowired
    private ComService comService;
    
    //본인인증 코드
    @Value("#{checkPlus['CHECKPLUS.SITE_CODE']}")
    public String SITECODE;
    		
    //본인인증 사이트 비밀번호
    @Value("#{checkPlus['CHECKPLUS.SITE_PASSWORD']}")
    public String SITEPASSWORD;
    			
    
    private final String _URL = "https://auth_test.ring2pay.com:7891/asp/arsauth/sync/r2p_paauth.do";
    private final String _KSNET_URL = "http://210.181.28.103:8101/ksnet/auth/account";
    private final String _CNTR = "CntrCnsltReqst.";
    
    
    /**
     * [ 착한가정 ] 착한가정  Page Loading
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initNicehome.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initNicehome(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0004";
        model.addAttribute("reqstManageTy",  reqstManageTy);

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/ct/ct_cntrpt_nicehome_inqr_001";
    }

    /**
     * [ 착한가게] 착한가게  Page Loading
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initNicestore.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initNicestore(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0001";
        model.addAttribute("reqstManageTy",  reqstManageTy);

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/ct/ct_cntrpt_nicestore_inqr_002";
    }
    
    /**
     * [ 착한일터] 착한일터  Page Loading !!
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initNicespt.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initNicespt(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0009";
        model.addAttribute("reqstManageTy",  reqstManageTy);

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/ct/ct_cntrpt_nicespt_inqr_003";
    }

    
    
    /**
     * [ 나눔리더 ] 나눔리더  Page Loading !!
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initShareleadr.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initShareleadr(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

//      model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0006";
        model.addAttribute("reqstManageTy",  reqstManageTy);

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/ct/ct_cntrpt_shareleadr_inqr_004";
    }
    /**
     * [ 나눔리더스 클럽] 나눔리더스 클럽  Page Loading 
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initShareleadrclub.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initShareleadrclub(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
//        model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0007";
        model.addAttribute("reqstManageTy",  reqstManageTy);

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/ct/ct_cntrpt_shareleadrclub_inqr_005";
    }
    /**
     * [ 아너 소사이어티  ] 아너 소사이어티  Page Loading
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    
    @RequestMapping(value = "/initHonorsociety.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initHonorsociety(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);
        // menuId
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
       // Footer 에서 호출 할 경우 해당 값으로 set 
        for (Map.Entry entry : paramMap.entrySet())
        {
            if (entry.getKey().equals("ftCntr") ) reqstManageTy = (String)entry.getValue();
        }
        if(reqstManageTy == null) reqstManageTy = "0005";
        model.addAttribute("reqstManageTy",   reqstManageTy );
        

        return "chest:/ct/ct_cntrpt_honorsociety_regist_007";
    }
    /**
     * [ 기부자조언 기금 ] 기부자조언 기금  Page Loading
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    
      @RequestMapping(value = "/initCntrendw.do", method = {RequestMethod.GET, RequestMethod.POST})
      public String initCntrendw(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
          //model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );
          String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
          if(reqstManageTy == null) reqstManageTy = "0010"; 
          model.addAttribute("reqstManageTy",  reqstManageTy);
          
          model.addAttribute("siteCode", SITECODE );
          model.addAttribute("sitePassword", SITEPASSWORD);
          
          return "chest:/ct/ct_cntrpt_cntrendw_regist_009";
      }    
        
    /**
     * [유산기부] 유산기부  Page Loading 
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initHrtgcntr.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initHrtgcntr(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        //model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0011";
        model.addAttribute("reqstManageTy",  reqstManageTy);

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);
        
        return "chest:/ct/ct_cntrpt_hrtgcntr_regist_011";
    }
    
    /**
     * [ 희망자산나눔] 희망자산나눔 Page Loading 
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initHopeassetsshare.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initHopeassetsshare(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        //model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0012";
        
        model.addAttribute("reqstManageTy",  reqstManageTy);
        
        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);
        
        return "chest:/ct/ct_cntrpt_hopeassetsshare_regist_013";
    }

    /**
     * [ 현물기부] 현물기부 Page Loading 
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    
    @RequestMapping(value = "/initActhngcntr.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String nitActhngcntr(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        //model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0013";
        model.addAttribute("reqstManageTy",  reqstManageTy);
        
        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);
        
        return "chest:/ct/ct_cntrpt_acthngcntr_regist_015";
    }    

    
    /***
     * SELECT BOX 
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectSelList.do", method = { RequestMethod.POST })
    public String selectSelList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {
        model.addAttribute("codeList", (Map<String, Object>) service.selectCodeList(paramMap));
        model.addAttribute("companyList", (Map<String, Object>) service.selectCompanyList(paramMap));
        return "jsonView";
    }
    
    /***
     * 상담신청 정보 저장
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
     * 영수증 신청 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insert(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	String message = null;
    	String cnt = service.insert(SessionUtils.setSessionInfo(paramMap));
    	
    	//트랜잭션 처리를 하면 저장 , 수정이 권한으로 인해 오류
    	if( cnt.equals("1") ) {
    		service.updateTHP_GoodStorEmp(paramMap);
    		message = paramMap.get("outParam");
    	} else {
    		message = cnt;
    	}
        model.addAttribute("result", message);
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
    
    @RequestMapping(value = "/goodStorCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String goodStorCheck(@RequestParam Map<String, String> paramMap, ModelMap model , HttpServletRequest request ) throws Exception {
    	int cnt = service.goodStorCheck(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detail", ( cnt != 0 ? "success" : "fail" ) );
        return "jsonView";
    }
    

}