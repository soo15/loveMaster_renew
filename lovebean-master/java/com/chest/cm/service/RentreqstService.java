package com.chest.cm.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartRequest;

public interface RentreqstService {

	public Map<String, Object> selectList(Map<String, String> paramMap) throws Exception;
	
	public Map<String, Object> selectReserveDetailList(Map<String, String> paramMap) throws Exception;
	
	public Map<String, Object> selectDetailList(Map<String, String> paramMap) throws Exception;

	public int updateProgrsStep(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> selectListIgnore(Map<String, String> paramMap) throws Exception;
	
	public Map<String, Object> selectTHP_ElstLmttSetup(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> selectGetDate(Map<String, String> paramMap) throws Exception;
	
	public Map<String, Object> selectPeriodDate(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> SelectReserveList(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> selectElstList(Map<String, String> paramMap) throws Exception;

	public int insert(Map<String, String> paramMap, MultipartRequest multipartRequest) throws Exception;

	public Map<String, Object> diffList(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> emplChk(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> selectDetail(Map<String, String> paramMap) throws Exception;

	public int passwordCheck(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> selectDetailModify(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> SelectReserveStatus(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> selectIgnoreCalendar(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> weekList(Map<String, String> setSessionInfo) throws Exception;

	
}