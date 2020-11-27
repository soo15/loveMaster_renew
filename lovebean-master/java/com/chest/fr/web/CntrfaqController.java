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
 * Class Name  : CntrfaqController.java
 * Author      : Chest Front
 * Date        : 2019. 10. 28.
 * Description : [ 기부참여 안내 ] 관련
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
@RequestMapping(value = "/fr/cntrfaq")
public class CntrfaqController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

//    @Autowired
//    private CntrfaqService cntrfaqService;

    @Autowired
    private ComService comService;

    /**
     * [ 기부 FAQ ] 기부FAQ Page Loading !!
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initPartcptnguidance.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initPartcptnguidance(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

        return "chest:/fr/fr_cntrfaq_partcptnguidance_inqr_001";
    }

    /**
     * [ 기부 FAQ ] 기부금 세금공제 안내 Page Loading !!
     * 
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
//    @RequestMapping(value = "/initCtbnytaxddcguidance.do", method = { RequestMethod.GET, RequestMethod.POST })
//    public String initCtbnytaxddcguidance(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
//
//        return "chest:/fr/fr_cntrfaq_ctbnytaxddcguidance_inqr_002";
//    }

}