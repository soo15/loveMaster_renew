package com.chest.bn.web;

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

import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;
import com.common.util.RequestProc;
import com.common.util.SessionUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.chest.bn.service.ScaService;
import com.common.service.ComService;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : ScaController.java
 * Author      : Chest Front
 * Date        : 2019. 9. 18.
 * Description : [ 나눔문화활성화 ] 나눔문화연구소 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 18.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/bn/sca")
public class ScaController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ScaService service;
 
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
      * [ 소통과협력] 소통과협력  Page Loading
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initMlrdncorpr.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initMlrdncorpr(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

         
         return "chest:/bn/bn_sca_mlrdncorpr_html_006";
     } 
     
     /**
      * [ UWW아태교육센터] UWW아태교육센터  Page Loading
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initUwweducnter.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initUwweducnter(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

         
         return "chest:/bn/bn_sca_uwweducnter_html_001";
     }     
     /**
      * [ 나눔교육] 나눔교육  Page Loading
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initShareedc.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initShareedc(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

         
         return "chest:/bn/bn_sca_shareedc_html_005";
     }          
     /**
      * [ 어린이 나눔체험관 ] 어린이 나눔체험관  Page Loading
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initChildse.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initChildse(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception{

         model.addAttribute("siteCode", SITECODE );
         model.addAttribute("sitePassword", SITEPASSWORD);
         
         model.addAttribute("applcntInsttTyM", comService.selectCmmnCodeComboString("HP0029", "S")); // 기관유형
         
         model.addAttribute("lnbnsTrgetTyM", comService.selectCmmnCodeComboString("HP0030", "S")); // 견학대상유형

         model.addAttribute("visitHopeTimeM", comService.selectCmmnCodeComboString("HP0031", "S")); // 방문시간대
         
         return "chest:/bn/bn_sca_childse_regist_001";
     }
     
     /**
      * [ 기관방문신청 ] 기관방문신청 내역조회 ( 신청하기 TAB ) 
      * @param paramMap
      * @return Map<String, Object>
      * @throws Exception
      * 신청내역조회 TAB 에서 상담신청을 click 하거나 신청기관을 click 한 경우 해당 신청정로를 신청하기 TAB 에  1건 조회한다. 
      */ 
     @SuppressWarnings("unchecked")
     @RequestMapping(value = "/detailInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String detailInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {

         Map<String, Object> listDetail = service.selectInsttDetail(SessionUtils.setSessionInfo(paramMap));
         model.addAttribute("listDetail", (List<ComCamelMap>) listDetail.get("listDetail"));
         
         return "jsonView";
     }    
     
     /**
      * [ 기관방문신청 ] 기부상담신청 신청 하기 ( 신청하기 TAB ) 
      * @param paramMap
      * @return cnt
      * @throws Exception
      * 기관방문신청 테이블 에 INSERT 
      */ 
     @RequestMapping(value = "/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String insert(@RequestParam Map<String, String> paramMap, MultipartRequest multipartRequest , Model model) throws Exception {
         model.addAttribute("result", service.insert(SessionUtils.setSessionInfo(paramMap), multipartRequest));
         return "jsonView";
     }
     
     
     /**
      * [ 기관방문신청 ] 기관방문신청 리스트 중 신청 취소 ( 신청내역조회 TAB ) 
      * @param paramMap
      * @return Map<String, Object>
      * @throws Exception
      * 기관방문신청 리스트 중 신청취소 한다. 
      * 기관방문신청 테이블에 취소여부에 취소를 반영한다. (UPDATE) 
      */ 
     @RequestMapping(value = "/cancel.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String cancel(@RequestParam Map<String, String> paramMap,Model model) throws Exception {
         
         model.addAttribute("result", service.cancel(SessionUtils.setSessionInfo(paramMap)));
         return "jsonView";
     }
     
     /**
      * [ 기관방문신청 ] 기관방문신청 리스트  조회  ( 신청내역조회 TAB ) 
      * @param paramMap
      * @return Map<String, Object>
      * @throws Exception
      * 검색 조건에 입력한 내용으로  신청내역조회 TAB 에 리스트를 조회한다. 
      * 검색조건이 없을 경우 전체 리스트를 조회 한다.  
      */
     @SuppressWarnings("unchecked")
     @RequestMapping(value = "/selectInsttList.do", method = { RequestMethod.POST })
     public String selectInsttList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model)
             throws Exception {
         
         // 페이지 전환 시 넘어온 파라메터 셋팅 !!
         ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Post", paramMap);
         model.addAttribute("paramMap", paramMap);
         
         Map<String, Object> resMap = service.selectInsttList(SessionUtils.setSessionInfo(paramMap));
         
         model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
         model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

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