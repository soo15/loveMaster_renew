package com.main.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : MainMapper.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Main ] Main 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface MainMapper {

    /**
     * Select Login User Role Information
     * @param paramMap
     * @return List<Object>
     * @throws Exception
     */
    public List<Object> searchLoginUserRoleList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 메인 ] 메인배너 리스트 조회 !!
     * @param paramMap
     * @return List<ComCamelMap>
     */
    public List<ComCamelMap> selectBanrList(Map<String, String> paramMap);

    /**
     * [ 메인 ] 지회메인배너 리스트 조회 !!
     * @param paramMap
     * @return List<ComCamelMap>
     */
    public List<ComCamelMap> selectBhfBanrList(Map<String, String> paramMap);

    /**
     * [ 메인 ] 게시판 리스트 조회 !!
     * @param paramMap
     * @return List<ComCamelMap>
     */
    public List<ComCamelMap> selectMainBbsList(Map<String, String> paramMap);

    /**
     * [ 메인 ] 내가만드는 따뜻한세상.
     * @param paramMap
     * @return List<ComCamelMap>
     */
    public List<ComCamelMap> selectMainList3(Map<String, String> paramMap);

    /**
     * [ 메인 ] 사랑의 온도탑 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    public ComCamelMap selectTpTopInfo(Map<String, String> paramMap) throws Exception;
}