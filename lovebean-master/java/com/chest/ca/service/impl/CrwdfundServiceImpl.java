package com.chest.ca.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.ca.mapper.CrwdfundMapper;
import com.chest.ca.service.CrwdfundService;
import com.common.map.ComCamelMap;
import com.common.mapper.ComMapper;
import com.common.util.ComUtils;
import com.common.util.StringUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CrwdfundServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 10. 21.
 * Description : [ 캠페인 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 21.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class CrwdfundServiceImpl implements CrwdfundService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CrwdfundMapper crwdfundMapper;

    @Autowired
    private ComMapper comMapper;

    /**
     * [ 캠페인 ] 클라우드 펀딩 신청하기 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int reqstCrwdfund(Map<String, String> paramMap) throws Exception {
        int result  = crwdfundMapper.reqstCrwdfund(paramMap);

        paramMap.put("propseSn", paramMap.get("propse_sn"));
        result += crwdfundMapper.reqstCrwdfundHist(paramMap);

        if(result != 2) {
            throw new Exception();
        }

        return result;
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 Page 리스트 조회 !! (서버 날짜 오늘 기준으로 진행, 종료 펀딩 가져옴)
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectCrwdfundList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        String listCount           = crwdfundMapper.selectCrwdfundListCount(paramMap);
        List<ComCamelMap> listInfo = crwdfundMapper.selectCrwdfundList(paramMap);

        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);

        return resMap;
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     * 특별모금 한 건 정보
     */
    public Map<String, Object> selectCrwdfundInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        // 펀딩 한 건
        ComCamelMap crwdfundInfo  = crwdfundMapper.selectCrwdfundInfo(paramMap);

        /*
         * 기부하기 Button 이벤트를 위한 값
         * crwdfundInfo 에 있는 event_code 로 THP_MysCodeMapping 에서 MYS_CL1, MYS_CL2 값을 가져옴.
         * 위 두 값을 이용하여 forwarding 할 기부페이지 url 을 setting 하여 함께 넘긴다.
         */

        if(!StringUtils.isNull(crwdfundInfo)) {
            Map<String, String> mysCodeParamMap = new HashMap<String, String>();
            mysCodeParamMap.put("eventCode", (String)crwdfundInfo.get("eventCode"));

            ComCamelMap mysCodeMappingInfo  = comMapper.selectMysCodeMappingInfo(mysCodeParamMap);
            Map<String, String> result  = ComUtils.getCtFormUrl((String)mysCodeMappingInfo.get("mysCl1") + (String)mysCodeMappingInfo.get("mysCl2"));
            String ctFormUrl  = result.get("returnUrl");
            String ctMenuId   = result.get("menuId");

            crwdfundInfo.put("ct_form_url", ctFormUrl);
            crwdfundInfo.put("ct_menu_id", ctMenuId);
        }

        resMap.put("crwdfundInfo", crwdfundInfo);

        return resMap;
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectCrwdfundAnswerList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        String listCount           = crwdfundMapper.selectCrwdfundAnswerListCount(paramMap);
        List<ComCamelMap> listInfo = crwdfundMapper.selectCrwdfundAnswerList(paramMap);

        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);

        return resMap;
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 수정/삭제를 위한 비밀번호 체크 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     */
    public Map<String, Object> checkReplyPw(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        // 클라우드 펀딩 답글 비밀번호 체크
        int checkPwCnt  = crwdfundMapper.checkReplyPw(paramMap);

        resMap.put("checkPwCnt", checkPwCnt);
        resMap.put("paramData", paramMap);

        return resMap;
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 삭제 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int deleteReply(Map<String, String> paramMap) throws Exception {
         return crwdfundMapper.deleteReply(paramMap);
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     * 특별모금 한 건 정보
     */
    public Map<String, Object> selectCrwdfundReplyInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        // 펀딩 답글 한 건
        ComCamelMap crwdfundReplyInfo  = crwdfundMapper.selectCrwdfundReplyInfo(paramMap);

        resMap.put("crwdfundReplyInfo", crwdfundReplyInfo);

        return resMap;
    }

    /**
     * [ 캠페인 ] 클라우드 펀딩 답글 수정 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int updateReply(Map<String, String> paramMap) throws Exception {
         return crwdfundMapper.updateReply(paramMap);
    }
}