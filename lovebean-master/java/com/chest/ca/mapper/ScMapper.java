package com.chest.ca.mapper;

import java.util.Map;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : ScMapper.java
 * Author      : Chest Front
 * Date        : 2020. 07. 23.
 * Description : 나눔문화캠페인
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2020. 07. 23.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface ScMapper {
	
	/**
     * [나눔문화캠페인] 투표여부조회
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 휴대폰 번호로 투표여부 체크
     */
    public int selectReqstCheck(Map<String, String> paramMap) throws Exception;
	
    /**
     * [나눔문화캠페인] 투표하기
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 나눔문화캠페인 테이블 에 INSERT 
     */ 
    public int insertTHP_EryndReqstRegist(Map<String, String> paramMap) throws Exception;
    
}
