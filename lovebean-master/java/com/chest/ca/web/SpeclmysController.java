package com.chest.ca.web;

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

import com.chest.ca.service.SpeclmysService;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;
import com.common.util.SessionUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : SpeclmysController.java
 * Author      : Chest Front
 * Date        : 2019. 9. 27.
 * Description : [ 캠페인 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 27.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/ca/speclmys")
public class SpeclmysController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

     @Autowired
     private SpeclmysService speclmysService;

     @Autowired
     private ComService comService;

     @Value("#{chest['gen.filePath']}")
     public String genFilePath;
     
     //본인인증 코드
     @Value("#{checkPlus['CHECKPLUS.SITE_CODE']}")
     public String SITECODE;
     		
     //본인인증 사이트 비밀번호
     @Value("#{checkPlus['CHECKPLUS.SITE_PASSWORD']}")
     public String SITEPASSWORD;

    /**
     * [ 캠페인 ] 특별모금 Page Loading !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initSpeclmys.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initSpeclmys(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception{
        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
        Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Speclmys", paramMap);

        model.addAttribute("paramMap", paramTempMap);   // parameter

        model.addAttribute("genFilePath", genFilePath);

        return "chest:/ca/ca_speclmys_inqr_001";
    }

    /**
     * [ 캠페인 ] 특별모금 Page 리스트 조회 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectSpeclmysList.do", method = {RequestMethod.POST})
    public String selectSpeclmysList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Speclmys", paramMap);

        Map<String, Object> resMap = speclmysService.selectSpeclmysList(paramMap);

        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }

    /**
     * [ 캠페인 ] 특별모금 Detail Page Loading !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initSpeclmysDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initSpeclmysDetail(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Speclmys", paramMap);
        model.addAttribute("paramMap", paramMap);
        model.addAttribute("genFilePath", genFilePath);
        model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
    	
        return "chest:/ca/ca_speclmys_detail_001";
    }

    /**
     * [ 캠페인 ] 특별모금 한 건 조회 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/selectSpeclmysInfo.do", method = {RequestMethod.POST})
    public String selectSpeclmysInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("dataInfo", (Map<String, Object>) speclmysService.selectSpeclmysInfo(paramMap));
        return "jsonView";
    }
    
    @RequestMapping(value = "/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insert(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	int cnt = speclmysService.insert(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("result", cnt+"");
        return "jsonView";
    }  
}