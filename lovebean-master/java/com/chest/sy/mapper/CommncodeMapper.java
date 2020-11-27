package com.chest.sy.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : CommncodeMapper.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 공통코드관리 ]
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 7. 26.       박수호          Initial Release
 * CH_01   
 **************************************************************************************************/
public interface CommncodeMapper {
    /**
     * [ 시스템관리 - 공통코드관리 ] 그룹코드 조회
     * @param paramMap
     * @return List<ComCamelMap>
     */
    public List<ComCamelMap> selectGroupCodeList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 상세코드 조회
     * @param paramMap
     * @return List<ComCamelMap>
     */
    public List<ComCamelMap> selectDetailCodeList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 그룹코드 입력
     * @param paramMap
     * @return int
     */
    public int insertGroupCode(Map<String, String> paramMap);
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 그룹코드 수정
     * @param paramMap
     * @return int
     */
    public int updateGroupCode(Map<String, String> paramMap);

    /**
     * [ 시스템관리 - 공통코드관리 ] 상세코드 입력
     * @param paramMap
     * @return int
     */
    public int insertDetailCode(Map<String, String> paramMap);
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 상세코드 수정
     * @param paramMap
     * @return int
     */
    public int updateDetailCode(Map<String, String> paramMap);
}