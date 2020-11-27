package com.chest.ca.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chest.ca.service.CrwdfundService;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;
import com.common.util.StringUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CrwdfundController.java
 * Author      : Chest Front
 * Date        : 2019. 10. 21.
 * Description : [ 캠페인 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 21.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/ca/crwdfund")
public class CrwdfundController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

     @Autowired
     private CrwdfundService crwdfundService;

     @Autowired
     private ComService comService;

     @Value("#{chest['gen.filePath']}")
     public String genFilePath;

     /**
      * [ 캠페인 ] 클라우드 펀딩 신청 Page Loading !!
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initReqstfund.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initReqstfund(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception{
         // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
         Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Crwdfund", paramMap);

         // 검색 조건에 공통코드 가져오는 ComboBox 가 있을 경우 해당 ComboBox에 값을 셋팅한 String을 보내줘야 함
         String svcArea = paramTempMap == null || paramTempMap.get("svcArea") == null ? "" : paramTempMap.get("svcArea");
         String bsnsBsr = paramTempMap == null || paramTempMap.get("bsnsBsr") == null ? "" : paramTempMap.get("bsnsBsr");


         String mapYn = paramMap == null || paramMap.get("mapYn") == null ? "0" : "1";
         
         model.addAttribute("tabMapYn", mapYn);
         model.addAttribute("comboBsnsBsr",     comService.selectCmmnCodeComboString("HP0022", "S", bsnsBsr));  // 사업분야
         model.addAttribute("comboSvcArea",     comService.selectCmmnCodeComboString("HP0010", "S", svcArea));  // 서비스지역(지회코드)

         model.addAttribute("paramMap", paramTempMap);   // parameter

         return "chest:/ca/ca_crwdfund_reqstfund_regist_001";
     }

     /**
      * [ 캠페인 ] 클라우드 펀딩 신청 저장 !!
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/reqstCrwdfund.do", method = {RequestMethod.POST})
     public String reqstCrwdfund(@RequestParam Map<String, String> paramMap, Model model) throws Exception {

         model.addAttribute("result", crwdfundService.reqstCrwdfund(paramMap));

         return "jsonView";
     }

    /**
     * [ 캠페인 ] 클라우드 펀딩 목록 Page Loading !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/{pEndAt}/initCrwdfund.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initCrwdfund(@RequestParam Map<String, String> paramMap, @PathVariable String pEndAt, HttpSession session, ModelMap model) throws Exception{
        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
        Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Crwdfund", paramMap);

        model.addAttribute("paramMap", paramTempMap);   // parameter
        model.addAttribute("pEndAt", pEndAt);

        model.addAttribute("genFilePath", genFilePath);

        return "chest:/ca/ca_crwdfund_inqr_002";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 Page 리스트 조회 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectCrwdfundList.do", method = {RequestMethod.POST})
    public String selectCrwdfundList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Crwdfund", paramMap);

        Map<String, Object> resMap = crwdfundService.selectCrwdfundList(paramMap);

        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 Detail Page Loading !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/{pEndAt}/initCrwdfundDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initCrwdfundDetail(@RequestParam Map<String, String> paramMap, @PathVariable String pEndAt, HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Crwdfund", paramMap);

        model.addAttribute("paramMap", paramMap);
        model.addAttribute("pEndAt", pEndAt);

        model.addAttribute("genFilePath", genFilePath);

        // 진행중인 펀드일 때는 SNS 공유를 위한 데이터를 가져온다.
        if("P".equals(pEndAt)) {
            ComCamelMap dataInfo    = (ComCamelMap)(crwdfundService.selectCrwdfundInfo(paramMap)).get("crwdfundInfo");

            if(dataInfo != null) {
                String serverFileNm     = (String)dataInfo.get("serverFileNm");
                String endAt            = (String)dataInfo.get("endAt");

                model.addAttribute("ogTitle", dataInfo.get("bsnsSj"));
                if(serverFileNm != null && !("").equals(serverFileNm)) {
                    model.addAttribute("ogImage", genFilePath + dataInfo.get("flpth") + serverFileNm);
                }else {
                    model.addAttribute("ogImage", null);
                }

                model.addAttribute("propseSn", paramMap.get("propseSn") );
                model.addAttribute("thisEndAt", endAt);
                model.addAttribute("ogDescription", dataInfo.get("bsnsCn") != null ? (StringUtils.removeTag((String)dataInfo.get("bsnsCn"))).replaceAll("\r\n|\r|\n|\n\r", " ") : "");
            }
        }

        return "chest:/ca/ca_crwdfund_detail_003";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 한 건 조회 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/selectCrwdfundInfo.do", method = {RequestMethod.POST})
    public String selectCrwdfundInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("dataInfo", (Map<String, Object>) crwdfundService.selectCrwdfundInfo(paramMap));

        return "jsonView";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 Page 리스트 조회 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectCrwdfundAnswerList.do", method = {RequestMethod.POST})
    public String selectCrwdfundAnswerList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Crwdfund", paramMap);

        Map<String, Object> resMap = crwdfundService.selectCrwdfundAnswerList(paramMap);

        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 수정/삭제를 위한 비밀번호 체크 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/checkReplyPw.do", method = {RequestMethod.POST})
    public String checkReplyPw(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("dataInfo", (Map<String, Object>) crwdfundService.checkReplyPw(paramMap));

        return "jsonView";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 삭제 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/deleteReply.do", method = {RequestMethod.POST})
    public String deleteReply(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("result", crwdfundService.deleteReply(paramMap));

        return "jsonView";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 수정 Page Loading !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initCrwdfundReply.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initCrwdfundReply(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Crwdfund", paramMap);

        model.addAttribute("paramMap", paramMap);

        return "chest:/ca/ca_crwdfund_reply_004";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 한 건 조회 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/selectCrwdfundReplyInfo.do", method = {RequestMethod.POST})
    public String selectCrwdfundReplyInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("dataInfo", (Map<String, Object>) crwdfundService.selectCrwdfundReplyInfo(paramMap));

        return "jsonView";
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 수정 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/updateReply.do", method = {RequestMethod.POST})
    public String updateReply(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("result", crwdfundService.updateReply(paramMap));

        return "jsonView";
    }
}