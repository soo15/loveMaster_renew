package com.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.json.JSONException;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : JsonUtils.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 30.
 * Description : [ Common ] JSON  Utility
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01   
 *************************************************************************************************
 */
public class JsonUtils {
    private static Logger logger = LoggerFactory.getLogger(JsonUtils.class);
    
    /**
     * [ JsonUtil ] Json To Map Convert !!
     * @param data
     * @param paramMap
     * @return Map<String, String>
     * @throws Exception
     */
    public static Map<String, String> getJsonToMapConvert(JSONObject jsonData) throws Exception {
        return getJsonToMapConvert(jsonData.toString());
    }
    
    @SuppressWarnings("unchecked")
    public static Map<String, String> getJsonToMapConvert(String jsonData) throws Exception {
        Map<String, String> dataMap = new HashMap<String, String>();
        
        try{
            Map<String, String> map = new ObjectMapper().readValue(jsonData, Map.class); // JSONObject To Map 변환
            
            dataMap = SessionUtils.setSessionInfo(map);
            
            // Parameter Print !!
            for (Entry<String, String> entry : dataMap.entrySet()) {
                logger.info("===============>>>>> JsonUtils ==   " + entry.getKey() + " = " + dataMap.get(entry.getKey()));
            }
        } catch (JsonGenerationException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        }
        
        return dataMap;
    }
    
    /**
     * [ JsonUtil ] Json To Map Convert : Json Data 에 없는 Map Key 생성 !!
     * @param data
     * @param paramMap
     * @return Map<String, String>
     * @throws Exception
     */
    public static Map<String, String> getJsonToMapConvert(JSONObject jsonData, String columns) throws Exception {
        return getJsonToMapConvert(jsonData.toString(), columns);
    }
    
    public static Map<String, String> getJsonToMapConvert(String jsonData, String columns) throws Exception {
        Map<String, String> dataMap = new HashMap<String, String>();
        
        try{
            dataMap = new ObjectMapper().readValue(jsonData, new TypeReference<HashMap<String, String>>() {});  // JSONObject To Map 변환
            
            String[] arrGridColumns = columns.split(",");
            
            for(int i=0; i<arrGridColumns.length; i++){
                if(!dataMap.containsKey(arrGridColumns[i])){
                    dataMap.put(arrGridColumns[i], "");
                }
            }
        } catch (JsonGenerationException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        }
        
        return dataMap;
    }
    
    /**
     * Map To JSON Convert !!
     * @param map
     * @return String
     */
    public static String getObjectToJsonConvert(Object obj) throws Exception {
        String jsonData = "";
        
        try{
            jsonData = new Gson().toJson(obj);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        
        return jsonData;
    }
    
    /**
     * List To JSON Convert !!
     * @param list
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static String getListToJsonConvert(List<Object> list) throws Exception {
        JSONObject jsonData = new JSONObject();
        
        try{
            jsonData.put("list", list);
        } catch (JSONException e) {
            e.printStackTrace();
        }
            
        return jsonData.toString();
    }
    
    /**
     * JSON To List Convert !!
     * @param jsonData
     * @return List<Object>
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static List<Object> getJsonToListConvert(String jsonData) throws Exception {
        List<Object> list = new ArrayList<Object>();
        
        try{
            list = new ObjectMapper().readValue(jsonData, List.class);
        } catch (JsonGenerationException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        }
            
        return list;
    }
}