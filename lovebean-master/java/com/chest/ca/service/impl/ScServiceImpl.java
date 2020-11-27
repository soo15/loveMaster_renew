package com.chest.ca.service.impl;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.ca.mapper.ScMapper;
import com.chest.ca.service.ScService;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : ScServiceImpl.java
 * Author      : Chest Front
 * Date        : 2020. 07. 23.
 * Description : 나눔문화캠페인
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2020. 07. 23.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class ScServiceImpl implements ScService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private ScMapper mapper;
	
    /**
     * [ 나눔문화캠페인 ] 투표하기
     * @param paramMap
     * @return cnt
     * @throws Exception
     * 나눔문화캠페인 테이블 에 INSERT 
     */ 
    @Override
    @Transactional
    public String insert(Map<String, String> paramMap) throws Exception {
		//저장전에 투표내역 있는지 체크		
		int cnt = mapper.selectReqstCheck(paramMap);
		if( cnt > 0 ) {
			return "투표는 1회만 가능합니다.";
		} else {
			cnt = mapper.insertTHP_EryndReqstRegist(paramMap);
		}
		
		return "success"+"_"+cnt;
    }

}