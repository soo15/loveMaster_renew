package com.chest.lf.web;

import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartRequest;

import com.chest.lf.service.CtService;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.service.MailService;
import com.common.util.CookieUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CtController.java
 * Author      : Chest Front
 * Date        : 2019. 10. 26.
 * Description : [ 사랑의 열매 > 신뢰와 투명성 ]  관련
 *
 * History :
 * ************************************************************************************************
 * No. Date Name Description
 * ************************************************************************************************
 * CH_OO 2019. 10. 26. Chest Front Initial Release CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/lf/ct")
public class CtController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CtService ctService;

    @Autowired
    private ComService comService;
    
    @Autowired
    private MailService service;

    @Value("#{chest['gen.filePath']}")
    public String genFilePath;

    //본인인증 코드
    @Value("#{checkPlus['CHECKPLUS.SITE_CODE']}")
    public String SITECODE;

    //본인인증 사이트 비밀번호
    @Value("#{checkPlus['CHECKPLUS.SITE_PASSWORD']}")
    public String SITEPASSWORD;

    /**
     * [ 신뢰와 투명성 ] 시민제안 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initCtznpropse.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initCtznpropse(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {

        model.addAttribute("comboCtznPropseDetailSe",   comService.selectCmmnCodeComboString("HP0044", "S"));  // 제안상세구분
        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/lf/lf_ct_ctznpropse_regist_003";
    }

    /**
     * [ 신뢰와 투명성 ] 공익신고 Page Loading !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initPblbnfsttemnt.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String initPblbnfsttemnt(@RequestParam Map<String, String> paramMap, HttpSession session, ModelMap model)
            throws Exception {

        model.addAttribute("siteCode", SITECODE );
        model.addAttribute("sitePassword", SITEPASSWORD);

        return "chest:/lf/lf_ct_pblbnfsttemnt_regist_004";
    }

    /**
     * [ 신뢰와 투명성 ] 시민제안/공익신고 저장 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/insertCtznPropse.do", method = {RequestMethod.POST})
    public String reqstCrwdfund(@RequestParam Map<String, String> paramMap, MultipartRequest multipartRequest, Model model) throws Exception {
    	int result = ctService.insertCtznPropse(paramMap, multipartRequest);
        model.addAttribute("result", result);
        if( !paramMap.get("ctznPropseSe").equals("01") && result < 1001) {
        	sendMail( paramMap );	//메일발송 - 분산 트랜잭션을 시작할 수 없으므로 요청한 작업을 수행할 수 없습니다 : 권한? 때문에 따로 처리
        }
        return "jsonView";
    }


    /**
     * [ 신뢰와 투명성 ] 경영공시  Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initMngmtpblntf.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initMngmtpblntf(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

        return "chest:/lf/lf_ct_mngmtpblntf_html_002";
    }
    
    /**
     * [ 신뢰와 투명성 ] 시민참여위원회  Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initCtpartcomm.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initCtpartcomm(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	String branchCd = CookieUtils.getValue("__branchCd") == null ? "001" : CookieUtils.getValue("__branchCd");
    	logger.debug("branchCd ======"+ branchCd);
    	model.addAttribute("branchCd", branchCd );
        return "chest:/lf/lf_ct_partcomm_html_001";
    }
    
    /**
     * 메일발송
     * @return
     * @throws Exception
     */
    public void sendMail( Map<String, String> paramMap ) throws Exception {
    	Map<String, String> parameter = new HashMap<String , String>();
        List<ComCamelMap> listMail = ctService.sendMailList();
        String mails = null;
        for( int i=0; i<listMail.size(); i++ ) {
        	if( i==0 ) {
        		mails = (String) listMail.get(i).get("email");
        	} 
        	mails = mails + "," + (String) listMail.get(i).get("email");
        }
        parameter.put("to", mails);
        parameter.put("title", "[공익신고알림]");
        parameter.put("content", paramMap.get("ctznPropseCn"));
        service.sendMail(parameter);
    }
}