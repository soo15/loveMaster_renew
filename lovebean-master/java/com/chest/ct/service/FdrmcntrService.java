package com.chest.ct.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

public interface FdrmcntrService {
	
    public Map<String, Object> selectBankList(Map<String, String> paramMap) throws Exception;
    
    public Map<String, Object> selectCodeList(Map<String, String> paramMap) throws Exception;

	public String insert(Map<String, String> paramMap , MultipartRequest multipartRequest , HttpServletRequest request ) throws Exception;

	public int insertCompany(Map<String, String> setSessionInfo) throws Exception;

	public Map<String, Object> payInfo(Map<String, String> setSessionInfo) throws Exception;
	
	public Map<String, String> checkValidator(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_NaverpayLog(Map<String, String> paramMap ) throws Exception;
	
	public Map<String, Object> getNaverpayFrmData(Map<String, String> setSessionInfo) throws Exception;
	
	public Map<String, String> insertTHP_KakaopayLog(Map<String, String> paramMap ) throws Exception;
	
	public int updateTHP_KakaopayLog(Map<String, String> paramMap ) throws Exception;
	
	public Map<String, Object> getKakaopayFrmData(Map<String, String> setSessionInfo) throws Exception;
}