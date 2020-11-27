package com.chest.sy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.sy.mapper.CommncodeMapper;
import com.chest.sy.service.CommncodeService;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;
import com.common.util.JsonUtils;


/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : CommncodeServiceImpl.java
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
@Service
@Transactional(rollbackFor={Exception.class})
public class CommncodeServiceImpl implements CommncodeService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private CommncodeMapper commncodeMapper;
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 그룹코드 조회
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectGroupCodeList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        List<ComCamelMap> listInfo = commncodeMapper.selectGroupCodeList(paramMap);
        
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 상세코드 조회
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectDetailCodeList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        List<ComCamelMap> listInfo = commncodeMapper.selectDetailCodeList(paramMap);
        
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 그룹코드 저장
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int storeGroupCodeList(Map<String, String> paramMap) throws Exception {
        int result = 0;
        
        String listInfo = paramMap.get("listInfo");
        
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = (JSONArray) parser.parse(listInfo);
        
        for(int i=0; i<jsonArray.size(); i++){
            JSONObject data = (JSONObject) jsonArray.get(i);
            
            Map<String, String> mapData = JsonUtils.getJsonToMapConvert(data);
            mapData.put("busiCode", paramMap.get("busiCode"));
            
            // Insert, Update, Delete 로직 구성
            if("C".equals(mapData.get("crudFlag"))) {
                result += commncodeMapper.insertGroupCode(mapData);
            } else if("U".equals(mapData.get("crudFlag"))) {
                result += commncodeMapper.updateGroupCode(mapData);
            }
        }
        
        return result;
    }
    
    /**
     * [ 시스템관리 - 공통코드관리 ] 상세코드 저장
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int storeDetailCodeList(Map<String, String> paramMap) throws Exception {
        int result = 0;
        
        String listInfo = paramMap.get("listInfo");
        
        JSONParser parser = new JSONParser();
        JSONArray jsonArray = (JSONArray) parser.parse(listInfo);
        
        for(int i=0; i<jsonArray.size(); i++){
            JSONObject data = (JSONObject) jsonArray.get(i);
            
            Map<String, String> mapData = JsonUtils.getJsonToMapConvert(data);
            mapData.put("busiCode", paramMap.get("busiCode"));
            
            // Insert, Update, Delete 로직 구성
            if("C".equals(mapData.get("crudFlag"))) {
                result += commncodeMapper.insertDetailCode(mapData);
            } else if("U".equals(mapData.get("crudFlag"))) {
                result += commncodeMapper.updateDetailCode(mapData);
            }
        }
        
        return result;
    }
    
}