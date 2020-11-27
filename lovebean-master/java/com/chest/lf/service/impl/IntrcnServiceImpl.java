/**************************************************************************************************
* System Name : com.chest.lf 사랑의열매
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
package com.chest.lf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.lf.mapper.IntrcnMapper;
import com.chest.lf.service.IntrcnService;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : IntrcnServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 9. 17.
 * Description : [ 소개 ] 소개 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 17.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class IntrcnServiceImpl implements IntrcnService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IntrcnMapper intrcnMapper;
    
    /**
     * [ 소개 ] 홍보대사 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectPrambassadorList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        String listCount           = intrcnMapper.selectPrambassadorListCount(paramMap);
        List<ComCamelMap> listInfo = intrcnMapper.selectPrambassadorList(paramMap);
        
        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }
    
    /**
     * [ 소개 ] 홍보대사 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> selectPrambassadorInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        // 홍보대사 한 건
        ComCamelMap prambassadorInfo  = intrcnMapper.selectPrambassadorInfo(paramMap);
        
        // 이전글, 다음글 정보
        List<ComCamelMap> listInfo = intrcnMapper.selectPrambassadorPreNextList(paramMap);
        
        resMap.put("prambassadorInfo", prambassadorInfo);
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }
    
    /**
     * [ 소개 ] 홍보영상&인쇄물 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectPrvidopressList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        String listCount           = intrcnMapper.selectPrvidopressListCount(paramMap);
        List<ComCamelMap> listInfo = intrcnMapper.selectPrvidopressList(paramMap);
        
        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }
    
    /**
     * [ 소개 ] 홍보영상&인쇄물 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     * 홍보영상&인쇄물 한 건, 첨부파일정보, 이전.이후 글 정보
     */
    public Map<String, Object> selectPrvidopressInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        
        // 조회수 +1 증가
        intrcnMapper.updatePrvidopressRdCnt(paramMap);
        
        // 홍보영상&인쇄물 한 건
        ComCamelMap prvidopressInfo  = intrcnMapper.selectPrvidopressInfo(paramMap);
        
        // 이전글, 다음글 정보
        List<ComCamelMap> listInfo = intrcnMapper.selectPrvidopressPreNextList(paramMap);
        
        resMap.put("prvidopressInfo", prvidopressInfo);
        resMap.put("listInfo", listInfo);
        
        return resMap;
    }
}