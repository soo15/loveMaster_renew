package com.common.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : DownloadView.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] File Download
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01   
 *************************************************************************************************
 */
public class DownloadView extends AbstractView {
    private static final Logger logger = LoggerFactory.getLogger(DownloadView.class);
    
    /**
     * File Download
     * @param model
     * @param request
     * @param response
     * @return N/A
     */
    @SuppressWarnings("unchecked")
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> downloadMap = (Map<String, Object>) model.get("downloadInfoMap");
        
        String filePath   = (String) downloadMap.get("filePath");       // File Path
        String phycFileNm = (String) downloadMap.get("phycFileNm");     // Physical File Name
        String logcFileNm = (String) downloadMap.get("logcFileNm");     // Logical File Name
        
        logcFileNm = logcFileNm == null ? phycFileNm : logcFileNm;
        
        String fileFullPath = filePath + phycFileNm;
        
        logger.info(" ===> File Full Path = " + fileFullPath);
        
        File file = new File(fileFullPath);
        
        if(!(file != null && file.isFile() && file.exists())){
            logger.info("############# download file not exist #############");
            return;
        }
        
        if ("Opera".equals(getBrowser(request))){
            response.setContentType("application/octet-stream;charset=UTF-8");
        } else {
            response.setContentType(getContentType());
        }
        
        
        String disposition = getDisposition(logcFileNm, getBrowser(request));
        
        response.setHeader("Content-Disposition", disposition);
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        
        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;
        
        try {
            fis = new FileInputStream(file);
            
            int byteCount = FileCopyUtils.copy(fis, out);
            
            response.setContentLength(byteCount);
        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (Exception e) {
                    
                }
            }
        }
        
        out.flush();
    }
    
    
    /**
     * Getting Browser
     * @param request
     * @return String
     * @throws Exception
     */
    private String getBrowser(HttpServletRequest request) throws Exception {
        String header = request.getHeader("User-Agent");
        
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        }
        
        return "Firefox";
    }    
    
    
    /**
     * Getting Disposition
     * @param filename
     * @param browser
     * @return String
     * @throws Exception
     */
    private String getDisposition(String filename, String browser) throws Exception {
        String dispositionPrefix = "attachment;filename=";
        String encodedFilename = null;
        
        if (browser.equals("MSIE")) {
            encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.equals("Firefox")) {
            encodedFilename =  URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.equals("Opera")) {
            encodedFilename =  new String(filename.getBytes("UTF-8"), "8859_1");
        } else if (browser.equals("Chrome")) {
            StringBuffer sb = new StringBuffer();
            
            for (int i = 0; i < filename.length(); i++) {
                char c = filename.charAt(i);
                if (c > '~') {
                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
                } else {
                    sb.append(c);
                }
            }
            
            encodedFilename = sb.toString();
        } else {
            throw new RuntimeException("Not supported browser");
        }
        
        return dispositionPrefix + encodedFilename;
    }
}