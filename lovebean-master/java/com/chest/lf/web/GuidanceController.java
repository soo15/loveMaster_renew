package com.chest.lf.web;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceController.java
 * Author      : Chest Front
 * Date        : 2019. 9. 5.
 * Description : [ 사랑의 열매 > 안내 ]  관련
 *
 * History :
 * ************************************************************************************************
 * No. Date Name Description
 * ************************************************************************************************
 * CH_OO 2019. 9. 5. Chest Front Initial Release 
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value = "/lf/guidance")
public class GuidanceController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("#{chest['gen.filePath']}")
    public String genFilePath;

    /**
     * [ FAQ ] FAQ Page Loading
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initFaq.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initFaq(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {

        model.addAttribute("paramMap", paramMap);

        return "chest:/lf/lf_guidance_faq_inqr_002";
    }

}