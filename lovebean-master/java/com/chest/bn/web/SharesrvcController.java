package com.chest.bn.web;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : SportbsnsController.java
 * Author      : Chest Front
 * Date        : 2019. 9. 19.
 * Description : [ 사업 > 나눔봉사 ] 관련
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
@RequestMapping(value="/bn/sharesrvc")
public class SharesrvcController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

//     @Autowired
//     private SharesrvcService sharesrvcService;
    
    @Autowired
    private ComService comService;
    

    /**
     * [ 1318 청소년캠프 ] 1318 청소년캠프  Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initYngbgscamp.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initYngbgscamp(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception{

        return "chest:/bn/bn_sharesrvc_yngbgscamp_html_001";
    }

    /**
     * [ 톡톡서포터즈 ] 톡톡서포터즈  Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initTsupporters.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initTsupporters(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception {

        
        return "chest:/bn/bn_sharesrvc_tsupporters_html_002";
    }
    
    /**
     * [ 나눔봉사단 ] 나눔봉사단  Page Loading !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initSharesrvc.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initSharesrvc(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception {

        model.addAttribute("pBhfCode", comService.selectCmmnCodeComboString("HP0010","X")); // 지회코드
        
        return "chest:/bn/bn_sharesrvc_sharesrvc_html_003";
    }
        
   
}