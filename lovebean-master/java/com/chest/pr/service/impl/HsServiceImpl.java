package com.chest.pr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.pr.mapper.HsMapper;
import com.chest.pr.service.HsService;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : HsServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 9. 25.
 * Description : [ 기부자그룹 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 25.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class HsServiceImpl implements HsService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private HsMapper hsMapper;

    /**
     * [ 아너소사이어티] 회원소개 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectMberintrcnList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        String listCount           = hsMapper.selectMberintrcnListCount(paramMap);
        List<ComCamelMap> listInfo = hsMapper.selectMberintrcnList(paramMap);
        
        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }

}