package com.chest.cm.service.impl;

import java.text.SimpleDateFormat;
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

import com.chest.cm.mapper.RentreqstMapper;
import com.chest.cm.service.RentreqstService;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;

@Service
@Transactional(rollbackFor={Exception.class})
public class RentreqstImpl implements RentreqstService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Value("#{chest['upload.filePath']}")
    public String genFilePath;
    
    @Autowired
    private RentreqstMapper mapper;
    
    public Map<String, Object> selectList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
    }
    
	@Override
	public Map<String, Object> selectListIgnore(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listIgnore = mapper.selectListIgnore(paramMap);
        resMap.put("listIgnore", listIgnore);
        return resMap;
	}
	
	@Override
	public Map<String, Object> selectTHP_ElstLmttSetup(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listIgnore = mapper.selectTHP_ElstLmttSetup(paramMap);
        resMap.put("list", listIgnore);
        return resMap;
	}
	
	@Override
	public Map<String, Object> SelectReserveList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listReserve = mapper.SelectReserveList(paramMap);
        resMap.put("listReserve", listReserve);
        return resMap;
	}
	
	@Override
	public Map<String, Object> selectReserveDetailList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        String listCount           = mapper.selectListCount(paramMap);
        List<ComCamelMap> listInfo = mapper.selectReserveDetailList(paramMap);
        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);
        return resMap;
	}
	
	@Override
	public Map<String, Object> selectGetDate(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        resMap.put("getDate", mapper.selectGetDate(paramMap));
        return resMap;
	}
	
	@Override
	public Map<String, Object> selectPeriodDate(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        resMap.put("detail", mapper.selectPeriodDate(paramMap));
        return resMap;
	}

	@Override
	public Map<String, Object> selectDetailList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<ComCamelMap> listDetail = mapper.selectDetailList(paramMap);
		resMap.put("listDetail", listDetail);
		return resMap;
	}

	@Override
	public int updateProgrsStep(Map<String, String> paramMap) throws Exception {
		int cnt = mapper.updateProgrsStep(paramMap);
		return cnt;
	}

	@Override
	public Map<String, Object> selectElstList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectElstList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}
	
	
	@Override
	public int insert(Map<String, String> paramMap , MultipartRequest multipartRequest) throws Exception {
		int cnt = 0;
		
		logger.debug("RENT paramMap ================================" + paramMap.toString() );
		
		//저장하기전에 예약이 있는지 확인
		cnt = mapper.reserveCheck(paramMap);
		if( cnt != 0 ) {
			return 111;
		}
		
		//THP_ElstLmttSetup 테이블에 기간이 포함돼 있는지 한번 더 체크
		cnt = mapper.reserveCheckSetupTable(paramMap);
		if( cnt != 0 ) {
			return 111;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		java.util.Calendar cal = java.util.Calendar.getInstance();
		String nowDate = sdf.format(cal.getTime());
		String uploadPath = genFilePath + "\\rent\\" + nowDate + "\\";
		String dbPath = "/HMPG/rent/" + nowDate + "/";
		
		//첨부파일처리
		Map<String, Object> resMap = com.common.util.FileUtils.fileUploadMap(multipartRequest, paramMap, uploadPath);
		
		String   uploadCnt  = (String)   resMap.get("uploadCnt");   // Upload Count
        String[] logcFileNm = (String[]) resMap.get("logcFileNm");  // logcFileNm File Name
        String[] phycFileNm = (String[]) resMap.get("phycFileNm");  // phycFileNm File Name
        String[] fileSize   = (String[]) resMap.get("fileSize");    // File Size
        String[] fileType   = (String[]) resMap.get("fileType");    // file Type (확장자)
        
        int resUploadCnt = Integer.parseInt(uploadCnt);
        
        try {
            if(fileSize.length > 0){
                // Upload File Information DataBase Insert !!
                for(int i=0; i<resUploadCnt; i++){
        			paramMap.put("flpth", dbPath);
        			paramMap.put("serverFileNm", logcFileNm[i]);
        			paramMap.put("orginlFileNm", phycFileNm[i]);
        			paramMap.put("fileExtsn",  fileType[i]);        // File Type (확장자)
        			paramMap.put("fileMg",  fileSize[i]);        	
                }
            }
        } catch (Exception e) {
            // Error 시 File Delete !!
            for(int i=0; i<resUploadCnt; i++){
            	com.common.util.FileUtils.fileDelete(uploadPath + logcFileNm[i]);
            }
            e.printStackTrace();
        }
        //삭제 먼저하고 시작하자ㅏ.
        mapper.delete(paramMap);
        
		cnt = mapper.insert(paramMap);
		return cnt;
	}

	@Override
	public Map<String, Object> diffList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.diffList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}

	@Override
	public Map<String, Object> emplChk(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.emplChk(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}

	@Override
	public Map<String, Object> selectDetail(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<ComCamelMap> listDetail = mapper.selectDetail(paramMap);
		resMap.put("listDetail", listDetail);
		return resMap;
	}

	@Override
	public int passwordCheck(Map<String, String> paramMap) throws Exception {
        int cnt = mapper.passwordCheck(paramMap);
        return cnt;
	}

	@Override
	public Map<String, Object> selectDetailModify(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        resMap.put("detail", mapper.selectDetailModify(paramMap));
        return resMap;
	}

	@Override
	public Map<String, Object> SelectReserveStatus(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.SelectReserveStatus(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}
	
	@Override
	public Map<String, Object> selectIgnoreCalendar(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectIgnoreCalendar(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}

	@Override
	public Map<String, Object> weekList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.weekList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}

}