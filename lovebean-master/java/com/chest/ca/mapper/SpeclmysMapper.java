package com.chest.ca.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : SpeclmysMapper.java
 * Author      : Chest Front
 * Date        : 2019. 9. 27.
 * Description : [ 캠페인 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 5.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface SpeclmysMapper {

    /**
     * [ 캠페인 ] 특별모금 Page 리스트 Count 조회 !!
     * @param paramMap
     * @return String
     */
    public String selectSpeclmysListCount(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 캠페인 ] 특별모금 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public List<ComCamelMap> selectSpeclmysList(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 캠페인 ] 특별모금 조회수 +1 증가 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int updateSpeclmysRdCnt(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 캠페인 ] 특별모금 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectSpeclmysInfo(Map<String, String> paramMap) throws Exception;

	public String sameDataCheck(Map<String, String> paramMap) throws Exception;

	public int insert(Map<String, String> paramMap) throws Exception;

    
}