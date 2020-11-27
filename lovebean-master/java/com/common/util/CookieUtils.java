package com.common.util;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CookieUtils.java
 * Author      : Chest Admin
 * Date        : 2019. 9. 27.
 * Description : [ Common ] Common Utility : Cookies
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 27.   Chest Admin      Initial Release
 * CH_01   
 *************************************************************************************************
 */
public final class CookieUtils {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    /**
     * RequestContextHolder 를 통하여 HttpServletRequest 를 return 한다.
     * @param N/A
     * @return HttpServletRequest
     */
    private static HttpServletRequest getHttpServletRequest() throws Exception {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }
    
    /**
     * Set Cookie !!
     * @param name
     * @param value
     * @return Cookie
     * @throws IOException
     */
    public static Cookie setCookie(String name, String value) throws IOException {
        String val = value == null ? null : URLEncoder.encode(value, "utf-8");
        
        Cookie cookie = new Cookie(name, val);
        
        cookie.setPath("/");
        cookie.setMaxAge(60 * 30);
        
        return cookie;
    }
    
    public static Cookie setCookie(String name, String value, int maxAge) throws IOException {
        String val = value == null ? null : URLEncoder.encode(value, "utf-8");
        
        Cookie cookie = new Cookie(name, val);
        
        cookie.setPath("/");
        cookie.setMaxAge(maxAge);
        
        return cookie;
    }
    
    public static Cookie setCookie(String name, String value, int maxAge, String path) throws IOException {
        Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
        
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        
        return cookie;
    }
    
    public static Cookie setCookie(String name, String value, int maxAge, String path, String domain) throws IOException {
        String val = value == null ? null : URLEncoder.encode(value, "utf-8");
        
        Cookie cookie = new Cookie(name, val);
        
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        cookie.setDomain(domain);
        
        return cookie;
    }
    
    /**
     * Get Cookie !!
     * @param name
     * @return Cookie[]
     * @throws Exception
     */
    public static Cookie[] getCookie(String name) throws Exception {
        HttpServletRequest request = getHttpServletRequest();
        
        return getCookie(request, name); 
    }
    
    public static Cookie[] getCookie(HttpServletRequest request, String name) throws Exception {
        return request.getCookies(); 
    }
    
    /**
     * Get Cookie Value !!
     * @param name
     * @return String
     * @throws Exception
     */
    public static String getValue(String name) throws Exception {
        HttpServletRequest request = getHttpServletRequest();
        
        return getValue(request, name);
    }
    
    public static String getValue(HttpServletRequest request, String name) throws Exception {
        Cookie[] cookies = request.getCookies();
        
        if (cookies == null)
            return null;
        
        String val = null;
        
        for(Cookie cookie : cookies) {
            if(name.equals(cookie.getName())){
                val = URLDecoder.decode(cookie.getValue(), "utf-8");
                break;
            }
        }
        
        return val;
    }
    
    /**
     * Exists Cookie Value !!
     * @param name
     * @return boolean
     * @throws Exception
     */
    public static boolean exists(String name) throws Exception {
        HttpServletRequest request = getHttpServletRequest();
        
        return exists(request, name);
    }
    
    public static boolean exists(HttpServletRequest request, String name) throws Exception {
        Cookie[] cookies = request.getCookies();
        
        if (cookies == null)
            return false;
        
        Boolean bool = false;
        
        for(Cookie cookie : cookies) {
            if(name.equals(cookie.getName())){
                bool = true;
                break;
            }
        }
        
        return bool;
    }
    
    /**
     * Cookie Login 여부 !!
     * @return boolean
     * @throws Exception
     */
    public static boolean isLogin() throws Exception {
        HttpServletRequest request = getHttpServletRequest();
        
        return isLogin(request);
    }
    
    public static boolean isLogin(HttpServletRequest request) throws Exception {
        String __loginYn = getValue("__loginYn");
        
        if(__loginYn != null && "Success".equals(__loginYn)){
            return true;
        } else {
            return false;
        }
    }
    
    /**
     * Cookie Parameter Return !!
     * @param paramMap
     * @return Map<String, String>
     * @throws Exception
     */
    public static Map<String, String> setSessionInfo(Map<String, String> paramMap) throws Exception {
        HttpServletRequest request = getHttpServletRequest();
        
        return setSessionInfo(request, paramMap);
    }
    
    public static Map<String, String> setSessionInfo(HttpServletRequest request, Map<String, String> paramMap) throws Exception {
        Cookie[] cookies = request.getCookies(); // 쿠키 목록 받아오기
        
        for(Cookie cookie: cookies) {
            paramMap.put(cookie.getName(), URLDecoder.decode(cookie.getValue(), "utf-8"));
        }
        
        return paramMap;
    }
}