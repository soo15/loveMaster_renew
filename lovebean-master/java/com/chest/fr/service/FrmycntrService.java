package com.chest.fr.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

public interface FrmycntrService {
	
	public Map<String, Object> selectList(Map<String, String> paramMap) throws Exception;
	
	public Map<String, Object> selectCicsList(Map<String, String> paramMap) throws Exception;

	public Map<String, Object> selectDetail(Map<String, String> paramMap) throws Exception;

	public String getIhidnumBizrno(Map<String, String> paramMap) throws Exception;

	public int insert(Map<String, String> paramMap) throws Exception;

    public int insert_cntr(Map<String, String> paramMap) throws Exception;

	
}