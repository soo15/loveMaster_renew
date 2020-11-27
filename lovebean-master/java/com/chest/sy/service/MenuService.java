package com.chest.sy.service;

import java.util.Map;

/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : MenuService.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 관리자메뉴관리 ]
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 7. 26.       박수호          Initial Release
 * CH_01   
 **************************************************************************************************/
public interface MenuService {
    /**
     * [ Menu ] Menu Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectMenuList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ Menu ] Menu Page 한 건 저장(신규 입력 또는 수정) !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int storeMenuInfo(Map<String, String> paramMap) throws Exception;
}