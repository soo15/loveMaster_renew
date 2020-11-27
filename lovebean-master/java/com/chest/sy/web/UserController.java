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

import com.chest.sy.service.UserService;
import com.common.map.ComCamelMap;
import com.common.util.SessionUtils;


/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : UserController.java
 * Author      : Chest Admin
 * Date        : 2019. 7. 26.
 * Description : [ 시스템관리 - 사용자리스트 ]
 * 
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 7. 26.       박수호          Initial Release
 * CH_01   
 **************************************************************************************************/
@Controller
@RequestMapping(value="/sy/user")
public class UserController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private UserService userService;
    
    /**[ 시스템관리 - 사용자리스트 ] Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initUser.do", method = {RequestMethod.GET})
    public String initUser(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        return "chest:/sy/sy_user_inqr_002";
    }
    
    /**
     * [ 시스템관리 - 사용자리스트 ] 리스트 조회
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectUserList.do", method = {RequestMethod.POST})
    public String selectUserList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
//        Map<String, Object> resMap = sampleService.selectSampleList(SessionUtils.setSessionInfo(paramMap));
        
//        model.addAttribute("pageInfo", (Map<String, String>) resMap.get("pageInfo"));
//        model.addAttribute("listInfo", (List<ComCamelMap>) resMap.get("listInfo"));
        
        return "jsonView";
    }
    
    
    /**[ 시스템관리 - 사용자상세 ] Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/initUserDetail.do", method = {RequestMethod.GET})
    public String initUserDetail(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
        
        return "chest:/sy/sy_user_detail_002";
    }
}