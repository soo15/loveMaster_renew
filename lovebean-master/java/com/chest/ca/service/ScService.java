package com.chest.ca.service;

import java.util.Map;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : ScService.java
 * Author      : Chest Front
 * Date        : 2020. 07. 23.
 * Description : [ 나눔문화캠페인 ] 
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2020. 07. 23.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface ScService {
    /**
     * [ 나눔문화캠페인 ] 투표하기 
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 나눔문화캠페인 테이블 에 INSERT 
     */ 
    public String insert(Map<String, String> paramMap) throws Exception;        
    
}