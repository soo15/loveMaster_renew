package com.common.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : ComMapper.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] Mapper
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface ComMapper {
    public List<ComCamelMap> selectCmmnCodeList(Map<String, String> paramMap) throws Exception;

    public List<ComCamelMap> selectFileList(Map<String, String> paramMap) throws Exception;

    /**
     * [ 기부공통 ] 모금코드 매핑 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectMysCodeMappingInfo(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ 기부공통 ] 첨부파일정보 조회
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public ComCamelMap selectFileDetailInfo(Map<String, String> paramMap) throws Exception;
}