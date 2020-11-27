package com.chest.sy.service;

import java.util.Map;

/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : CommncodeService.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 공통코드관리 ]
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 7. 26.       박수호          Initial Release
 * CH_01   
 **************************************************************************************************/
public interface CommncodeService {
    /**
     * [ 시스템관리 - 공통코드관리 ] 그룹코드 조회
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectGroupCodeList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 상세코드 조회
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectDetailCodeList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 그룹코드 저장
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int storeGroupCodeList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 상세코드 저장
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int storeDetailCodeList(Map<String, String> paramMap) throws Exception;
}