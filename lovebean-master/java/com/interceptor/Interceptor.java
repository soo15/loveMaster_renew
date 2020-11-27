package com.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.common.service.ComService;
import com.common.util.CookieUtils;
import com.common.util.StringUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : Interceptor.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] Interceptor
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
public class Interceptor extends HandlerInterceptorAdapter{
    private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

    private String REQUEST_REFERER = null;

    @Autowired
    private ComService comService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        REQUEST_REFERER = request.getHeader("referer");

        return true;
    }

    @SuppressWarnings("unchecked")
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView model) throws Exception {
        // Parameter Value !!
        String __branchCd  = "";     // 지회 코드 ex) 001, 002, 003 ...
        String __branchId  = "";     // 지회 ID ex) www, seoul, busan ...
        String __branchNm  = "";     // 지회 명 ex) 중앙회, 서울, 부산 ...
        String __branchUrl = "";     // 지회 URL
        String __menuId    = "";     // Menu ID ex) 00_00_00, 00_00_01, 00_00_02 ...
        String __menuType  = "";     // Menu Type ex) header, footer

        List<Object> __branchList = comService.selectBranchList();    // Branch List !!
        List<Object> __langList   = comService.selectLanguageList();  // Language List !!


        // Local 서버 or 개발 서버 or Domain 서버 !!
        String requestURI = StringUtils.getRequestURI(request);    // /base.do
        String serverName = StringUtils.getServerName(request);    // localhost


        // Local or 개발 서버 예외 처리 !!
        if("localhost".equals(serverName) || "192.168.24.68".equals(serverName)) {
            if(REQUEST_REFERER == null) {
                __branchCd  = CookieUtils.getValue("__branchCd")  != null ? CookieUtils.getValue("__branchCd")  : "001";
                __branchId  = CookieUtils.getValue("__branchId")  != null ? CookieUtils.getValue("__branchId")  : "www";
                __branchNm  = CookieUtils.getValue("__branchNm")  != null ? CookieUtils.getValue("__branchNm")  : "중앙회";
                __branchUrl = CookieUtils.getValue("__branchUrl") != null ? CookieUtils.getValue("__branchUrl") : "www.chest.or.kr/";
                __menuId    = "";
                __menuType  = "";
            } else {
                __branchCd  = request.getParameter("pBranchCd")   != null ? request.getParameter("pBranchCd")   : "001";
                __branchId  = request.getParameter("pBranchId")   != null ? request.getParameter("pBranchId")   : "www";
                __branchNm  = request.getParameter("pBranchNm")   != null ? request.getParameter("pBranchNm")   : "중앙회";
                __branchUrl = request.getParameter("pBranchUrl")  != null ? request.getParameter("pBranchUrl")  : "www.chest.or.kr/";

                if(requestURI.indexOf("base.do") >= 0) {
                    __menuId   = "";
                    __menuType = "";
                } else {
//                    __menuId   = request.getParameter("pMenuId")   != null ? request.getParameter("pMenuId")   : "";
//                    __menuType = request.getParameter("pMenuType") != null ? request.getParameter("pMenuType") : "";
                    //20191010 lsa 쿠키값 가지고 오도록 수정
                    __menuId   = request.getParameter("pMenuId")   != null ? request.getParameter("pMenuId")   : CookieUtils.getValue("__menuId");
                    __menuType = request.getParameter("pMenuType") != null ? request.getParameter("pMenuType") : CookieUtils.getValue("__menuType");
                }
            }
        } else {
            for(int i=0; i<__branchList.size(); i++) {
                Map<String, String> map = (HashMap<String, String>) __branchList.get(i);

                String branchUrl = map.get("branchUrl");

                if(branchUrl.indexOf(serverName) >= 0) {
                    __branchCd  = map.get("branchCd");
                    __branchId  = map.get("branchId");
                    __branchNm  = map.get("branchNm");
                    __branchUrl = map.get("branchUrl");

                    break;
                }
            }

            if(REQUEST_REFERER == null || requestURI.indexOf("base.do") >= 0) {
                __menuId   = "";
                __menuType = "";
            } else {
//                __menuId   = request.getParameter("pMenuId")   != null ? request.getParameter("pMenuId")   : "";
//                __menuType = request.getParameter("pMenuType") != null ? request.getParameter("pMenuType") : "";
                //20191010 lsa 쿠키값 가지고 오도록 수정
                __menuId   = request.getParameter("pMenuId")   != null ? request.getParameter("pMenuId")   : CookieUtils.getValue("__menuId");
                __menuType = request.getParameter("pMenuType") != null ? request.getParameter("pMenuType") : CookieUtils.getValue("__menuType");
            }
        }

        logger.info("============================>>>>>>>>>>> __branchCd  = " + __branchCd);
        logger.info("============================>>>>>>>>>>> __branchId  = " + __branchId);
        logger.info("============================>>>>>>>>>>> __branchNm  = " + __branchNm);
        logger.info("============================>>>>>>>>>>> __branchUrl = " + __branchUrl);
        logger.info("============================>>>>>>>>>>> __menuId    = " + __menuId);
        logger.info("============================>>>>>>>>>>> __menuType  = " + __menuType);

        model.addObject("__branchList", __branchList);
        model.addObject("__langList",   __langList);
        model.addObject("__branchCd",   __branchCd);
        model.addObject("__branchId",   __branchId);
        model.addObject("__branchNm",   __branchNm);
        model.addObject("__branchUrl",  __branchUrl);
        model.addObject("__menuId",     __menuId);
        model.addObject("__menuType",   __menuType);

        REQUEST_REFERER = null;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}