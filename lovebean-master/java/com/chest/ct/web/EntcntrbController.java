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

import com.chest.ct.service.EntcntrbService;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;
import com.common.util.RequestProc;
import com.common.util.SessionUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;


/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System 
 * Class Name  : EntcntrbController.java 
 * Author      : Chest Front 
 * Date        : 2019. 10. 7. 
 * Description : [ 기부 > 기업사회공헌 ]  관련
 * History     :
 * ************************************************************************************************
 * No. Date Name Description
 * ************************************************************************************************
 * CH_OO 2019. 9. 5. Chest Front Initial Release CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/ct/entcntrb")
public class EntcntrbController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private EntcntrbService service;
    
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
     * [ 사회공헌 성금기부  ] 사회공헌 성금기부  Page Loading !!
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initSoctycntrbdntncntr.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initSoctycntrbdntncntr(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));

        if(reqstManageTy == null) reqstManageTy = "0014";
        model.addAttribute("reqstManageTy",  reqstManageTy);

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/ct/ct_entcntrb_soctycntrbdntncntr_html_001";
    }
    /**
     * [ 사회공헌 현물기부 ] 사회공헌 현물기부  Page Loading !!
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initSoctycntracthngcntr.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initSoctycntracthngcntr(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0015";
        model.addAttribute("reqstManageTy",  reqstManageTy);
        
        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/ct/ct_entcntrb_soctycntracthngcntr_html_003";
    }
    /**
     * [ 공익연계마케팅 ] 공익연계마케팅  Page Loading !!
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    
    @RequestMapping(value = "/initPblbnfcntcmarkt.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initPblbnfcntcmarkt(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
        if(reqstManageTy == null) reqstManageTy = "0016";
        model.addAttribute("reqstManageTy",  reqstManageTy);

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/ct/ct_entcntrb_pblbnfcntcmarkt_html_005";
    }
    /**
     * [ 나눔명문기업 ] 나눔명문기업  Page Loading
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    
      @RequestMapping(value = "/initSharexlcmpstnentrprs.do", method = {RequestMethod.GET, RequestMethod.POST})
      public String initSharexlcmpstnentrprs(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
          
          model.addAttribute("siteCode", SITECODE );
          model.addAttribute("sitePassword", SITEPASSWORD);
          
          // menuId 
          String reqstManageTy = PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId"));
          // Footer 에서 호출 할 경우 해당 값으로 set 
          for (Map.Entry entry : paramMap.entrySet())
          {
              if (entry.getKey().equals("ftCntr") ) reqstManageTy = (String)entry.getValue();
          }
          if(reqstManageTy == null) reqstManageTy = "0017";
          model.addAttribute("reqstManageTy",   reqstManageTy );
          
          return "chest:/ct/ct_entcntrb_sharexlcmpstnentrprs_regist_007";
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
    

}