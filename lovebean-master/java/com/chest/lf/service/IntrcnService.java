package com.chest.lf.service;

import java.util.Map;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : IntrcnService.java
 * Author      : Chest Front
 * Date        : 2019. 9. 17.
 * Description : [ 소개 ] 소개 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 17.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface IntrcnService {

    /**
     * [ 소개 ] 홍보대사 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectPrambassadorList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 소개 ] 홍보대사 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> selectPrambassadorInfo(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 소개 ] 홍보영상&인쇄물 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectPrvidopressList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 소개 ] 홍보영상&인쇄물 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> selectPrvidopressInfo(Map<String, String> paramMap) throws Exception;

}