package com.chest.cm.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceMapper.java
 * Author      : Chest Front
 * Date        : 2019. 9. 5.
 * Description : [ 기관방문신청 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 5.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface SereqstMapper {
    /**
     * [ 기관방문신청 ] 기부상담신청 신청  및 수정하기 ( 신청하기 TAB ) 
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 기관방문신청 테이블 에 INSERT 
     */ 
    public int insertTHP_InsttVisitReqst(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 기관방문신청 ] 기관방문신청 리스트 중 신청 취소 ( 신청내역조회 TAB ) 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 기관방문신청 리스트 중 신청취소 한다. 
     * 기관방문신청 테이블에 취소여부에 취소를 반영한다. (UPDATE) 
     */ 
    public int updateCancelTHP_InsttVisitReqst(Map<String, String> paramMap) throws Exception;

    /**
     * [ 기관방문신청 ] 기관방문신청 내역조회 ( 신청하기 TAB ) 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 신청내역조회 TAB 에서 상담신청을 click 하거나 신청기관을 click 한 경우 해당 신청정로를 신청하기 TAB 에  1건 조회한다. 
     */ 
    public List<ComCamelMap> selectInsttVisitReqst(Map<String, String> paramMap) throws Exception;
    
    
    
    /**
     * [ 기관방문신청 ] 기관방문신청 리스트  조회  ( 신청내역조회 TAB ) 
     * 기관방문신청 리스트 건수 조회  
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */

    public String selectReqstListCount(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 기관방문신청 ] 기관방문신청 리스트  조회  ( 신청내역조회 TAB ) 
     * 검색 조건에 입력한 내용으로  신청내역조회 TAB 에 리스트를 조회한다. 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectReqstList(Map<String, String> paramMap) throws Exception;
    

}