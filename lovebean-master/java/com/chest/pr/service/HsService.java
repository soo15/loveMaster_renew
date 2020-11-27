package com.chest.pr.service;

import java.util.Map;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : HsService.java
 * Author      : Chest Front
 * Date        : 2019. 9. 25.
 * Description : [ 기부자그룹 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 25.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface HsService {


    /**
     * [ 아너소사이어티] 회원소개 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectMberintrcnList(Map<String, String> paramMap) throws Exception;
    
}