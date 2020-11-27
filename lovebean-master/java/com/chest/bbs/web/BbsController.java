package com.chest.bbs.web;

import java.util.List;
import java.util.Map;

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

import com.chest.bbs.service.BbsService;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System Class Name : GuidanceController.java Author :
 * Chest Front Date : 2019. 9. 5. Description : [ 게시판 ] 관련
 *
 * History :
 * ************************************************************************************************
 * No. Date Name Description
 * ************************************************************************************************
 * CH_OO 2019. 9. 5. Chest Front Initial Release CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value = "/bbs")
public class BbsController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BbsService bbsService;

    @Autowired
    private ComService comService;

    @Value("#{chest['gen.filePath']}")
    public String genFilePath;

    /**
     * [ 게시판 ] 게시물 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/{pBbsSn}/initPostList.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initPostList(@RequestParam Map<String, String> paramMap, @PathVariable String pBbsSn, HttpSession session, ModelMap model)
            throws Exception {

        paramMap.put("pBbsSn", pBbsSn);
        Map<String, Object> resMap = bbsService.selectBbsInfo(paramMap);

        ComCamelMap bbsInfo        = (ComCamelMap)resMap.get("bbsInfo");

        String tabAt    = ((String)bbsInfo.get("tabAt")).toLowerCase();
//        String tmplatTy = ((String)bbsInfo.get("tmplatTy")).toLowerCase();

        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
        Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Post", paramMap);

        // 탭이 있는 게시판 일 때 새로 넘어오는 parameter(paramMap)의 bbsSn 과 paramTempMap 의 bbsSn 이 다르면 아래와 같이 parameter
        // set
        if("y".equals(tabAt)) {
            if (paramTempMap != null && paramTempMap.get("pBbsSn") != null
                    && !paramTempMap.get("pBbsSn").equals(paramMap.get("pBbsSn"))) {
                paramTempMap.put("pBbsSn", paramMap.get("pBbsSn"));
                paramTempMap.put("pSj", "");
                paramTempMap.put("currPageNo", "1");
            }
        }

        // 검색 조건에 공통코드 가져오는 ComboBox 가 있을 경우 해당 ComboBox에 값을 셋팅한 String을 보내줘야 함
        String val = paramTempMap == null || paramTempMap.get("pBhfCode") == null ? CookieUtils.getValue("__branchCd") : paramTempMap.get("pBhfCode");
        
    	model.addAttribute("branchCd", val );
    	
        model.addAttribute("pBhfCode", comService.selectCmmnCodeComboString("HP0010", "X", val)); // 지회코드
        model.addAttribute("paramMap", paramTempMap); // parameter

        model.addAttribute("bbsInfo", bbsInfo);
        model.addAttribute("tabList", resMap.get("tabList"));
        model.addAttribute("fstTabInfo", resMap.get("fstTabInfo"));

        model.addAttribute("genFilePath", genFilePath);

//        return "chest:/bbs/bbs_" + tmplatTy + "_tab" + tabAt.toLowerCase() + "_inqr_001";
        return "chest:/bbs/bbs_inqr_001";
    }

    /**
     * [ 게시판 ] 게시물 Page 리스트 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectPostList.do", method = { RequestMethod.POST })
    public String selectPostList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model)
            throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Post", paramMap);

        Map<String, Object> resMap = bbsService.selectPostList(paramMap);

        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }

    /**
     * [ 게시판 ] 게시물 Detail Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/{bbsSn}/initPostDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initPostDetail(@RequestParam Map<String, String> paramMap, @PathVariable String bbsSn, HttpSession session, ModelMap model)
            throws Exception {

        paramMap.put("pBbsSn", bbsSn);
        Map<String, Object> resMap = bbsService.selectBbsInfo(paramMap);

        ComCamelMap bbsInfo        = (ComCamelMap)resMap.get("bbsInfo");

        String tabAt    = ((String)bbsInfo.get("tabAt")).toLowerCase();
//        String tmplatTy = ((String)bbsInfo.get("tmplatTy")).toLowerCase();

        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
        Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Post", paramMap);

        // 탭이 있는 게시판 일 때 새로 넘어오는 parameter(paramMap)의 bbsSn 과 paramTempMap 의 bbsSn 이 다르면 아래와 같이 parameter
        // set
        if("Y".equals(tabAt)) {
            if (paramTempMap != null && paramTempMap.get("pBbsSn") != null
                    && !paramTempMap.get("pBbsSn").equals(paramMap.get("pBbsSn"))) {
                paramTempMap.put("pBbsSn", paramMap.get("pBbsSn"));
                paramTempMap.put("pSj", "");
                paramTempMap.put("currPageNo", "1");
            }
        }

        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Post", paramMap);

        model.addAttribute("paramMap", paramMap);

        model.addAttribute("bbsInfo", bbsInfo);
        model.addAttribute("tabList", resMap.get("tabList"));

        model.addAttribute("genFilePath", genFilePath);

//        return "chest:/bbs/bbs_" + tmplatTy + "_tab" + tabAt.toLowerCase() + "_detail_002";
        return "chest:/bbs/bbs_detail_002";
    }

    /**
     * [ 게시판 ] 게시물 한 건 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/selectPostInfo.do", method = { RequestMethod.POST })
    public String selectNoticeInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("dataInfo", (Map<String, Object>) bbsService.selectPostInfo(paramMap));

        return "jsonView";
    }

}