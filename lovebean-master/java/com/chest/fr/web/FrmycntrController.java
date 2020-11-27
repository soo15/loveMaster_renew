package com.chest.fr.web;

import java.util.List;
import java.util.Map;

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

import com.chest.fr.service.FrmycntrService;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.SessionUtils;

@Controller
@RequestMapping(value="/fr/mycntr")
public class FrmycntrController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    //본인인증 코드
    @Value("#{checkPlus['CHECKPLUS.SITE_CODE']}")
    public String SITECODE;
    		
    //본인인증 사이트 비밀번호
    @Value("#{checkPlus['CHECKPLUS.SITE_PASSWORD']}")
    public String SITEPASSWORD;
    
    @Autowired
    private FrmycntrService service;
    
    @Autowired
    private ComService comService;
    	
    /***************************************************************************************************
     * ########### 기부내역조회  ###########
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     *****************************************************************************************************/
    @RequestMapping(value = "/initCntrdtlsinqire.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initCntrdtlsinqire(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
    	model.addAttribute("bhfCodeList", comService.selectCmmnCodeComboString("HP0010", "S"));
        return "chest:/fr/fr_mycntr_cntrdtlsinqire_regist_001";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	Map<String, Object> resMap = service.selectDetail(SessionUtils.setSessionInfo(paramMap));
    	Map<String, Object> list = service.selectList(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detailInfo", (Map<String, String>) resMap.get("detail"));        
        model.addAttribute("pageInfo", (Map<String, String>) list.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) list.get("listInfo"));
        return "jsonView";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectCicsList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectCicsList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	System.out.println("paramMap ==="+ SessionUtils.setSessionInfo(paramMap));
    	Map<String, Object> list = null;
        paramMap.put("mbtlnum", paramMap.get("mbtlnum").replaceAll("-", ""));
        String juminNo = service.getIhidnumBizrno( paramMap );
        
        if( !juminNo.equals("") ) {
        	paramMap.put("juminNo", juminNo);
        	list = service.selectCicsList(paramMap);
        	model.addAttribute("pageInfo", (Map<String, String>) list.get("pageInfo"));
            model.addAttribute("listInfo", (List<ComCamelMap>) list.get("listInfo"));
        } else {
        	model.addAttribute("pageInfo", "");
            model.addAttribute("listInfo", "");
        }
        return "jsonView";
    }
    
    /***
     * 본인인증 성공시 들어가는 페이지
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkPlusSuccess.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String checkPlusSuccess(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
        return "/common/checkPlus/checkplus_success";
    }
    
    /***
     * 본인인증 실패시 들어가는 페이지
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/checkFail.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String checkFail(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
        return "/common/checkPlus/checkplus_fail";
    }
    
    /**
     * 기부금 영수증 신청
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insert(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	logger.debug( "paramMap ===" + SessionUtils.setSessionInfo(paramMap) );
    	model.addAttribute("result", service.insert(SessionUtils.setSessionInfo(paramMap)));
        model.addAttribute("result", service.insert_cntr(SessionUtils.setSessionInfo(paramMap)));
        return "jsonView";
    }
    
}