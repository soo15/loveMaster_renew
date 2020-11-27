package com.chest.ct.service;

import java.util.Map;

public interface CntrptService {
	
    /**
     * [ 기부참여방법 ] 상담지역 조회 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 기부상담신청  상담지역
     */     
    public Map<String, Object> selectCodeList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 기부참여방법 ] 기부상담신청 
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 기부상담신청, 기부상담이력  에 INSERT 
     */ 
	public int insertCompany(Map<String, String> setSessionInfo) throws Exception;
	
	/**
	 * 참여기업명
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectCompanyList(Map<String, String> paramMap) throws Exception;
	
	/**
	 * 영수증 신청
	 * @param setSessionInfo
	 * @return
	 * @throws Exception
	 */
	public String insert(Map<String, String> setSessionInfo) throws Exception;

	/**
	 * 인증코드 체크
	 * @param setSessionInfo
	 * @return
	 */
	public int goodStorCheck(Map<String, String> setSessionInfo) throws Exception;
	
	/**
	 * 
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	public String updateTHP_GoodStorEmp(Map<String, String> paramMap) throws Exception;
	
	
	
}