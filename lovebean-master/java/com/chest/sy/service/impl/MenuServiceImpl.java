package com.chest.sy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.sy.mapper.MenuMapper;
import com.chest.sy.service.MenuService;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;


/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : MenuServiceImpl.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 관리자메뉴관리 ]
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
public class MenuServiceImpl implements MenuService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private MenuMapper menuMapper;
    
    /**
     * [ Menu ] Menu Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectMenuList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        List<ComCamelMap> listInfo = menuMapper.selectMenuList(paramMap);
        
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }
    
    /**
     * [ Menu ] Menu Page 한 건 저장(신규 입력 또는 수정) !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int storeMenuInfo(Map<String, String> paramMap) throws Exception {
        if(paramMap.get("upperMenuNo") == null || ((String)paramMap.get("upperMenuNo")).equals("")) {
            paramMap.put("upperMenuNo", null);
        }
        
        if(paramMap.get("menuNo") == null || ((String)paramMap.get("menuNo")).equals("")) { // 신규 입력
            return menuMapper.insertMenuInfo(paramMap);
        }else { // 수정
            return menuMapper.updateMenuInfo(paramMap);
        }
        
    }
}