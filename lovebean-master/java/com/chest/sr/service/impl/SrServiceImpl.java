package com.chest.sr.service.impl;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.chest.sr.service.SrService;
import com.common.util.ComUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : GuidanceServiceImpl.java
 * Author      : Chest Front
 * Date        : 2019. 10. 22.
 * Description : [ 검색 ] 관련
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 10. 22.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class SrServiceImpl implements SrService {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("#{chest['elasticserach.engine.ip']}")
    public String elasticIp;

    /**
     * [ 검색 ] 검색결과 리스트 조회 !!
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public Map<String, Object> selectSearchList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        String keyword = paramMap.get("keyword");
        String keywordTemp = "";
        String[] arrKeyword = StringUtils.split(keyword, " ");
        if(arrKeyword != null) {
            for(String val: arrKeyword) {
                val = StringUtils.replace(val, ";", "");
                keywordTemp += "*"+val+"* ";
            }
            keywordTemp = StringUtils.trim(keywordTemp);
        } else {
            keywordTemp = keyword;
        }

        int size = 10;
        int currPageno = 0;
        try {
            currPageno = Integer.parseInt(paramMap.get("currPageNo"));
            if(currPageno ==0) currPageno = 1;
        } catch(Exception e) {
            currPageno = 1;
        }

        int from = (currPageno - 1) * size;
        StringBuffer url = new StringBuffer();
        url.append(elasticIp);
        url.append("?");
        url.append("from=");
        url.append(from);
        url.append("&size=");
        url.append(size);
        url.append("&q=register:*SYSTEM AND");
        url.append("(title:");
        url.append(keywordTemp);
        url.append(" OR content:");
        url.append(keywordTemp);
        url.append(")");

        try {
            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
            UriComponents builder = UriComponentsBuilder.fromHttpUrl(url.toString()).build(false);
            ResponseEntity<Map> response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), Map.class);
            Map<String, Object> list = (Map<String, Object>) response.getBody().get("hits");
            Map<String, Object> total = (Map<String, Object>) list.get("total");

            resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, total.get("value").toString()));
            resMap.put("listInfo", (Map<String, Object>) list);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            throw e;
        }

        return resMap;
    }
}