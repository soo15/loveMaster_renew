package com.common.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.common.config.GlobalConstants;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : SessionUtils.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] Session Utility
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
public class SessionUtils {
    private static Logger logger = LoggerFactory.getLogger(SessionUtils.class);

    /**
     * [ Common ] RequestContextHolder 를 통하여 HttpServletRequest 를 return
     * @return HttpServletRequest
     */
    public static HttpServletRequest getHttpServletRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    /**
     * [ Common ] Set Parameter Cookie Value Information
     * @param paramMap
     * @param request
     * @return Map<String, String>
     */
    public static Map<String, String> setSessionInfo(Map<String, String> paramMap) {
        return setSessionInfo(paramMap, getHttpServletRequest());
    }

    public static Map<String, String> setSessionInfo(Map<String, String> paramMap, HttpServletRequest request) {
        try {
            paramMap.put("__branchCd",  CookieUtils.getValue("__branchCd"));    // 지회 코드 ex) 001, 002, 003 ...
            paramMap.put("__branchId",  CookieUtils.getValue("__branchId"));    // 지회 ID ex) www, seoul, busan ...
            paramMap.put("__branchNm",  CookieUtils.getValue("__branchNm"));    // 지회 명 ex) 중앙회, 서울, 부산 ...
            paramMap.put("__branchUrl", CookieUtils.getValue("__branchUrl"));   // 지회 URL
            paramMap.put("__menuId",    CookieUtils.getValue("__menuId"));      // Menu ID ex) 00_00_00, 00_00_01, 00_00_02 ...
            paramMap.put("__menuType",  CookieUtils.getValue("__menuType"));    // Menu Type ex) header(현재 적용), footer(현재 미적용 : 필요하면 구현해야 함)
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return paramMap;
    }
}