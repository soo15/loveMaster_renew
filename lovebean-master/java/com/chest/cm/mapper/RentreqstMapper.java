package com.chest.cm.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

public interface RentreqstMapper {

	public List<ComCamelMap> selectList(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> selectDetailList(Map<String, String> paramMap) throws Exception;
	
	public List<ComCamelMap> selectReserveDetailList(Map<String, String> paramMap) throws Exception;
	
	public String selectListCount(Map<String, String> paramMap) throws Exception;

	public int updateProgrsStep(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> selectListIgnore(Map<String, String> paramMap) throws Exception;
	
	public List<ComCamelMap> selectTHP_ElstLmttSetup(Map<String, String> paramMap) throws Exception;

	public Map<ComCamelMap, Object> selectGetDate(Map<String, String> paramMap) throws Exception;
	
	public Map<ComCamelMap, Object> selectPeriodDate(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> SelectReserveList(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> selectElstList(Map<String, String> paramMap) throws Exception;

	public int insert(Map<String, String> paramMap) throws Exception;


	public List<ComCamelMap> diffList(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> emplChk(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> selectDetail(Map<String, String> paramMap) throws Exception;

	public int passwordCheck(Map<String, String> paramMap) throws Exception;

	public Map<ComCamelMap, Object> selectDetailModify(Map<String, String> paramMap) throws Exception;

	public void delete(Map<String, String> paramMap) throws Exception;

	public int reserveCheck(Map<String, String> paramMap) throws Exception;
	
	public int reserveCheckSetupTable(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> SelectReserveStatus(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> selectIgnoreCalendar(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> weekList(Map<String, String> paramMap) throws Exception;
    
}