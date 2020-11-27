package com.chest.sr.web;

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

import com.chest.sr.service.SrService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System Class Name : GuidanceController.java Author :
 * Chest Front Date : 2019. 10. 22. Description : [ 검색 ] 관련
 *
 * History :
 * ************************************************************************************************
 * No. Date Name Description
 * ************************************************************************************************
 * CH_OO 2019. 10. 22. Chest Front Initial Release CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value = "/sr")
public class SrController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SrService srService;

    /**
     * [ 검색 ] 검색결과 페이지 Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/search/initSearchresult.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initSearchresult(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception {
        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
        ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Post", paramMap);

        model.addAttribute("paramMap", paramMap); // parameter

        return "chest:/sr/sr_search_searchresult_regist_001";
    }

    /**
     * [ 검색 ] 검색결과  조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/search/selectSearchList.do", method = { RequestMethod.POST })
    public String selectSearchList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model) throws Exception {
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Post", paramMap);

        Map<String, Object> resMap = srService.selectSearchList(paramMap);

        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", resMap.get("listInfo"));

        return "jsonView";
    }

    @RequestMapping(value = "/sitemap.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initSitemap(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model) throws Exception {

        return "chest:/sr/sr_sitemap";
    }
}