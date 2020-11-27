package com.chest.sy.web;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chest.sy.service.MenuService;
import com.common.map.ComCamelMap;
import com.common.service.ComService;
import com.common.util.SessionUtils;


/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : MenuController.java
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
@Controller
@RequestMapping(value="/sy/menu")
public class MenuController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private MenuService menuService;
    
    @Autowired
    private ComService comService;
    
    /**[ 시스템관리 - 관리자메뉴리스트 ] Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initMenu.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initMenu(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        model.addAttribute("bhfCodeCombo",    comService.selectCmmnCodeComboString("HP0010", "X", "001"));  // 중앙회
        model.addAttribute("fbSeCodeCombo",   comService.selectCmmnCodeComboString("HP0016", "X", "002")); // back-office
        model.addAttribute("menuTyCodeCombo",   comService.selectCmmnCodeComboString("HP0017", "S"));
        
        return "chest:/sy/sy_menu_inqr_003";
    }
    
    /**
     * [ Menu ] Menu Page 리스트 조회 !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectMenuList.do", method = {RequestMethod.POST})
    public String selectMenuList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        Map<String, Object> resMap = menuService.selectMenuList(SessionUtils.setSessionInfo(paramMap));
        
        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));
        
        return "jsonView";
    }
    
    /**
     * [ Menu ] Menu Page 한 건 저장(신규 입력 또는 수정) !!
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/storeMenuInfo.do", method = {RequestMethod.POST})
    public String storeMenuInfo(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        model.addAttribute("result", menuService.storeMenuInfo(SessionUtils.setSessionInfo(paramMap)));
        
        return "jsonView";
    }
    
    /**[ 시스템관리 - 관리자메뉴관리 ] Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initMenuRegist.do", method = {RequestMethod.POST})
    public String initMenuRegist(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        return "chest:/sy/sy_menu_regist_003";
    }
}