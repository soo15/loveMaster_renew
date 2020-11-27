package com.chest.fr.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.service.ComService;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CntrdsgnController.java
 * Author      : Chest Front
 * Date        : 2019. 10. 28.
 * Description : [ 기부참여안내 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019.10. 28.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */

@Controller
@RequestMapping(value = "/fr/cntrdsgn")
public class CntrdsgnController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ComService comService;

    /**
     * [ 나의 기부 설계 ] 나의 기부 설계 Page Loading
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/init.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String init(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

        model.addAttribute("giverFlagM", comService.selectCmmnCodeComboString("HP0036", "S")); // 기부자구분 
        model.addAttribute("giveFlagM", comService.selectCmmnCodeComboString("HP0037", "S")); // 기부 구분
        
        model.addAttribute("giveKindFlagM", comService.selectCmmnCodeComboString("HP0038", "S")); // 기부종류 
        model.addAttribute("jobFlagM", comService.selectCmmnCodeComboString("HP0039", "S")); // 직업구분 
        
        model.addAttribute("moneyFlag1M", comService.selectCmmnCodeComboString("HP0040")); // 금액 구분1
        model.addAttribute("moneyFlag2M", comService.selectCmmnCodeComboString("HP0041")); // 금액 구분2
        model.addAttribute("moneyFlag3M", comService.selectCmmnCodeComboString("HP0042")); // 금액 구분3
        model.addAttribute("moneyFlag4M", comService.selectCmmnCodeComboString("HP0043")); // 금액 구분4
        
        
        return "chest:/fr/fr_cntrdsgn_html_001";
    }
}