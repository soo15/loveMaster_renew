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

import com.chest.sy.service.LogService;
import com.common.map.ComCamelMap;
import com.common.util.SessionUtils;


/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : LogController.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 접속로그관리 ]
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 7. 26.       박수호          Initial Release
 * CH_01   
 **************************************************************************************************/
@Controller
@RequestMapping(value="/sy/log")
public class LogController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private LogService logService;
    
    /**[ 시스템관리 - 접속로그관리 ] Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initLog.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initLog(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        return "chest:/sy/sy_log_inqr_004";
    }
    
    /**[ 시스템관리 - 접속로그관리 ] 로그 List 조회
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectLogList.do", method = {RequestMethod.POST})
    public String selectLogList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        Map<String, Object> resMap = logService.selectLogList(SessionUtils.setSessionInfo(paramMap));
        
        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));
        
        return "jsonView";
    }
}