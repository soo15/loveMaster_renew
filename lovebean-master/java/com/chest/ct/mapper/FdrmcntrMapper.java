package com.chest.ct.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

public interface FdrmcntrMapper {
	
    public String selectListCount(Map<String, String> paramMap) throws Exception;
    
    public List<ComCamelMap> selectBankList(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrbtrInfo(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrEnggReqst(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrIntrst(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrInfoAgre(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrMarktAgre(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_CntrReqstFile(Map<String, String> paramMap) throws Exception;

	public List<ComCamelMap> selectCodeList(Map<String, String> paramMap) throws Exception;
	
	public int insertTHP_InipayLog(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrCnsltReqst(Map<String, String> paramMap) throws Exception;

	public int insertTHP_CntrCnsltHist(Map<String, String> paramMap) throws Exception;

	public Map<ComCamelMap, Object> payInfo(Map<String, String> paramMap) throws Exception;

	public String getBankNm(String string) throws Exception;
	
	public int insertTHP_NaverPayLog(Map<String, String> paramMap) throws Exception;
	
	public int updateTHP_NaverpayLog(Map<String, String> paramMap) throws Exception;
	
	public Map<ComCamelMap, Object> getNaverpayFrmData(Map<String, String> paramMap) throws Exception;
	
	public List<ComCamelMap> selectNpayApprList(Map<String, String> paramMap) throws Exception;
	
	public int updateNpayApprResult(Map<String, String> paramMap) throws Exception;
	
	public int insertNaverPayHistory(List<Map> paramMap) throws Exception;
	
	public String getInqireEndde(Map<String, String> paramMap) throws Exception;

	public int insertTHP_KakaopayLog(Map<String, String> paramMap) throws Exception;
	
	public int updateTHP_KakaopayLog(Map<String, String> paramMap) throws Exception;
	
	public Map<ComCamelMap, Object> getKakaopayFrmData(Map<String, String> paramMap) throws Exception;
	
	public List<ComCamelMap> selectKpayApprList(Map<String, String> paramMap) throws Exception;
	
	public int updateKpayApprResult(Map<String, String> paramMap) throws Exception;
	
	public int insertKakaoPayHistory(List<Map> paramMap) throws Exception;
	
	public int insertKakaoPaySttlm(List<Map> paramMap) throws Exception;
}