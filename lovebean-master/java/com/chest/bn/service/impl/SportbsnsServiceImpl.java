package com.chest.bn.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.bn.service.SportbsnsService;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : SportbsnsServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 9. 19.
 * Description : [ 지원사업 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 19.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class SportbsnsServiceImpl implements SportbsnsService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

}