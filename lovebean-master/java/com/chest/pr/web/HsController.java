package com.chest.pr.web;

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

import com.chest.pr.service.HsService;
import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : HsController.java
 * Author      : Chest Front
 * Date        : 2019. 9. 5.
 * Description : [ 기부자그룹 ] 관련
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
@RequestMapping(value="/pr/hs")
public class HsController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

     @Autowired
     private HsService hsService;
     
     @Autowired
     private ComService comService;
     
     @Value("#{chest['gen.filePath']}")
     public String genFilePath;

     private final String _CNTR = "FtCntrCnsltReqst.";
     
     /**
      * [ 아너 소사이어티 ] 아너 소사이어티란 Page Loading 
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initHonorsocietyinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initHonorsocietyinfo(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception{
         
         // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
         Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Mberintrcn", paramMap);
         
         // 검색 조건에 공통코드 가져오는 ComboBox 가 있을 경우 해당 ComboBox에 값을 셋팅한 String을 보내줘야 함
         String val = paramTempMap == null || paramTempMap.get("pBhfCode") == null ? "" : paramTempMap.get("pBhfCode");
         
         model.addAttribute("pBhfCode",     comService.selectCmmnCodeComboString("HP0010", "A", val));  // 지회코드
         model.addAttribute("paramMap", paramTempMap);   // parameter
         
         model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );
         
         model.addAttribute("genFilePath", genFilePath);
         
         return "chest:/pr/pr_hs_honorsocietyinfo_html_001";
     }     
     
    /**
     * [ 아너 소사이어티 ] 회원소개 Page Loading 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
//    @RequestMapping(value = "/initMberintrcn.do", method = {RequestMethod.GET, RequestMethod.POST})
//    public String initMberintrcn(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception{
//        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
//        Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Mberintrcn", paramMap);
//        
//        // 검색 조건에 공통코드 가져오는 ComboBox 가 있을 경우 해당 ComboBox에 값을 셋팅한 String을 보내줘야 함
//        String val = paramTempMap == null || paramTempMap.get("pBhfCode") == null ? "" : paramTempMap.get("pBhfCode");
//        
//        model.addAttribute("pBhfCode",     comService.selectCmmnCodeComboString("HP0010", "A", val));  // 지회코드
//        model.addAttribute("paramMap", paramTempMap);   // parameter
//        
//        model.addAttribute("genFilePath", genFilePath);
//
//        return "chest:/pr/pr_hs_mberintrcn_inqr_005";
//    }

    /**
     * [ 아너소사이어티] 회원소개 Page 리스트 조회 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectMberintrcnList.do", method = {RequestMethod.POST})
    public String selectMberintrcnList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Mberintrcn", paramMap);

        Map<String, Object> resMap = hsService.selectMberintrcnList(paramMap);

        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }
    
}