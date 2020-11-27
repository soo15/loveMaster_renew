package com.chest.ca.service;

import java.util.Map;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceService.java
 * Author      : Chest Front
 * Date        : 2019. 10. 21.
 * Description : [ 캠페인 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 21.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface CrwdfundService {

    /**
     * [ 캠페인 ] 클라우드 펀딩 신청하기 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int reqstCrwdfund(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 Page 리스트 조회 !! (서버 날짜 오늘 기준으로 진행, 종료 펀딩 가져옴)
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectCrwdfundList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> selectCrwdfundInfo(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectCrwdfundAnswerList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 수정/삭제를 위한 비밀번호 체크 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> checkReplyPw(Map<String, String> paramMap) throws Exception;

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
    public Map<String, Object> selectCrwdfundReplyInfo(Map<String, String> paramMap) throws Exception;

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 수정 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int updateReply(Map<String, String> paramMap) throws Exception;

}