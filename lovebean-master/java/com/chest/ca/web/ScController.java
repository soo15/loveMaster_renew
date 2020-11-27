package com.chest.ca.web;

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

import com.chest.ca.service.ScService;
import com.common.util.SessionUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : SportbsnsController.java
 * Author      : Chest Front
 * Date        : 2019. 10. 28.
 * Description : [ 캠패인 ] 관련
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
@RequestMapping(value="/ca/sc")
public class ScController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private ScService service;

     /**
      * [ 나눔캠페인 ] 소다수켐페인(연중)  Page Loading
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initSodasucmpgn.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initSodasucmpgn(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

         
         return "chest:/ca/ca_sc_sodasucmpgn_regist_002";
     }     
     
     /**
      * [나눔캠페인 ] 나눔문화켐페인  Page Loading
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initNanumcmpgn.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initNanumcmpgn(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {


         String mapYn = paramMap == null || paramMap.get("mapYn") == null ? "0" : "1";
         
         model.addAttribute("tabMapYn", mapYn);         
         

         model.addAttribute("ogTitle", "사랑의열매 슈퍼스타챌린지 최우수 뽑고 아메리카노 받자!");
         model.addAttribute("ogImage", "https://www.chest.or.kr/common/img/facebooktestimg_2007.jpg");
         model.addAttribute("ogURL", "https://www.chest.or.kr/ca/sc/initNanumcmpgn.do");
         model.addAttribute("ogDescription", "사랑의열매 슈퍼스타챌린지 영상을 보고 투표를 진행해 주세요! 시원한 아메리카노가 기다리고 있습니다~!");
         
         return "chest:/ca/ca_sc_nanumcmpgn_regist_001";
     }
     
     /***
      * [나눔캠페인] 나눔문화켐페인 투표하기 저장
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String insert(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
     	
         model.addAttribute("result", service.insert(SessionUtils.setSessionInfo(paramMap)));
         return "jsonView";
     }
}