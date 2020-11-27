package com.common.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : ComUtils.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] Common Utility
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
public class ComUtils {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    public static HashMap<String, Object> searchParamMap = null;

    /**
     * [ Common ] Page List Page Information Return !!
     * @param paramMap
     * @param listCount
     * @return Map<String, String>
     */
    public static Map<String, String> getPageInfo(Map<String, String> paramMap, String listCount) {
        Map<String, String> map  = new HashMap<String, String>();

        int currPageNo = paramMap.get("currPageNo") == null ? 1  : Integer.parseInt(paramMap.get("currPageNo"));
        int pageCount  = paramMap.get("pageCount")  == null ? 10 : Integer.parseInt(paramMap.get("pageCount"));
        int blockCount = paramMap.get("blockCount") == null ? 10 : Integer.parseInt(paramMap.get("blockCount"));

        int totalPage = (int) Math.ceil( Double.parseDouble(listCount) / pageCount);

        map.put("totalCount", listCount);
        map.put("currPageNo", ""+currPageNo);
        map.put("pageCount",  ""+pageCount);
        map.put("blockCount", ""+blockCount);
        map.put("totalPage",  ""+totalPage);

        return map;
    }

    /**
     * [ Common ] 페이지 전환 시 넘어온 파라메터 셋팅 !!
     * @param paramMapKey
     * @param paramMap
     * @throws Exception
     */
    public static void setParameterMap(String paramMapKey, Map<String, String> paramMap) throws Exception {
        Map<String, String> paramTempMap = new HashMap<String, String>();

        searchParamMap = new HashMap<String, Object>();

        Set<String> keys = paramMap.keySet();       // key 문자열을 가진 Set 리턴

        Iterator<String> it = keys.iterator();      // key 문자열을 순서대로 접근할 수 있는 Iterator 리턴

        while (it.hasNext()) {
            String key   = it.next();
            String value = paramMap.get(key);

            paramTempMap.put(key, value);
        }

        searchParamMap.put(paramMapKey, paramTempMap);
    }

    /**
     * [ Common ] 페이지 전환 시 넘어간 파라메터 다시 가져오기 !!
     * 2019.09.06 신상욱
     * 공통함수 개선 필요
     * @param paramMapKey
     * @return Map<String, String>
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public static Map<String, String> getParameterMap(String paramMapKey, Map<String, String> paramMap) throws Exception {
        Map<String, String> paramTempMap = new HashMap<String, String>();

        if(!"menuLink".equals(paramMap.get("pLinkSepCd"))){
            if(searchParamMap != null){
                paramTempMap = (HashMap<String, String>) searchParamMap.get(paramMapKey);
            }
        }

        searchParamMap = null;  // Parameter Map 초기화 !!

        return paramTempMap;
    }

    /**
     * [ Common ] 설정 파라메터 초기화 !!
     * @throws Exception
     */
    public static void initialParameterMap() throws Exception {
        searchParamMap = null;  // Parameter Map 초기화 !!
    }

    /**
     * [ 기부 ] 모금분류에 따른 기부페이지 forwarding url !!
     * @throws Exception
     */
    public static Map<String, String> getCtFormUrl(String mysClsCombineStr) throws Exception {
        Map<String, String> result = new HashMap<String, String>();
        String returnUrl    = "";
        String menuId       = "";
        if(mysClsCombineStr == null || mysClsCombineStr.equals("")) {
            returnUrl   = "/base.do";
            menuId      = "00_00_00";
        }

        if(mysClsCombineStr.equals("0102")) {
            returnUrl   = "/ct/fdrmcntr/initEvemthcntr.do";
            menuId      = "01_00_00";
        }else if(mysClsCombineStr.equals("0902")) {
            returnUrl   = "/ct/fdrmcntr/initNicehome.do";
            menuId      = "01_00_01";
        }else if(mysClsCombineStr.equals("0302") || mysClsCombineStr.equals("0402") || mysClsCombineStr.equals("0502")) {
            returnUrl   = "/ct/fdrmcntr/initNicestore.do";
            menuId      = "01_00_02";
        }else if(mysClsCombineStr.equals("0702") || mysClsCombineStr.equals("0802")) {
            returnUrl   = "/ct/fdrmcntr/initNicespt.do";
            menuId      = "01_00_03";
        }else if(mysClsCombineStr.equals("0101")) {
            returnUrl   = "/ct/lmpscntr/initIndvdl.do";
            menuId      = "01_01_00";
        }

        result.put("returnUrl", returnUrl);
        result.put("menuId", menuId);

        return result;
    }
}