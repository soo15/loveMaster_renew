package com.chest.pr.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.config.PropertyConfig;
import com.common.util.CookieUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : SrcController.java
 * Author      : Chest Front
 * Date        : 2019. 10. 15.
 * Description : [ 기부자그룹 ]  관련
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
@RequestMapping(value="/pr/src")
public class SrcController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());


    private final String _CNTR = "FtCntrCnsltReqst.";
     
    /**
     * [ 나눔명문기업] 나눔명문기업이란  Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initSharexlcmpstnentrprsinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initSharexlcmpstnentrprsinfo(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        model.addAttribute("reqstManageTy",     PropertyConfig.getString( _CNTR + CookieUtils.getValue("__menuId")) );

        
        return "chest:/pr/pr_src_sharexlcmpstnentrprsinfo_html_001";
    }

}