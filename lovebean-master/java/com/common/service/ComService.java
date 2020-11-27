package com.common.service;

import java.util.List;
import java.util.Map;

import com.common.map.ComCamelMap;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : ComService.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] Service
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
public interface ComService {
    /**
     * [ Common ] Common Code List 조회 : Web Page or Server 에서 호출 !!
     * @param paramMap
     * @return List<ComCamelMap>
     * @throws Exception
     */
    public List<ComCamelMap> selectCmmnCodeList(Map<String, String> paramMap) throws Exception;

    /**
     * [ Common ] Common Code List 조회 : Server 에서 호출 !!
     * @param groupCode
     * @return List<ComCamelMap>
     * @throws Exception
     */
    public List<ComCamelMap> selectCmmnCodeList(String groupCode) throws Exception;


    /**
     * [ Common ] ComboBox Option 만들기 !!
     * @param groupCode
     * @param opt
     * @param val
     * @param addCond
     * @return String
     * @throws Exception
     */
    public String selectCmmnCodeComboString(String groupCode) throws Exception;

    public String selectCmmnCodeComboString(String groupCode, String opt) throws Exception;

    public String selectCmmnCodeComboString(String groupCode, String opt, String val) throws Exception;

    public String selectCmmnCodeComboString(String groupCode, String opt, String val, String addCond) throws Exception;


    /**
     * [ Common ] CheckBox or Radio 만들기 !!
     * @param groupCode
     * @param id
     * @param type
     * @param opt
     * @param val
     * @param addCond
     * @return String
     * @throws Exception
     */
    public String selectCmmnCodeChkRdoString(String groupCode, String id) throws Exception;

    public String selectCmmnCodeChkRdoString(String groupCode, String id, String type) throws Exception;

    public String selectCmmnCodeChkRdoString(String groupCode, String id, String type, String opt) throws Exception;

    public String selectCmmnCodeChkRdoString(String groupCode, String id, String type, String opt, String val) throws Exception;

    public String selectCmmnCodeChkRdoString(String groupCode, String id, String type, String opt, String val, String addCond) throws Exception;

    /**
     * [ Common ] 첨부 파일 목록 !!
     * @param listSn
     * @return List<ComCamelMap>
     * @throws Exception
     */
    public List<ComCamelMap> selectFileList(Map<String, String> paramMap) throws Exception;

    /**
     * [ Common ] 첨부 파일 삭제 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int genDeleteFile(Map<String, String> paramMap) throws Exception;
    
    /**
     * [ Common ] 지회 List !!
     * @return List<Object>
     * @throws Exception
     */
    public List<Object> selectBranchList() throws Exception;
    
    /**
     * [ Common ] Language List !!
     * @return List<Object>
     * @throws Exception
     */
    public List<Object> selectLanguageList() throws Exception;
    
    public Map<String, Object> selectFileDetailInfo(Map<String, String> paramMap) throws Exception;
}