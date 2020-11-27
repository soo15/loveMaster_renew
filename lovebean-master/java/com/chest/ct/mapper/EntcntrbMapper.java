package com.chest.ct.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

public interface EntcntrbMapper {
	
	public List<ComCamelMap> selectCodeList(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrCnsltReqst(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrCnsltHist(Map<String, String> paramMap) throws Exception;

}