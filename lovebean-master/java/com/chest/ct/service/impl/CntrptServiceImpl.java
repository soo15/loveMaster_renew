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

import com.chest.ct.mapper.CntrptMapper;
import com.chest.ct.service.CntrptService;
import com.common.map.ComCamelMap;

@Service
@Transactional(rollbackFor={Exception.class})
public class CntrptServiceImpl implements CntrptService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Value("#{chest['upload.filePath']}")
    public String genFilePath;
    
    @Autowired
    private CntrptMapper mapper;
    
    /**
     * [ 기부참여방법 ] 상담지역 조회 
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
     * [ 기부참여방법 ] 기부상담신청 
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


	@Override
	public Map<String, Object> selectCompanyList(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
        List<ComCamelMap> listInfo = mapper.selectCompanyList(paramMap);
        resMap.put("listInfo", listInfo);
        return resMap;
	}


	@Override
	public String insert(Map<String, String> paramMap) throws Exception {
		System.out.println("paramMap =====" + paramMap.toString());
		//저장전에 신청된게 있는지 먼저 체크
		/**
		 * 등록 된 일터에 같은 이름은 데이터로 들어오지 않음. 2019.12.09
		 */
		int cnt = mapper.sameDataCheck(paramMap);
		if( cnt > 0 ) {
			return "신청은 1번 이상할 수 없습니다.";
		}
		
		//임직원으로 등록된 데이터가 있는지 또 체크 
		cnt = mapper.sameDataGoodStorEmp(paramMap);
		
		if( cnt > 0 ) {
			cnt = mapper.insertTHP_GoodStorRciptAgre(paramMap);
		} else {
			return "등록 된 임직원이 아닙니다";
		}
		return cnt+"";
	}

	@Override
	public int goodStorCheck(Map<String, String> paramMap) throws Exception {
		int cnt = mapper.goodStorCheck(paramMap);
        return cnt;
	}

	@Override
	public String updateTHP_GoodStorEmp(Map<String, String> paramMap) throws Exception {
		String cnt = mapper.updateTHP_GoodStorEmp(paramMap);
		return cnt;
	}

	
}