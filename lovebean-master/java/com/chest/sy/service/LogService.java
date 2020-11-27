package com.chest.sy.service;

import java.util.Map;

/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : LogService.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 접속로그관리 ]
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 7. 26.       박수호          Initial Release
 * CH_01   
 **************************************************************************************************/
public interface LogService {
    
    /**
     * [ 시스템관리 - 접속로그관리 ] 로그 List 조회
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectLogList(Map<String, String> paramMap) throws Exception;
}