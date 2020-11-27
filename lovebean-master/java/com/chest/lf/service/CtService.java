package com.chest.lf.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartRequest;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CtService.java
 * Author      : Chest Front
 * Date        : 2019. 10. 26.
 * Description : [ 신뢰와 투명성 ] 신뢰와 투명성 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 26.  Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface CtService {

    /**
     * [ 신뢰와 투명성 ] 시민제안/공익신고 저장 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int insertCtznPropse(Map<String, String> paramMap, MultipartRequest multipartRequest) throws Exception;

	public List<ComCamelMap> sendMailList() throws Exception;
}