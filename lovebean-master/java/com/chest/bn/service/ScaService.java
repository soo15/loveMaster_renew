package com.chest.bn.service;

import java.util.Map;

import com.common.map.ComCamelMap;
import org.springframework.web.multipart.MultipartRequest;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : ScaService.java
 * Author      : Chest Front
 * Date        : 2019. 9. 18.
 * Description : [ 나눔문화활성화 ] 나눔문화연구소 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 18.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface ScaService {
    /**
     * [ 나눔체험신청 ] 기부상담신청 신청 하기 ( 신청하기 TAB ) 
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 나눔체험신청 테이블 에 INSERT 
     */ 
    public int insert(Map<String, String> paramMap, MultipartRequest multipartRequest) throws Exception;
    
    /**
     * [ 나눔체험신청 ] 나눔체험신청 리스트 중 신청 취소 ( 신청내역조회 TAB ) 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 나눔체험신청 리스트 중 신청취소 한다. 
     * 나눔체험신청 테이블에 취소여부에 취소를 반영한다. (UPDATE) 
     */ 
    public int cancel(Map<String, String> paramMap)  throws Exception;
    

    /**
     * [ 나눔체험신청 ] 나눔체험신청 내역조회 ( 신청하기 TAB ) 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 신청내역조회 TAB 에서 상담신청을 click 하거나 신청기관을 click 한 경우 해당 신청정로를 신청하기 TAB 에  1건 조회한다. 
     */ 
    public Map<String, Object> selectInsttDetail(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 나눔체험신청 ] 나눔체험신청 리스트  조회  ( 신청내역조회 TAB ) 
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     * 검색 조건에 입력한 내용으로  신청내역조회 TAB 에 리스트를 조회한다. 
     * 검색조건이 없을 경우 전체 리스트를 조회 한다.  
     */
    public Map<String, Object> selectInsttList(Map<String, String> paramMap) throws Exception;
    
}