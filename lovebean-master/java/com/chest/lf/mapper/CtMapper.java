package com.chest.lf.mapper;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CtMapper.java
 * Author      : Chest Front
 * Date        : 2019. 10. 26.
 * Description : [ 신뢰와 투명성 ] 신뢰와 투명성 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 26.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface CtMapper {
    /**
     * [ 신뢰와 투명성 ] 시민제안/공익신고 저장 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int insertCtznPropse(Map<String, String> paramMap) throws Exception;

    /**
     * [ 신뢰와 투명성 ] 시민제안/공익신고 저장이력 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int insertCtznPropseHist(Map<String, String> paramMap) throws Exception;
    
    /**
     * 관리자 메일 읽어오기
     * @return
     * @throws Exception
     */
	public List<ComCamelMap> sendMailList() throws Exception;
}