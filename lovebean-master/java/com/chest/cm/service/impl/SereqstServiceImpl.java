package com.chest.cm.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartRequest;

import com.chest.cm.mapper.SereqstMapper;
import com.chest.cm.service.SereqstService;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;

@Service
@Transactional(rollbackFor={Exception.class})
public class SereqstServiceImpl implements SereqstService {
    
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Value("#{chest['upload.filePath']}")
    public String genFilePath;
    
    @Autowired
    private SereqstMapper mapper;
    
    /**
     * [ 기관방문신청 ] 기부상담신청 신청 하기 ( 신청하기 TAB ) 
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 기관방문신청 테이블 에 INSERT 
     */ 
    @Override
    @Transactional
    public int insert(Map<String, String> paramMap, MultipartRequest multipartRequest) throws Exception {
        int cnt = 0;
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        java.util.Calendar cal = java.util.Calendar.getInstance();
        String nowDate = sdf.format(cal.getTime());

        // String uploadPath = genFilePath + "\\ct\\" + nowDate + "\\";  // C:\HMPG\\ct\201910\
        String uploadPath = genFilePath + "\\cm\\" + nowDate + "\\";
        String dbPath = "/HMPG/cm/" + nowDate + "/";
        Map<String, Object> resMap = com.common.util.FileUtils.fileUploadMap(multipartRequest, paramMap, uploadPath);
        
        String   uploadCnt  = (String)   resMap.get("uploadCnt");   // Upload Count
        String[] logcFileNm = (String[]) resMap.get("logcFileNm");  // Physical File Name
        String[] fileSize   = (String[]) resMap.get("fileSize");    // File Size
        String[] fileType   = (String[]) resMap.get("fileType");    // file Type (확장자)
        
        int resUploadCnt = Integer.parseInt(uploadCnt);
        
        
        try {
            if(fileSize.length > 0){
                // Upload File Information DataBase Insert !!
                for(int i=0; i<resUploadCnt; i++){
//                    paramMap.put("flpth", uploadPath);   // 경로 
                    paramMap.put("flpth", dbPath);   		// 경로 
                    paramMap.put("fileMg", fileSize[i]);  // File Size 
                    paramMap.put("extsn",  fileType[i]);     // File Type (확장자)
                    paramMap.put("fileName", logcFileNm[i]); // 서버파일명, 원파일명 

//                    logger.info("---------phycFileNm ="+phycFileNm[i] );
//                    logger.info("---------fileType   ="+fileType[i] );
                }
            }
            
        } catch (Exception e) {
            // Error 시 File Delete !!
            for(int i=0; i<resUploadCnt; i++){
                com.common.util.FileUtils.fileDelete(uploadPath + logcFileNm[i]);
            }
            e.printStackTrace();
        }
     
        
        /**** 기부상담신청 */
        cnt = mapper.insertTHP_InsttVisitReqst(paramMap);
        
        return cnt;
    }
    
    /**
     * [ 기관방문신청 ] 기관방문신청 리스트 중 신청 취소 ( 신청내역조회 TAB ) 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 기관방문신청 리스트 중 신청취소 한다. 
     * 기관방문신청 테이블에 취소여부에 취소를 반영한다. (UPDATE) 
     */ 
    @Override
    @Transactional
    public int cancel(Map<String, String> paramMap) throws Exception {
        int cnt = 0;
        
        /**** 기부상담신청 취소*/
        cnt = mapper.updateCancelTHP_InsttVisitReqst(paramMap);
        
        return cnt;
    }
    
    
    /**
     * [ 기관방문신청 ] 기관방문신청 내역조회 ( 신청하기 TAB ) 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 신청내역조회 TAB 에서  리스트 중 신청기관명을 click 한 경우 해당 신청정보가 신청하기 TAB 에  1건 조회한다. 
     */ 
	@Override
	public Map<String, Object> selectInsttDetail(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		List<ComCamelMap> listDetail = mapper.selectInsttVisitReqst(paramMap);
		
        resMap.put("listDetail", listDetail);
        return resMap;
	}


    
    /**
     * [ 기관방문신청 ] 기관방문신청 리스트  조회  ( 신청내역조회 TAB ) 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 검색 조건에 입력한 내용으로  신청내역조회 TAB 에 리스트를 조회한다. 
     * 검색조건이 없을 경우 전체 리스트를 조회 한다.  
     */
    public Map<String, Object> selectInsttList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        String listCount           = mapper.selectReqstListCount(paramMap);
        List<ComCamelMap> listInfo = mapper.selectReqstList(paramMap);
        
        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }    

	
}