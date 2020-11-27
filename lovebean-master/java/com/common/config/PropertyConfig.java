package com.common.config;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : PropertyConfig.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common Configuration ] Properties Configuration
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01   
 *************************************************************************************************
 */
public class PropertyConfig {
    private static Logger log = LoggerFactory.getLogger(PropertyConfig.class);
    
    private static ResourceBundle rs;
    public static String DEFAULT_PROPERTIES = "properties/chest";
    
    static {
        try {
            
             String profileValue = System.getProperty("spring.profiles.active");
             if (profileValue == null) {
                 profileValue = System.getenv("spring.profiles.active");
             }
             
             // profileValue 값을 가져오지 못하고 있음.
//             DEFAULT_PROPERTIES = DEFAULT_PROPERTIES + "_" + profileValue;
             System.out.println("DEFAULT_PROPERTIES ====" + DEFAULT_PROPERTIES);
             rs = ResourceBundle.getBundle(DEFAULT_PROPERTIES);
        }catch(MissingResourceException mre){
            log.info(mre.getMessage());
        }catch(Exception ex){
            log.info(ex.getMessage());
        }
    }
    
    public static String getString(String name){
        String value = null;
        
        try {
            value = rs.getString(name);
        }catch( Exception e) {
            log.info(e.getMessage());
        }
        
        return value;
    }
    
    /**
     * 복수 Property 값 가져오기
     * @param key
     * @return values - String[]
     */
    public static String[] getStringArray(String key){
        String[] values = null;
        
        try {
            values = rs.getString(key).split(";");
        }catch(Exception e){
            log.info(e.getMessage());
        }
        
        return values;
    }
    
    /**
     * 복수 Property 값 가져오기
     * @param key
     * @return values - int[]
     */
    @SuppressWarnings("null")
    public static int[] getIntArray(String key) {
        int[] ivalues = null;
        String[] values = null;
        
        try {
            values = rs.getString(key).split(";");
            
            for(int i=0, n= values.length; i < n; i++ ) {
                ivalues[i] = Integer.parseInt(values[i]);
            }
        }catch(Exception e) {
            log.info(e.getMessage());
        }
        
        return ivalues;
    }
    
    public static int getInt(String name) {
        String value = null;
        
        try {
            value = rs.getString(name);
        }catch(Exception e) {
            log.info(e.getMessage());
        }
        
        return Integer.parseInt(value);
    }
    
    /***
     * 프로퍼티 내용 가져오는 메소드
     * 추가 - 김민수
     * @param str
     * @param name
     * @return
     */
    public static String getPropertiesCon(String str , String name ) {
    	rs = ResourceBundle.getBundle(str);
    	String result = rs.getString( name );
    	return result;
    }
    
}