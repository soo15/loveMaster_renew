package com.main.service;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : MainService.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Main ] Main 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.  Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface MainService {


    /**
     * Select Login User Role Information
     * @param paramMap
     * @return List<Object>
     * @throws Exception
     */
    public List<Object> searchLoginUserRoleList(Map<String, String> paramMap) throws Exception;

    /* Banner 조회 */
    public Map<String, Object> selectBanrList(Map<String, String> paramMap) throws Exception;

    /* 지회 Banner 조회 */
    public Map<String, Object> selectBhfBanrList(Map<String, String> paramMap) throws Exception;

    /* 게시판 조회 (공지사항, 언론보도, 지원안내)*/
    public Map<String, Object> selectMainBbsList(Map<String, String> paramMap) throws Exception;

    public List<ComCamelMap> selectMainList3(Map<String, String> paramMap) throws Exception;

    /**
     * [ 메인 ] 사랑의 온도탑 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    public Map<String, Object> selectTpTopInfo(Map<String, String> paramMap) throws Exception;
}