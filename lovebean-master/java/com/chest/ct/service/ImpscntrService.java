package com.chest.ct.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartRequest;

public interface ImpscntrService {
	
    public Map<String, Object> selectBankList(Map<String, String> paramMap) throws Exception;
    
    public Map<String, Object> selectCodeList(Map<String, String> paramMap) throws Exception;
    
    public Map<String, Object> selectSetleMthdList(Map<String, String> paramMap) throws Exception;

	public int insert(Map<String, String> paramMap ) throws Exception;

	public int insertTHP_InipayLog(Map<String, String> paramMap ) throws Exception;
	
	public int insertCompany(Map<String, String> setSessionInfo) throws Exception;

	public Map<String, Object> getInipayData(Map<String, String> setSessionInfo) throws Exception;

	public int insertTHP_FundMysAnswer(Map<String, String> setSessionInfo) throws Exception;

	public String getSpeclMyAt(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_NaverpayLog(Map<String, String> paramMap ) throws Exception;
	
	public int updateTHP_NaverpayLog(Map<String, String> paramMap ) throws Exception;
	
	public String insertNpay(Map<String, String> paramMap ) throws Exception;
	
	public Map<String, Object> getNaverpayData(Map<String, String> setSessionInfo) throws Exception;
	
	public Map<String, Object> getNaverpayFrmData(Map<String, String> setSessionInfo) throws Exception;
	
	public Map<String, String> checkValidator(Map<String, String> paramMap) throws Exception;
	
	public Map<String, String> insertTHP_KakaopayLog(Map<String, String> paramMap ) throws Exception;
	
	public String insertKpay(Map<String, String> paramMap ) throws Exception;
	
	public int updateTHP_KakaopayLog(Map<String, String> paramMap ) throws Exception;
	
	public Map<String, Object> getKakaopayData(Map<String, String> setSessionInfo) throws Exception;
	
	public Map<String, Object> getKakaopayFrmData(Map<String, String> setSessionInfo) throws Exception;
}