package com.chest.cm.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.chest.cm.service.SereqstService;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;
import com.common.util.SessionUtils;



/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System Class Name : CntrptController.java 
 * Author :
 * Chest Front Date : 2019. 10. 7. 
 * Description : [ 각종신청 ]  관련
 *
 * History :
 * ************************************************************************************************
 * No. Date Name Description
 * ************************************************************************************************
 * CH_OO 2019. 9. 5. Chest Front Initial Release CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/cm/sereqst")
public class SereqstController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private SereqstService service;
    
    @Autowired
    private ComService comService;
    
    //파일다운로드 경로
    @Value("#{chest['DOWNLOAD.FILEPATH']}")
    public String DOWN_FILE;
    
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
     * [ 기관방문신청 ] 기관방문신청  Page Loading 
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/init.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String init(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/cm/cm_sereqst_regist_001";
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
        //model.addAttribute("listDetail", (List<ComCamelMap>) listDetail.get("listDetail"));
        
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