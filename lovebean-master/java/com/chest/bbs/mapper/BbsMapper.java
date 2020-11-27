package com.chest.bbs.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceMapper.java
 * Author      : Chest Front
 * Date        : 2019. 9. 5.
 * Description : [ 게시판 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 5.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface BbsMapper {
    /**
     * [ 게시판 ] 게시판 정보 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectBbsInfo(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 게시판 ] 게시판 탭 정보 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectBbsTabList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 게시판 ] 게시물 Page 리스트 Count 조회 !!
     * @param paramMap
     * @return String
     */
    public String selectPostListCount(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 게시판 ] 게시물 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectPostList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 게시판 ] 게시물 조회수 +1 증가 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int updatePostRdCnt(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 게시판 ] 게시물 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectPostInfo(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 게시판 ] 게시물 상세 페이지 내 이전, 다음글 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectPostPreNextList(Map<String, String> paramMap) throws Exception;
}