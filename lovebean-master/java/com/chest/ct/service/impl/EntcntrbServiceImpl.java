package com.chest.ct.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.ct.mapper.EntcntrbMapper;
import com.chest.ct.service.EntcntrbService;
import com.common.map.ComCamelMap;

@Service
@Transactional(rollbackFor={Exception.class})
public class EntcntrbServiceImpl implements EntcntrbService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Value("#{chest['upload.filePath']}")
    public String genFilePath;
    
    @Autowired
    private EntcntrbMapper mapper;
    
    /**
     * [ 기업사회공헌 ] 상담지역 조회 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 기부상담신청  상담지역
     */ 
	@Override
	public Map<String, Object> selectCodeList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectCodeList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}

    
    /**
     * [ 기업사회공헌 ] 기부상담신청 
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 기부상담신청, 기부상담이력  에 INSERT 
     */	
	@Override
	@Transactional
	public int insertCompany(Map<String, String> paramMap) throws Exception {
		int cnt = 0;
		/**** 기부상담신청 */
		cnt = mapper.insertTHP_CntrCnsltReqst(paramMap);
		/**** 기부상담이력 */
		cnt = mapper.insertTHP_CntrCnsltHist(paramMap);
		return cnt;
	}

	
}