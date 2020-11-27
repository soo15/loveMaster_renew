/**************************************************************************************************
* System Name : com.chest.admin 사랑의열매
* Class Name  : MainServiceImpl
* Author      :
* Date        :
* Description : Main Service
*
* History     :
* *************************************************************************************************
* No.     Date         Name             Description
* *************************************************************************************************
***************************************************************************************************/
package com.main.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.map.ComCamelMap;
import com.common.util.ComUtils;
import com.main.mapper.MainMapper;
import com.main.service.MainService;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : MainServiceImpl.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Main ] Main 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class MainServiceImpl implements MainService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MainMapper mainMapper;

    /**
     * Select Login User Role Information
     * @param paramMap
     * @return List<Object>
     * @throws Exception
     */
    public List<Object> searchLoginUserRoleList(Map<String, String> paramMap) throws Exception {
        return mainMapper.searchLoginUserRoleList(paramMap);
    }

    /**
     * [ 메인 ] 배너조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */

    public Map<String, Object> selectBanrList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        List<ComCamelMap> listInfo = mainMapper.selectBanrList(paramMap);

        resMap.put("listInfo", listInfo);

        return resMap;
    }

    /**
     * [ 메인 ] 지회배너조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */

    public Map<String, Object> selectBhfBanrList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        List<ComCamelMap> listInfo = mainMapper.selectBhfBanrList(paramMap);

        resMap.put("listInfo", listInfo);

        return resMap;
    }

    /**
     * [ 메인 ] 게시판 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */

    public Map<String, Object> selectMainBbsList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        List<ComCamelMap> listInfo = mainMapper.selectMainBbsList(paramMap);

        resMap.put("listInfo", listInfo);

        return resMap;
    }


    /**
     * [ 메인 ] 내가만드는 따뜻한세상.
     * @param paramMap
     * @return List<ComCamelMap>
     * @throws Exception
     */

    public List<ComCamelMap> selectMainList3(Map<String, String> paramMap) throws Exception {
        
    	List<ComCamelMap> mainList = mainMapper.selectMainList3(paramMap);
    	List<ComCamelMap> newList = new ArrayList<ComCamelMap>();
    	
    	mainList.forEach(cMap -> {
    		try {
    			Map<String, String> result  = ComUtils.getCtFormUrl((String)cMap.get("mysCl1") + (String)cMap.get("mysCl2"));
    			String ctFormUrl  = result.get("returnUrl");
                String ctMenuId   = result.get("menuId");
                cMap.put("ct_form_url", ctFormUrl);
                cMap.put("ct_menu_id", ctMenuId);
                
                newList.add(cMap);
                
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    	});
    	
    	
    	return newList;
    }

    /**
     * [ 메인 ] 사랑의 온도탑 조회 !!
     *
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    public Map<String, Object> selectTpTopInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        // 온도탑
        ComCamelMap tpTopInfo  = mainMapper.selectTpTopInfo(paramMap);

        resMap.put("tpTopInfo", tpTopInfo);

        return resMap;
    }
}