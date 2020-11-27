package com.chest.lf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartRequest;

import com.chest.lf.mapper.CtMapper;
import com.chest.lf.service.CtService;
import com.common.map.ComCamelMap;
import com.common.service.MailService;
import com.common.util.DateUtils;
import com.common.util.FileUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CtServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 10. 26.
 * Description : [ 신뢰와 투명성 ] 신뢰와 투명성 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 26.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class CtServiceImpl implements CtService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CtMapper ctMapper;
    
    @Value("#{chest['upload.filePath']}")
    public String uploadFilePath;

    /**
     * [ 신뢰와 투명성 ] 시민제안/공익신고 저장 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int insertCtznPropse(Map<String, String> paramMap, MultipartRequest multipartRequest) throws Exception {
        int result  = 0;

        String ctznPropseFilePath   = "/ctznPropse/" + DateUtils.getNowDate("yyyyMM") + "/";
        String fullFilePath         = uploadFilePath + ctznPropseFilePath;
        
        Map<String, Object> resMap = FileUtils.fileUploadMap(multipartRequest, paramMap, fullFilePath);
        result = Integer.parseInt((String) resMap.get("uploadFailType"));
        if(result > 1000) {
        	return result;
        }

        String   uploadCnt  = (String)   resMap.get("uploadCnt");   // Upload Count
        String[] logcFileNm = (String[]) resMap.get("logcFileNm");  // Logical File Name
        String[] phycFileNm = (String[]) resMap.get("phycFileNm");  // Physical File Name
        String[] fileSize   = (String[]) resMap.get("fileSize");    // File Size
        String[] fileType   = (String[]) resMap.get("fileType");    // file Type

        int resUploadCnt = Integer.parseInt(uploadCnt);

        try {
            if(resUploadCnt > 0){
                // Upload File Information DataBase Insert !!
                for(int i=0; i<resUploadCnt; i++){

                    logger.info("=========================== >>>>> File Info [filePath   " + i + "] = " + ctznPropseFilePath);
                    logger.info("=========================== >>>>> File Info [logcFileNm " + i + "] = " + logcFileNm[i]);
                    logger.info("=========================== >>>>> File Info [phycFileNm " + i + "] = " + phycFileNm[i]);
                    logger.info("=========================== >>>>> File Info [fileSize   " + i + "] = " + fileSize[i]);

                    paramMap.put("flpth",   ctznPropseFilePath);   // File Path
                    paramMap.put("serverFileNm", logcFileNm[i] );   // Logical File Name
                    paramMap.put("orginlFileNm", phycFileNm[i]);   // Physical File Name
                    paramMap.put("fileExtsn",   fileType[i]);      // File Type
                    paramMap.put("fileMg",   fileSize[i]);         // File Size
                }
            }

            result  = ctMapper.insertCtznPropse(paramMap);

            paramMap.put("ctznPropseSn", paramMap.get("ctzn_propse_sn"));
            result += ctMapper.insertCtznPropseHist(paramMap);
        } catch (Exception e) {
            e.printStackTrace();

            // Error 시 File Delete !!
            for(int j=0; j<resUploadCnt; j++){
                FileUtils.fileDelete(fullFilePath + phycFileNm[j]);
            }

            result = 0;
        }
        
        if(result != 2) {
            throw new Exception();
        }
        
       
        
        return result;
    }

	@Override
	public List<ComCamelMap> sendMailList() throws Exception {
		List<ComCamelMap> list = ctMapper.sendMailList(); 
		return list;
	}
    
}