package com.chest.sy.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : LogMapper.java
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
public interface LogMapper {
    /**
     * [ 시스템관리 - 접속로그관리 ] 로그 List Count 조회
     * @param paramMap
     * @return String
     */
    public String selectLogListCount(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 시스템관리 - 접속로그관리 ] 로그 List 조회
     * @param paramMap
     * @return List<ComCamelMap>
     */
    public List<ComCamelMap> selectLogList(Map<String, String> paramMap) throws Exception;
}