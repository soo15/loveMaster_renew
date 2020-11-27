package com.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.map.ComCamelMap;
import com.common.util.ComUtils;
import com.common.util.SessionUtils;
import com.main.service.MainService;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : MainController.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Main ] Main 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/")
public class MainController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MainService mainService;

    @Value("#{chest['gen.filePath']}")
    public String genFilePath;
/*

    @Value("#{chest['english.site.url']}")
    public String englishSite;

    @Value("#{chest['japan.site.url']}")
    public String japanSite;

    @Value("#{chest['china.site.url']}")
    public String chinaSite;
*/
    /**
     * [ Main ] Login 후 Main Page Loading !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/base.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchBaseInfos(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest req) throws Exception{
        // 설정 파라메터 초기화 !!
        ComUtils.initialParameterMap();

        // Main 화면 정보들 조회 !!

        model.addAttribute("genFilePath", StringUtils.replace(genFilePath, "\\", "\\\\"));

        String forward = "base";
        /*
        String svrNm = StringUtils.trim(req.getServerName());

        if(svrNm.indexOf(englishSite) > -1) {
            forward = "english";
        } else if(svrNm.indexOf(japanSite) > -1) {
            forward = "japan";
        }  else if(svrNm.indexOf(chinaSite) > -1) {
            forward = "china";
        }
        */
        return forward;
    }
    
    /**
     * [ Main ] Campaign Page Loading !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/campaign.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchCampaignInfos(@RequestParam Map<String, Object> paramMap, ModelMap model, HttpServletRequest req) throws Exception{
        // 설정 파라메터 초기화 !!
        ComUtils.initialParameterMap();
        // Main 화면 정보들 조회 !!
        model.addAttribute("genFilePath", StringUtils.replace(genFilePath, "\\", "\\\\"));

        String forward = "/layout/bodycampaign";
        
        return forward;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "selectBanrList.do" , method = {RequestMethod.POST})
    public String selectBanrList(@RequestParam Map<String, String> paramMap, Model model)throws Exception {

        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        //ComUtils.setParameterMap(SessionUtils.getChestId() + "Banr", paramMap);

        Map<String, Object> resMap = mainService.selectBanrList(SessionUtils.setSessionInfo(paramMap));

        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "selectBhfBanrList.do" , method = {RequestMethod.POST})
    public String selectBhfBanrList(@RequestParam Map<String, String> paramMap, Model model)throws Exception {

        Map<String, Object> resMap = mainService.selectBhfBanrList(SessionUtils.setSessionInfo(paramMap));

        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(value = "selectMainBbsList.do" , method = {RequestMethod.POST})
    public String selectMainBbsList(@RequestParam Map<String, String> paramMap, Model model)throws Exception {

        // 공지사항(1000) 지회 공통 출력
        Map<String, String> commonParam = new HashMap<String, String>();
        commonParam.put("pBbsSn", "1000");
        commonParam.put("pBhfCode", paramMap.get("pBhfCode").toString());
        Map<String, Object> noticeMap = mainService.selectMainBbsList(SessionUtils.setSessionInfo(commonParam));

        // 언론보도(1003) 지회별 출력
        Map<String, String> mediaParam = new HashMap<String, String>();
        mediaParam.put("pBbsSn", "1003");
        mediaParam.put("pBhfCode", paramMap.get("pBhfCode").toString());
        Map<String, Object> mediaMap = mainService.selectMainBbsList(SessionUtils.setSessionInfo(mediaParam));

        // 지원안내(1004) 지회별 출력
        Map<String, String> supportParam = new HashMap<String, String>();
        supportParam.put("pBbsSn", "1004");
        supportParam.put("pBhfCode", paramMap.get("pBhfCode").toString());
        Map<String, Object> supportMap = mainService.selectMainBbsList(SessionUtils.setSessionInfo(supportParam));

        //나눔과 변화의 스토리.
        Map<String, String> reqParam = new HashMap<String, String>();
        reqParam.put("pBbsSn", "1009");
        reqParam.put("topNum", "6");
        reqParam.put("pBhfCode", paramMap.get("pBhfCode").toString());
        Map<String, Object> resMap = mainService.selectMainBbsList(SessionUtils.setSessionInfo(reqParam));

        model.addAttribute("listNotice", (List<ComCamelMap>) noticeMap.get("listInfo"));
        model.addAttribute("listMedia", (List<ComCamelMap>) mediaMap.get("listInfo"));
        model.addAttribute("listSupport", (List<ComCamelMap>) supportMap.get("listInfo"));
        model.addAttribute("listMain2", (List<ComCamelMap>) resMap.get("listInfo"));


        model.addAttribute("listMain3", mainService.selectMainList3(paramMap));

        return "jsonView";
    }

    /**
     * [ 메인 ] 사랑의 온도탑 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/selectTpTopInfo.do", method = { RequestMethod.POST })
    public String selectTpTopInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("dataInfo", (Map<String, Object>) mainService.selectTpTopInfo(paramMap));

        return "jsonView";
    }
}