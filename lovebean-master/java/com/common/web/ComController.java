package com.common.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.SessionUtils;
import com.common.util.StringUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : ComController.java
 * Author      : Chest Front
 * Date        : 2019. 8. 1.
 * Description : [ Common ] Controller
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.   Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/common")
public class ComController {
    @Value("#{chest['gen.filePath']}")
    public String genFilePath;

    @Value("#{chest['upload.filePath']}")
    public String uploadFilePath;

    //본인인증 코드
    @Value("#{checkPlus['CHECKPLUS.SITE_CODE']}")
    public String SITECODE;
    		
    //본인인증 사이트 비밀번호
    @Value("#{checkPlus['CHECKPLUS.SITE_PASSWORD']}")
    public String SITEPASSWORD;
    
    @Autowired
    private ComService comService;

    /**
     * [ Common ] 첨부 파일 다운로드 체크 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value="/checkGenDownloadFile.do", method= {RequestMethod.POST})
    public String checkGenDownloadFile(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        String filePath     = paramMap.get("filePath");
        String fileFullPath = (!StringUtils.isNull(filePath) ? uploadFilePath + filePath : uploadFilePath) + paramMap.get("phycFileNm");

        File file = new File(fileFullPath);

        model.addAttribute("existYn",   file.exists() ? "Y" : "N");
        model.addAttribute("actionUrl", paramMap.get("actionUrl"));

        return "jsonView";
    }

    /**
     * [ Common ] 첨부 파일 다운로드 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value="/genDownloadFile.do", method= {RequestMethod.POST})
    public String genDownloadFile(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        String filePath = paramMap.get("filePath");

        resMap.put("filePath",   !StringUtils.isNull(filePath) ? uploadFilePath + filePath : uploadFilePath);
        resMap.put("phycFileNm", paramMap.get("phycFileNm"));
        resMap.put("logcFileNm", paramMap.get("logcFileNm"));

        model.addAttribute("downloadInfoMap", resMap);

        return "downloadView";
    }

    /**
     * [ Common ] 첨부 파일 삭제 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value="/genDeleteFile.do", method= {RequestMethod.GET, RequestMethod.POST})
    public String genDeleteFile(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        model.addAttribute("result",   comService.genDeleteFile(SessionUtils.setSessionInfo(paramMap)));
        model.addAttribute("paramMap", paramMap);

        return "jsonView";
    }
    
    /***
     * [ Common ] 본인인증 팝업호출
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/nicePopup.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String nicePopup(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
        return "/common/pop/nicePopup";
    }
    
    
    @RequestMapping(value = "/nicePopupTest.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String nicePopup1(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("siteCode", SITECODE );
    	model.addAttribute("sitePassword", SITEPASSWORD);
        return "/common/pop/nicePopupTest";
    }
    
    /**
     * [ Common ] 첨부 파일 다운로드 체크 (첨부파일순번)
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value="/checkGenDownloadFileSn.do", method= {RequestMethod.POST})
    public String checkGenDownloadFileSn(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	
    	Map<String, Object> resMap = comService.selectFileDetailInfo(paramMap);
        ComCamelMap filedetailinfo = (ComCamelMap)resMap.get("filedetailinfo");
    	
        String filePath     = (String) filedetailinfo.get("flpth");
        String fileFullPath = (!StringUtils.isNull(filePath) ? uploadFilePath + filePath : uploadFilePath) + paramMap.get("phycFileNm");
        
        File file = new File(fileFullPath);

        model.addAttribute("existYn",   file.exists() ? "Y" : "N");
        model.addAttribute("actionUrl", paramMap.get("actionUrl"));

        return "jsonView";
    }

    /**
     * [ Common ] 첨부 파일 다운로드 (첨부파일순번)
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value="/genDownloadFileSn.do", method= {RequestMethod.POST})
    public String genDownloadFileSn(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	
    	Map<String, Object> fileMap = comService.selectFileDetailInfo(paramMap);
        ComCamelMap filedetailinfo = (ComCamelMap)fileMap.get("filedetailinfo");        
    	
        Map<String, Object> resMap = new HashMap<String, Object>();
        String filePath  = (String) filedetailinfo.get("flpth");

        resMap.put("filePath",   !StringUtils.isNull(filePath) ? uploadFilePath + filePath : uploadFilePath);
        resMap.put("phycFileNm", paramMap.get("phycFileNm"));
        resMap.put("logcFileNm", paramMap.get("logcFileNm"));

        model.addAttribute("downloadInfoMap", resMap);

        return "downloadView";
    }
}