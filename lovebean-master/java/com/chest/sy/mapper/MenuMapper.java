package com.chest.sy.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : MenuMapper.java
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
public interface MenuMapper {
    /**
     * [ Menu ] Menu Page 리스트 조회 !!
     * @param paramMap
     * @return List<ComCamelMap>
     */
    public List<ComCamelMap> selectMenuList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ Menu ] Menu Page 한 건 신규입력 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int insertMenuInfo(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ Menu ] Menu Page 한 건 수정 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int updateMenuInfo(Map<String, String> paramMap) throws Exception;
}