package com.chest.ca.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CrwdfundMapper.java
 * Author      : Chest Front
 * Date        : 2019. 10. 21.
 * Description : [ 캠페인 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 21.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface CrwdfundMapper {

    /**
     * [ 캠페인 ] 클라우드 펀딩 신청하기 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int reqstCrwdfund(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 신청이력 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int reqstCrwdfundHist(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 Page 리스트 Count 조회 !!
     * @param paramMap
     * @return String
     */
    public String selectCrwdfundListCount(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectCrwdfundList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectCrwdfundInfo(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 Page 리스트 Count 조회 !!
     * @param paramMap
     * @return String
     */
    public String selectCrwdfundAnswerListCount(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectCrwdfundAnswerList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 비밀번호 체크
     * @param paramMap
     * @return String
     */
    public int checkReplyPw(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 삭제 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int deleteReply(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectCrwdfundReplyInfo(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 수정 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int updateReply(Map<String, String> paramMap) throws Exception;
}