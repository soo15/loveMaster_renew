package com.chest.bn.web;

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
 * Class Name  : SportbsnsController.java
 * Author      : Chest Front
 * Date        : 2019. 9. 19.
 * Description : [ 사업 > 지원사업 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 18.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/bn/sportbsns")
public class SportbsnsController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

     /**
      * [ 영역별 지원] 영역별 지원  Page Loading
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initRelmsport.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initRelmsport(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

         
         return "chest:/bn/bn_sportbsns_relmsport_html_001";
     }     
}