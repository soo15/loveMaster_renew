package com.chest.fr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chest.fr.mapper.FrmycntrMapper;
import com.chest.fr.service.FrmycntrService;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;

@Service
@Transactional(rollbackFor={Exception.class})
public class FrmycntrServiceImpl implements FrmycntrService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Value("#{chest['gen.filePath']}")
    public String genFilePath;
    
    @Autowired
    private FrmycntrMapper mapper;
    
    public Map<String, Object> selectList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String listCount           = mapper.selectListCount(paramMap);
        List<ComCamelMap> listInfo = mapper.selectList(paramMap);
        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);
        return resMap;
    }
    
    public Map<String, Object> selectCicsList(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();
        String listCount           = "0";
        List<ComCamelMap> listInfo = mapper.selectCicsList(paramMap);
        if( listInfo.size() > 0 ) {
        	listCount = (String) listInfo.get(0).get("totCount");
        }        		
        resMap.put("pageInfo", ComUtils.getPageInfo(paramMap, listCount));
        resMap.put("listInfo", listInfo);
        return resMap;
    }
	
    @Override
	public Map<String, Object> selectDetail(Map<String, String> paramMap) throws Exception {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("detail", mapper.selectDetail(paramMap));
		return resMap;
	}

	@Override
	public String getIhidnumBizrno(Map<String, String> paramMap) throws Exception {
		return mapper.getIhidnumBizrno(paramMap);
	}

	@Override
	public int insert(Map<String, String> paramMap) throws Exception {
        int cnt = 0;
		cnt = mapper.insert(paramMap);
		return cnt;
	}

    @Override
    public int insert_cntr(Map<String, String> paramMap) throws Exception {
        int cnt = 1;
        mapper.insert_cntr(paramMap);
        return cnt;
    }

    
}