package com.common.map;

import org.apache.commons.collections.map.ListOrderedMap;

import com.common.util.StringUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : ComCamelMap.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common Map ] Map Camelcase 변환
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01   
 *************************************************************************************************
 */
public class ComCamelMap extends ListOrderedMap {
    private static final long serialVersionUID = 1L;

    private String toProperCase(String s, boolean isCapital) {
        String rtnValue = "";
        
        if(isCapital){
            rtnValue = s.substring(0, 1).toUpperCase() +
                    s.substring(1).toLowerCase();
        } else{
            rtnValue = s.toLowerCase();
        }
        
        return rtnValue;
    }
    
    private String toCamelCase(String s){
        String[] parts = s.split("_");
        StringBuilder camelCaseString = new StringBuilder();
        
        for (int i = 0; i < parts.length ; i++) {
            String part = parts[i];
            
            camelCaseString.append(toProperCase(part, (i != 0 ? true : false))) ;
        }
        
        return camelCaseString.toString();
    }
    
    @Override
    public Object put(Object key, Object value) {
        return super.put(toCamelCase((String)key), StringUtils.isNull(value) ? "" : value.toString());
    }
}