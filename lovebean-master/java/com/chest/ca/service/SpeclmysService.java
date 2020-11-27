package com.chest.ca.service;

import java.util.Map;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceService.java
 * Author      : Chest Front
 * Date        : 2019. 9. 27.
 * Description : [ 캠페인 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 27.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface SpeclmysService {


    /**
     * [ 캠페인 ] 특별모금 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectSpeclmysList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 특별모금 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> selectSpeclmysInfo(Map<String, String> paramMap) throws Exception;

	public int insert(Map<String, String> setSessionInfo) throws Exception;
}