package com.chest.fr.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

public interface FrmycntrMapper {
	
    public String selectListCount(Map<String, String> paramMap) throws Exception;
    
	public List<ComCamelMap> selectList(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> selectCicsList(Map<String, String> paramMap) throws Exception;
	
	public Map<ComCamelMap, Object> selectDetail(Map<String, String> paramMap) throws Exception;
    
	public String getIhidnumBizrno( Map<String, String> paramMap ) throws Exception;

	public int insert(Map<String, String> paramMap) throws Exception;

    public String insert_cntr(Map<String, String> paramMap) throws Exception;

}