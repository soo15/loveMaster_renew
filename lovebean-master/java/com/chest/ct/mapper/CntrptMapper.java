package com.chest.ct.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

public interface CntrptMapper {
	
	public List<ComCamelMap> selectCodeList(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrCnsltReqst(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrCnsltHist(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> selectCompanyList(Map<String, String> paramMap) throws Exception;

	public int insertTHP_GoodStorRciptAgre(Map<String, String> paramMap) throws Exception;

	public int goodStorCheck(Map<String, String> paramMap) throws Exception;

	public String updateTHP_GoodStorEmp(Map<String, String> paramMap) throws Exception;

	public int sameDataCheck(Map<String, String> paramMap) throws Exception;

	public int sameDataGoodStorEmp(Map<String, String> paramMap) throws Exception;

}