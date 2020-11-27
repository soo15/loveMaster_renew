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
@RequestMapping(value="/pr/whs")
public class WhsController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * [ W아너소사이어티] W아너소사이어티  Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initWhonorsocietyinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initWhonorsocietyinfo(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

        
        return "chest:/pr/pr_whs_whonorsocietyinfo_html_001";
    }

}