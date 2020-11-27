package com.chest.lf.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.lf.service.GuidanceService;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 9. 5.
 * Description : [ 안내 ] 안내 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 5.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class GuidanceServiceImpl implements GuidanceService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

}