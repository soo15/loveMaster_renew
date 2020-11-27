package com.chest.sy.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.sy.mapper.UserMapper;
import com.chest.sy.service.UserService;


/**************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : UserServiceImpl.java
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
@Service
@Transactional(rollbackFor={Exception.class})
public class UserServiceImpl implements UserService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private UserMapper userMapper;
    
}