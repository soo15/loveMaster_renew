package com.chest.bbs.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.bbs.mapper.BbsMapper;
import com.chest.bbs.service.BbsService;
import com.common.map.ComCamelMap;
import com.common.mapper.ComMapper;
import com.common.util.ComUtils;
import com.common.util.StringUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 9. 5.
 * Description : [ 게시판 ] 관련
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
public class BbsServiceImpl implements BbsService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BbsMapper bbsMapper;

    @Autowired
    private ComMapper comMapper;

    /**
     * [ 게시판 ] 게시판 정보 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     * 게시판 정보 한 건
     */
    public Map<String, Object> selectBbsInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        // 게시판 정보 한 건
        ComCamelMap bbsInfo  = bbsMapper.selectBbsInfo(paramMap);

        if(!StringUtils.isNull(bbsInfo)) {
            if("Y".equals(bbsInfo.get("tabAt"))) {
                // 첫번째 탭 정보
                Map<String, Object> fstTabInfo = new HashMap<String, Object>();

                Map<String, String> tabParamMap = new HashMap<String, String>();
                tabParamMap.put("tabGroupCode", (String)bbsInfo.get("tabGroupCode"));

                List<ComCamelMap> tabList = bbsMapper.selectBbsTabList(tabParamMap);

                int htmlTypeIdx   = 0;

                /*
                 * 이 부분은 지회별 코드 combo 를 변경했을 때 첫번째 탭으로 이동시키기 위한 로직.
                 * html 이 tab 중 첫번째로 있을 때를 대비하여 다음과 같이 처리한다.
                 *
                 * 현재는 탭 그룹에 html type 은 하나만 있고 첫번째 탭에 위치한다고 가정
                 * DB로만 처리하는 탭으로 구성된 첫번째 탭 정보는 그대로 가져가고
                 * html type 로 구성되어있는 tab 있을 경우 combo 변경시 이동시키는 tab 은 두번째 게시판 tab 정보이다.
                 * idx 는 0 부터 시작하므로 두번째 idx 는 1로 setting 하여 정보를 넘겨준다.
                 */
                for(ComCamelMap tabInfo : tabList) {
                    if("H".equals(tabInfo.get("cnTy"))) {
                        htmlTypeIdx   = 1;
                        break;
                    }
                }

                fstTabInfo.put("bbsSn", tabList.get(htmlTypeIdx).get("bbsSn"));
                fstTabInfo.put("bbsNm", tabList.get(htmlTypeIdx).get("bbsNm"));
                fstTabInfo.put("cnTy", tabList.get(htmlTypeIdx).get("cnTy"));

                resMap.put("tabList", tabList);
                resMap.put("fstTabInfo", fstTabInfo);

                // bbsInfo Type 이 카멜방식이라 '_' 로 이루어진 key 값으로 해야지 원하는 키값으로 값을 얻을 수 있음
                // ex) tab_list 로 key 를 잡아야 이후 bbsInfo map 에서의 참조 키값은 tabList 로 가능함.
            }
        }

        resMap.put("bbsInfo", bbsInfo);

        return resMap;
    }

    /**
     * [ 게시판 ] 게시물 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectPostList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        String listCount           = bbsMapper.selectPostListCount(paramMap);
        List<ComCamelMap> listInfo = bbsMapper.selectPostList(paramMap);

        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);

        return resMap;
    }

    /**
     * [ 게시판 ] 게시물 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     * 게시물 한 건, 첨부파일정보, 이전.이후 글 정보
     */
    public Map<String, Object> selectPostInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        // 조회수 +1 증가
        bbsMapper.updatePostRdCnt(paramMap);

        // 게시물 한 건
        ComCamelMap postInfo  = bbsMapper.selectPostInfo(paramMap);

        // 첨부파일 정보
        List<ComCamelMap> fileListInfo  = comMapper.selectFileList(paramMap);

        // 이전글, 다음글 정보
        List<ComCamelMap> listInfo = bbsMapper.selectPostPreNextList(paramMap);

        resMap.put("postInfo", postInfo);
        resMap.put("fileListInfo", fileListInfo);
        resMap.put("listInfo", listInfo);

        return resMap;
    }

}