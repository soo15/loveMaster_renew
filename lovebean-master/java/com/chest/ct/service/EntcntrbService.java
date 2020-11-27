package com.chest.ct.service;

import java.util.Map;

public interface EntcntrbService {
	
    /**
     * [ 기업사회공헌 ] 상담지역 조회 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 기부상담신청  상담지역
     */     
    public Map<String, Object> selectCodeList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 기업사회공헌 ] 기부상담신청 
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 기부상담신청, 기부상담이력  에 INSERT 
     */ 
	public int insertCompany(Map<String, String> setSessionInfo) throws Exception;
	
}