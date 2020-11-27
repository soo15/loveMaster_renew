package com.chest.bbs.service;

import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceService.java
 * Author      : Chest Front
 * Date        : 2019. 9. 5.
 * Description : [ 게시판 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 5.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface BbsService {

    /**
     * [ 게시판 ] 게시판 정보 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> selectBbsInfo(Map<String, String> paramMap) throws Exception;

    /**
     * [ 게시판 ] 게시물 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectPostList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 게시판 ] 게시물 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> selectPostInfo(Map<String, String> paramMap) throws Exception;
}