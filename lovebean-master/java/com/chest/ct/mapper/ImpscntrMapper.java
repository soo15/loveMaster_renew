package com.chest.ct.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

public interface ImpscntrMapper {
	
    public String selectListCount(Map<String, String> paramMap) throws Exception;
    
    public List<ComCamelMap> selectBankList(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrbtrInfo(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrSingl(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrIntrst(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrInfoAgre(Map<String, String> paramMap) throws Exception;
	
	public List<ComCamelMap> selectCodeList(Map<String, String> paramMap) throws Exception;
	
	public List<ComCamelMap> selectSetleMthdList(Map<String, String> paramMap) throws Exception;

	public int insertTHP_InipayLog(Map<String, String> paramMap) throws Exception;

	public int updateTHP_InipayLog(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrCnsltReqst(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrCnsltHist(Map<String, String> paramMap) throws Exception;

	public Map<ComCamelMap, Object> getInipayData(Map<String, String> paramMap) throws Exception;

	public int insertTHP_FundMysAnswer(Map<String, String> paramMap) throws Exception;

	public String getSpeclMyAt(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_NaverpayLog(Map<String, String> paramMap) throws Exception;
	
	public int updateTHP_NaverpayLog(Map<String, String> paramMap) throws Exception;
	
	public Map<ComCamelMap, Object> getNaverpayData(Map<String, String> paramMap) throws Exception;
	
	public Map<ComCamelMap, Object> getNaverpayFrmData(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrbtrInfoNpay(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrSinglNpay(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrIntrstNpay(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrInfoAgreNpay(Map<String, Object> paramMap) throws Exception;
	
	public int insertTHP_KakaopayLog(Map<String, String> paramMap) throws Exception;
	
	public int updateTHP_KakaopayLog(Map<String, String> paramMap) throws Exception;
	
	public Map<ComCamelMap, Object> getKakaopayData(Map<String, String> paramMap) throws Exception;
	
	public Map<ComCamelMap, Object> getKakaopayFrmData(Map<String, String> paramMap) throws Exception;

}