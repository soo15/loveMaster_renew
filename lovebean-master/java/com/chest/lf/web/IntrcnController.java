package com.chest.lf.web;

import java.lang.reflect.Array;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chest.lf.service.IntrcnService;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;
import com.common.util.StringUtils;


/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System 
 * Class Name  : IntrcnController.java 
 * Author      : Chest Front
 * Date        : 2019. 9. 17.
 * Description : [ 사랑의 열매 > 소개 ]  관련
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 17.   Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */

@Controller
@RequestMapping(value = "/lf/intrcn")
public class IntrcnController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IntrcnService intrcnService;

    @Autowired
    private ComService comService;

    // File Upload Path
    @Value("#{chest['gen.filePath']}")
    public String genFilePath;

    // 파일다운로드 경로
    @Value("#{chest['DOWNLOAD.FILEPATH']}")
    public String DOWN_FILE;

    // 지회
    public static final List<String> branchCodes = Arrays.asList("001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018");

    /**
     * [ 사랑의 열매는 ] 사랑의열매는  Page Loading
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initIntrcn.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initIntrcn(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {


        return "chest:/lf/lf_intrcn_intrcn_html_001";
    }


    /**
     * [ 인사말 ] 인사말 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initGrt.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initGrt(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
        String bhfCode = paramMap == null || paramMap.get("bhfCode") == null ? CookieUtils.getValue("__branchCd") : paramMap.get("bhfCode");
        model.addAttribute("paramMap", paramMap); // parameter

        // 해당 지사코드가 없을 경우 중앙회로 setting 
        if ( !branchCodes.contains(bhfCode)) bhfCode ="001";
        
        // 해당 지사별 인사말
        return "chest:/lf/lf_intrcn_grt_html_" + bhfCode;
    }

    /**
     * [ 조직소개 ] 조직소개 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initBranchintrcn.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initBranchintrcn(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {

        String bhfCode = paramMap == null || paramMap.get("bhfCode") == null ? CookieUtils.getValue("__branchCd") : paramMap.get("bhfCode");
        model.addAttribute("paramMap", paramMap); // parameter


        String mapYn = paramMap == null || paramMap.get("mapYn") == null ? "0" : "1";
        
        model.addAttribute("downPath", DOWN_FILE +  "\\" + bhfCode + "\\" ); // downLoad

        model.addAttribute("tabMapYn", mapYn);
        
        // 해당 지사코드가 없을 경우 중앙회로 setting 
        if ( !branchCodes.contains(bhfCode)) bhfCode ="001";
        // 해당 지사별 조직소개
        return "chest:/lf/lf_intrcn_branchintrcn_html_" + bhfCode;
    }

    /**
     * [ CI소개  ] CI소개 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initCiintrcn.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initCiintrcn(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {

        String branchCd =  CookieUtils.getValue("__branchCd");     
        // Path 
        model.addAttribute("downPath", DOWN_FILE +  "\\" + branchCd + "\\" ); // downLoad
        
        // 해당 지사별 CI소개
        return "chest:/lf/lf_intrcn_ciintrcn_html_001";
    }

    /**
     * [ 사업성과 ] 사업성과 Page Loading
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initBsnsrslt.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initBsnsrslt(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {

        return "chest:/lf/lf_intrcn_bsnsrslt_html_001";
    }

    /**
     * [ 함께하는 사람들 ] 함께하는 사람들 Page Loading
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initWpeople.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initWpeople(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {

        String bhfCode = paramMap == null || paramMap.get("bhfCode") == null ? CookieUtils.getValue("__branchCd") : paramMap.get("bhfCode");
        model.addAttribute("paramMap", paramMap); // parameter

        // 해당 지사코드가 없을 경우 중앙회로 setting 
        if ( !branchCodes.contains(bhfCode)) bhfCode ="001";
        // 해당 지사별 함께하는 사람들
        return "chest:/lf/lf_intrcn_wpeople_html_" + bhfCode;
    }

    /**
     * [ 걸어온길 ] 걸어온길 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initHist.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initHist(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {

        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Hist", paramMap);

        paramMap.get("pTab");

        String bhfCode = paramMap == null || paramMap.get("bhfCode") == null ? CookieUtils.getValue("__branchCd") : paramMap.get("bhfCode");
        model.addAttribute("paramMap", paramMap); // parameter

        // 해당 지사코드가 없을 경우 중앙회로 setting 
        if ( !branchCodes.contains(bhfCode)) bhfCode ="001";
        // 해당 지사별 걸어온길
        return "chest:/lf/lf_intrcn_hist_html_" + bhfCode;
    }

    /**
     * [ 홍보대사 ] 홍보대사 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initPrambassador.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initPrambassador(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {
        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
        Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Prambassador", paramMap);

        model.addAttribute("paramMap", paramTempMap); // parameter

        model.addAttribute("genFilePath", genFilePath);

        return "chest:/lf/lf_intrcn_prambassador_inqr_001";

    }

    /**
     * [ 홍보대사 ] 홍보대사 Page 리스트 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectPrambassadorList.do", method = { RequestMethod.POST })
    public String selectPrambassadorList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model)
            throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Prambassador", paramMap);

        Map<String, Object> resMap = intrcnService.selectPrambassadorList(paramMap);

        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }

    /**
     * [ 홍보대사 ] 홍보대사 Detail Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initPrambassadorDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initPrambassadorDetail(@RequestParam Map<String, String> paramMap, HttpSession session,
            ModelMap model) throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Prambassador", paramMap);

        model.addAttribute("paramMap", paramMap);

        model.addAttribute("genFilePath", genFilePath);

        return "chest:/lf/lf_intrcn_prambassador_detail_001";
    }

    /**
     * [ 홍보대사 ] 홍보대사 한 건 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/selectPrambassadorInfo.do", method = { RequestMethod.POST })
    public String selectPrambassadorInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("dataInfo", (Map<String, Object>) intrcnService.selectPrambassadorInfo(paramMap));

        return "jsonView";
    }

    /**
     * [ 홍보영상&인쇄물 ] 홍보영상&인쇄물 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initPrvidopress.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initPrvidopress(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {
        // 페이지 전환 시 넘겨준 파라메터 가져오기 !!
        Map<String, String> paramTempMap = ComUtils.getParameterMap(CookieUtils.getValue("__branchCd") + "Prvidopress", paramMap);

        // 새로 넘어오는 parameter(paramMap)의 tab 과 paramTempMap 의 tab 이 다르면 아래와 같이 parameter
        // set
        if (paramTempMap != null && paramTempMap.get("tab") != null
                && !paramTempMap.get("tab").equals(paramMap.get("tab"))) {
            paramTempMap.put("tab", paramMap.get("tab"));
            paramTempMap.put("pSj", "");
            paramTempMap.put("currPageNo", "1");
        }

        // 검색 조건에 공통코드 가져오는 ComboBox 가 있을 경우 해당 ComboBox에 값을 셋팅한 String을 보내줘야 함
        //String val = paramTempMap == null || paramTempMap.get("pBhfCode") == null ? "" : paramTempMap.get("pBhfCode");
        String val = paramTempMap == null || paramTempMap.get("pBhfCode") == null ? CookieUtils.getValue("__branchCd") : paramTempMap.get("pBhfCode");

        model.addAttribute("pBhfCode", comService.selectCmmnCodeComboString("HP0010", "X", val)); // 지회코드
        model.addAttribute("paramMap", paramTempMap); // parameter

        model.addAttribute("genFilePath", genFilePath);

        return "chest:/lf/lf_intrcn_prvidopress_inqr_001";
    }

    /**
     * [ 홍보영상&인쇄물 ] 홍보영상&인쇄물 Page 리스트 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectPrvidopressList.do", method = { RequestMethod.POST })
    public String selectPrvidopressList(@RequestParam Map<String, String> paramMap, HttpSession session, Model model)
            throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Prvidopress", paramMap);

        Map<String, Object> resMap = intrcnService.selectPrvidopressList(paramMap);

        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));

        return "jsonView";
    }

    /**
     * [ 홍보영상&인쇄물 ] 홍보영상&인쇄물 Detail Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initPrvidopressDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initPrvidopressDetail(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {
        // 페이지 전환 시 넘어온 파라메터 셋팅 !!
        ComUtils.setParameterMap(CookieUtils.getValue("__branchCd") + "Prvidopress", paramMap);

        model.addAttribute("paramMap", paramMap);

        model.addAttribute("genFilePath", genFilePath);

        return "chest:/lf/lf_intrcn_prvidopress_detail_001";
    }

    /**
     * [ 홍보영상&인쇄물 ] 홍보영상&인쇄물 한 건 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/selectPrvidopressInfo.do", method = { RequestMethod.POST })
    public String selectPrvidopressInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("dataInfo", (Map<String, Object>) intrcnService.selectPrvidopressInfo(paramMap));

        return "jsonView";
    }
}