package com.chest.sy.web;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chest.sy.service.CommncodeService;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.SessionUtils;


/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : CommncodeController.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 공통코드관리 ]
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 7. 26.       박수호          Initial Release
 * CH_01   
 **************************************************************************************************/
@Controller
@RequestMapping(value="/sy/commncode")
public class CommncodeController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private CommncodeService commncodeService;
    
    @Autowired
    private ComService comService;
    
    /**[ 시스템관리 - 공통코드관리 ] Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initCommncode.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initCommncode(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        model.addAttribute("busiCombo",    comService.selectCmmnCodeComboString("0000", "D", "HP"));
        
        return "chest:/sy/sy_commncode_regist_001";
    }
    
    /**[ 시스템관리 - 공통코드관리 ] 그룹코드 조회
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectGroupCodeList.do", method = {RequestMethod.POST})
    public String selectGroupCodeList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        Map<String, Object> resMap = commncodeService.selectGroupCodeList(SessionUtils.setSessionInfo(paramMap));
        
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));
        
        return "jsonView";
    }
    
    /**[ 시스템관리 - 공통코드관리 ] 상세코드 조회
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectDetailCodeList.do", method = {RequestMethod.POST})
    public String selectDetailCodeList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        Map<String, Object> resMap = commncodeService.selectDetailCodeList(SessionUtils.setSessionInfo(paramMap));
        
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));
        
        return "jsonView";
    }
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 그룹코드 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/storeGroupCodeList.do", method = {RequestMethod.POST})
    public String storeGroupCodeList(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        model.addAttribute("result", commncodeService.storeGroupCodeList(SessionUtils.setSessionInfo(paramMap)));
        
        return "jsonView";
    }
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 상세코드 저장
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/storeDetailCodeList.do", method = {RequestMethod.POST})
    public String storeDetailCodeList(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        model.addAttribute("result", commncodeService.storeDetailCodeList(SessionUtils.setSessionInfo(paramMap)));
        
        return "jsonView";
    }
}