package com.chest.sample.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.util.ComUtils;
import com.chest.sample.mapper.SampleMapper;
import com.chest.sample.service.SampleService;

@Service
@Transactional(rollbackFor={Exception.class})
public class SampleServiceImpl implements SampleService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SampleMapper sampleMapper;

    public Map<String, Object> searchSampleList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        String listCount      = sampleMapper.searchSampleListCount(paramMap);
        List<Object> listInfo = sampleMapper.searchSampleList(paramMap);

        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);

        return resMap;
    }
}