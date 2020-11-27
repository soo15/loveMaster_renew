package com.chest.sample.mapper;

import java.util.List;
import java.util.Map;

public interface SampleMapper {
    public String searchSampleListCount(Map<String, String> paramMap);
    
    public List<Object> searchSampleList(Map<String, String> paramMap);
}