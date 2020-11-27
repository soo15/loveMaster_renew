package com.chest.lf.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : IntrcnMapper.java
 * Author      : Chest Front
 * Date        : 2019. 9. 17.
 * Description : [ 소개 ] 소개 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 17.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface IntrcnMapper {

    /**
     * [ 소개 ] 홍보대사 Page 리스트 Count 조회 !!
     * @param paramMap
     * @return String
     */
    public String selectPrambassadorListCount(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 소개 ] 홍보대사 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectPrambassadorList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 소개 ] 홍보대사 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectPrambassadorInfo(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 소개 ] 홍보대사 상세 페이지 내 이전, 다음글 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectPrambassadorPreNextList(Map<String, String> paramMap) throws Exception;
    
    
    /**
     * [ 소개 ] 홍보영상&인쇄물 Page 리스트 Count 조회 !!
     * @param paramMap
     * @return String
     */
    public String selectPrvidopressListCount(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 소개 ] 홍보영상&인쇄물 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectPrvidopressList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 소개 ] 홍보영상&인쇄물 조회수 +1 증가 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int updatePrvidopressRdCnt(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 소개 ] 홍보영상&인쇄물 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectPrvidopressInfo(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 소개 ] 홍보영상&인쇄물 상세 페이지 내 이전, 다음글 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectPrvidopressPreNextList(Map<String, String> paramMap) throws Exception;
}