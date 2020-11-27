package com.chest.ca.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.ca.mapper.SpeclmysMapper;
import com.chest.ca.service.SpeclmysService;
import com.common.map.ComCamelMap;
import com.common.mapper.ComMapper;
import com.common.util.ComUtils;
import com.common.util.StringUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : SpeclmysServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 9. 27.
 * Description : [ 캠페인 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 9. 27.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class SpeclmysServiceImpl implements SpeclmysService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SpeclmysMapper speclmysMapper;

    @Autowired
    private ComMapper comMapper;

    /**
     * [ 캠페인 ] 특별모금 Page 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectSpeclmysList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        String listCount           = speclmysMapper.selectSpeclmysListCount(paramMap);
        List<ComCamelMap> listInfo = speclmysMapper.selectSpeclmysList(paramMap);

        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);

        return resMap;
    }

    /**
     * [ 캠페인 ] 특별모금 한 건 조회 !!
     * @param paramMap
     * @return ComCamelMap
     * @throws Exception
     * 특별모금 한 건 정보
     */
    public Map<String, Object> selectSpeclmysInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        // 조회수 +1 증가
        speclmysMapper.updateSpeclmysRdCnt(paramMap);

        // 특별모금 한 건
        ComCamelMap speclmysInfo  = speclmysMapper.selectSpeclmysInfo(paramMap);

        /*
         * 기부하기 Button 이벤트를 위한 값
         * speclmysInfo 에 있는 event_code 로 THP_MysCodeMapping 에서 MYS_CL1, MYS_CL2 값을 가져옴.
         * 위 두 값을 이용하여 forwarding 할 기부페이지 url 을 setting 하여 함께 넘긴다.
         */

        if(!StringUtils.isNull(speclmysInfo)) {
            Map<String, String> mysCodeParamMap = null;
            ComCamelMap mysCodeMappingInfo      = null;

            if(!StringUtils.isNull(speclmysInfo.get("eventCodeFdrm"))) {
                mysCodeParamMap = new HashMap<String, String>();

                mysCodeParamMap.put("eventCode", (String)speclmysInfo.get("eventCodeFdrm"));
                mysCodeMappingInfo  = comMapper.selectMysCodeMappingInfo(mysCodeParamMap);

                Map<String, String> resultFdrm  = ComUtils.getCtFormUrl((String)mysCodeMappingInfo.get("mysCl1") + (String)mysCodeMappingInfo.get("mysCl2"));
                String ctFormUrlFdrm  = resultFdrm.get("returnUrl");
                String ctMenuIdFdrm   = resultFdrm.get("menuId");

                speclmysInfo.put("ct_form_url_fdrm", ctFormUrlFdrm);
                speclmysInfo.put("ct_menu_id_fdrm", ctMenuIdFdrm);
                speclmysInfo.put("setleMthd", (String)mysCodeMappingInfo.get("setleMthd"));
            }

            if(!StringUtils.isNull(speclmysInfo.get("eventCodeLmps"))) {
                mysCodeParamMap = new HashMap<String, String>();

                mysCodeParamMap.put("eventCode", (String)speclmysInfo.get("eventCodeLmps"));
                mysCodeMappingInfo  = comMapper.selectMysCodeMappingInfo(mysCodeParamMap);

                Map<String, String> resultLmps  = ComUtils.getCtFormUrl((String)mysCodeMappingInfo.get("mysCl1") + (String)mysCodeMappingInfo.get("mysCl2"));
                String ctFormUrlLmps  = resultLmps.get("returnUrl");
                String ctMenuIdLmps   = resultLmps.get("menuId");

                speclmysInfo.put("ct_form_url_lmps", ctFormUrlLmps);
                speclmysInfo.put("ct_menu_id_lmps", ctMenuIdLmps);
                speclmysInfo.put("setleMthd", (String)mysCodeMappingInfo.get("setleMthd"));
            }
        }

        resMap.put("speclmysInfo", speclmysInfo);

        return resMap;
    }

	@Override
	public int insert(Map<String, String> paramMap) throws Exception {
		String cnt = speclmysMapper.sameDataCheck(paramMap);
		int resultCnt = 0;
		if( !cnt.equals("0") ) {
			return 111;
		} else {
			resultCnt = speclmysMapper.insert(paramMap);
		}
		return resultCnt;
	}

}