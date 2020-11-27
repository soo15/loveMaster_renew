package com.chest.sy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.sy.mapper.LogMapper;
import com.chest.sy.service.LogService;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;


/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : LogServiceImpl.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 접속로그관리 ]
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 7. 26.       박수호          Initial Release
 * CH_01   
 **************************************************************************************************/
@Service
@Transactional(rollbackFor={Exception.class})
public class LogServiceImpl implements LogService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private LogMapper logMapper;
    
    /**
     * [ 시스템관리 - 접속로그관리 ] 로그 List 조회
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectLogList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        String listCount           = logMapper.selectLogListCount(paramMap);
        List<ComCamelMap> listInfo = logMapper.selectLogList(paramMap);
        
        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }
    
}