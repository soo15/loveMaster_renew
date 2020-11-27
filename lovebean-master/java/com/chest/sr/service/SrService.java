package com.chest.sr.service;

import java.util.Map;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceService.java
 * Author      : Chest Front
 * Date        : 2019. 10. 22.
 * Description : [ 검색 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 22.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface SrService {
    /**
     * [ 검색 ] 검색 결과 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectSearchList(Map<String, String> paramMap) throws Exception;
}