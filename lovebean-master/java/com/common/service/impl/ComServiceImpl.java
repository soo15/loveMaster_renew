package com.common.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.map.ComCamelMap;
import com.common.mapper.ComMapper;
import com.common.service.ComService;
import com.common.util.FileUtils;
import com.common.util.SessionUtils;
import com.common.util.StringUtils;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 관리자 System
 * Class Name  : ComServiceImpl.java
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Common ] Service Impl
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Service
@Transactional(rollbackFor={Exception.class})
public class ComServiceImpl implements ComService {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("#{chest['gen.filePath']}")
    public String genFilePath;

    @Autowired
    private ComMapper comMapper;

    /**
     * [ Common ] Common Code List 조회 : Web Page or Server 에서 호출 !!
     * @param paramMap
     * @return List<ComCamelMap>
     * @throws Exception
     */
    public List<ComCamelMap> selectCmmnCodeList(Map<String, String> paramMap) throws Exception {
        return comMapper.selectCmmnCodeList(paramMap);
    }

    /**
     * [ Common ] Common Code List 조회 : Server 에서 호출 !!
     * @param groupCode
     * @return List<ComCamelMap>
     * @throws Exception
     */
    public List<ComCamelMap> selectCmmnCodeList(String groupCode) throws Exception {
        Map<String, String> paramMap = new HashMap<String, String>();

        paramMap.put("groupCode", groupCode);

        return comMapper.selectCmmnCodeList(SessionUtils.setSessionInfo(paramMap));
    }


    /**
     * [ Common ] ComboBox Option 만들기 !!
     * @param groupCode
     * @param opt
     * @param val
     * @param addCond
     * @return String
     * @throws Exception
     */
    public String selectCmmnCodeComboString(String groupCode) throws Exception {
        return selectCmmnCodeComboString(groupCode, null, null, null);
    }

    public String selectCmmnCodeComboString(String groupCode, String opt) throws Exception {
        return selectCmmnCodeComboString(groupCode, opt, null, null);
    }

    public String selectCmmnCodeComboString(String groupCode, String opt, String val) throws Exception {
        return selectCmmnCodeComboString(groupCode, opt, val, null);
    }

    public String selectCmmnCodeComboString(String groupCode, String opt, String val, String addCond) throws Exception {
        StringBuffer options = new StringBuffer();

        opt     = StringUtils.isNull(opt)     ? "S" : opt;
        val     = StringUtils.isNull(val)     ? ""  : val;
        addCond = StringUtils.isNull(addCond) ? ""  : addCond;


        Map<String, String> paramMap = new HashMap<String, String>();

        paramMap.put("groupCode", groupCode);
        paramMap.put("addCond",   addCond);

        List<ComCamelMap> listInfo = comMapper.selectCmmnCodeList(paramMap);


        //===================================================================
        // GroupCode 가 없거나 조회 된 결과가 없을 경우 !!
        //===================================================================
        if(StringUtils.isNull(groupCode) || listInfo.size() == 0) {
            options.append("<option value=\"\">선택</option>");

            return options.toString();
        }


        //===================================================================
        // Html 형태
        //===================================================================
        // <option value="" selected="selected">선택 or 전체</option>
        // <option value="Code1">Name1</option>
        // <option value="Code2">Name2</option>
        // <option value="Code3">Name3</option>
        //===================================================================


        if("A".equals(opt) || "S".equals(opt)){
            String selected  = "".equals(val)  ? "selected=\"selected\"" : "";
            String optString = "A".equals(opt) ? "전체" : "선택";

            options.append("<option value=\"\" " + selected + ">" + optString + "</option>");
        }


        if(listInfo.size() > 0){
            ComCamelMap map = new ComCamelMap();

            for(int i=0; i<listInfo.size(); i++){
                map = (ComCamelMap) listInfo.get(i);

                String code = (String) map.get("cmmnCode");
                String name = (String) map.get("cmmnCodeNm");

                String selected = "";

                if(!"".equals(val)){
                    selected = code.equals(val) ? "selected=\"selected\"" : "";
                }

                options.append("<option value=\"" + code + "\" " + selected + ">" + name + "</option>");
            }
        }

        return options.toString();
    }


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
    public String selectCmmnCodeChkRdoString(String groupCode, String id) throws Exception {
        return selectCmmnCodeChkRdoString(groupCode, id, null, null, null, null);
    }

    public String selectCmmnCodeChkRdoString(String groupCode, String id, String type) throws Exception {
        return selectCmmnCodeChkRdoString(groupCode, id, type, null, null, null);
    }

    public String selectCmmnCodeChkRdoString(String groupCode, String id, String type, String opt) throws Exception {
        return selectCmmnCodeChkRdoString(groupCode, id, type, opt, null, null);
    }

    public String selectCmmnCodeChkRdoString(String groupCode, String id, String type, String opt, String val) throws Exception {
        return selectCmmnCodeChkRdoString(groupCode, id, type, opt, val, null);
    }

    public String selectCmmnCodeChkRdoString(String groupCode, String id, String type, String opt, String val, String addCond) throws Exception {
        StringBuffer options = new StringBuffer();

        type    = StringUtils.isNull(type)    ? "radio" : ("R".equals(type) ? "radio" : "checkbox");
        opt     = StringUtils.isNull(opt)     ? "" : opt;
        val     = StringUtils.isNull(val)     ? "" : val;
        addCond = StringUtils.isNull(addCond) ? "" : addCond;


        Map<String, String> paramMap = new HashMap<String, String>();

        paramMap.put("groupCode", groupCode);
        paramMap.put("addCond",   addCond);

        List<ComCamelMap> listInfo = comMapper.selectCmmnCodeList(SessionUtils.setSessionInfo(paramMap));


        //===================================================================
        // GroupCode 가 없거나 조회 된 결과가 없을 경우 !!
        //===================================================================
        if(StringUtils.isNull(groupCode) || StringUtils.isNull(id) || listInfo.size() == 0) {
            return "";
        }


        //===================================================================
        // Html 형태
        //===================================================================
        // <div class="form-group no-margin">
        //     <div class="form-group-item">
        //         <label><input id="id" name="name" type="checkbox or radio" checked="checked class="minimal"> checkbox or radio</label>
        //     </div>
        //     <div class="form-group-item">
        //         <label><input id="id" name="name" type="checkbox or radio" class="minimal"> checkbox or radio</label>
        //     </div>
        // </div>
        //===================================================================


        options.append("<div class=\"form-group no-margin\">");


        if("A".equals(opt)){
            options.append("<div class=\"form-group-item\">");
            options.append("    <label><input id=\"" + id + "\" name=\"" + id + "\" type=\"" + type + "\" class=\"minimal\"> 전체</label>");
            options.append("</div>");
        }


        if(listInfo.size() > 0){
            ComCamelMap map = new ComCamelMap();

            for(int i=0; i<listInfo.size(); i++){
                map = (ComCamelMap) listInfo.get(i);

                String code = (String) map.get("cmmnCode");
                String name = (String) map.get("cmmnCodeNm");

                String radioChecked = "";

                if(!"".equals(val)){
                    radioChecked = code.equals(val) ? "checked=\"checked\"" : "";
                }

                options.append("<div class=\"form-group-item\">");
                options.append("    <label><input id=\"" + id + "\" name=\"" + id + "\" type=\"" + type + "\" value=\"" + code + "\" " + radioChecked + " class=\"minimal\"> " + name + "</label>");
                options.append("</div>");
            }
        }

        options.append("</div>");

        return options.toString();
    }

    /**
     * [ Common ] 첨부 파일 목록 !!
     * @param paramMap
     * @return List<ComCamelMap>
     * @throws Exception
     */
    /**
     * 2019.09.10 신상욱
     * 공통함수 개선 필요
     */
    public List<ComCamelMap> selectFileList(Map<String, String> paramMap) throws Exception {
        return comMapper.selectFileList(paramMap);
    }

    /**
     * [ Common ] 첨부 파일 삭제 !!
     * @param paramMap
     * @return int
     * @throws Exception
     */
    public int genDeleteFile(Map<String, String> paramMap) throws Exception {
        // 각각의 Data 정보 update or delete 한 후 파일 삭제 !!
        // int result = comMapper.updateFileInfo(paramMap);

        int result = 1;

        if(result > 0) {
            // File Delete !!
            String filePath     = paramMap.get("filePath");
            String fileFullPath = (!StringUtils.isNull(filePath) ? filePath : genFilePath) + paramMap.get("phycFileNm");

            FileUtils.fileDelete(fileFullPath);
        }

        return result;
    }


    /**
     * [ Common ] 지회 List (공통 코드에 URL을 입력하는 필드를 추가하여 조회하는 걸 추천함) !!
     *
     * 001 중앙회 : http://www.chest.or.kr
     * 002 서울 모금회 : http://seoul.chest.or.kr
     * 003 부산 모금회 : http://busan.chest.or.kr
     * 004 대구 모금회 : http://daegu.chest.or.kr
     * 005 인천 모금회 : http://incheon.chest.or.kr
     * 005 인천 모금회 : http://ic.chest.or.kr
     * 006 광주 모금회 : http://gwangju.chest.or.kr
     * 006 광주 모금회 : http://gj.chest.or.kr
     * 007 대전 모금회 : http://daejeon.chest.or.kr
     * 007 대전 모금회 : http://dj.chest.or.kr
     * 008 울산 모금회 : http://ulsan.chest.or.kr
     * 009 경기 모금회 : http://gyeonggi.chest.or.kr
     * 009 경기 모금회 : http://gg.chest.or.kr
     * 010 강원 모금회 : http://gangwon.chest.or.kr
     * 010 강원 모금회 : http://gw.chest.or.kr
     * 011 충북 모금회 : http://cb.chest.or.kr
     * 011 충북 모금회 : http://chungbuk.chest.or.kr
     * 012 충남 모금회 : http://cn.chest.or.kr
     * 012 충남 모금회 : http://chungnam.chest.or.kr
     * 013 전북 모금회 : http://jb.chest.or.kr
     * 013 전북 모금회 : http://gb.chest.or.kr
     * 014 전남 모금회 : http://jn.chest.or.kr
     * 014 전남 모금회 : http://jeonnam.chest.or.kr
     * 015 경북 모금회 : http://gb.chest.or.kr
     * 015 경북 모금회 : http://gyeongbuk.chest.or.kr
     * 016 경남 모금회 : http://gn.chest.or.kr
     * 016 경남 모금회 : http://gyeongnam.chest.or.kr
     * 017 제주 모금회 : http://jeju.chest.or.kr
     * 017 제주 모금회 : http://jj.chest.or.kr
     * 018 세종 모금회 : http://sejong.chest.or.kr
     * 018 세종 모금회 : http://sj.chest.or.kr
     *
     * @return List<Object>
     * @throws Exception
     */
    public List<Object> selectBranchList() throws Exception {
        List<Object> branchList = new ArrayList<Object>();

        String[] arrBranchCd = {"001", "002", "003", "004", "005", "006", "007", "008","009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "010", "009", "006", "007", "018", "005", "014", "013", "017", "012", "011", "015", "016"};
        String[] arrBranchId = {"www", "seoul", "busan", "daegu", "incheon", "gwangju", "daejeon", "ulsan","gyeonggi", "gangwon", "cb", "cn", "jb", "jn", "gb", "gn", "jeju", "sejong", "gw", "gg", "gj", "dj", "sj", "ic", "jeonnam", "gb", "jj", "chungnam", "chungbuk", "gyeongbuk", "gyeongnam"};
        String[] arrBranchNm = {"중앙회", "서울", "부산", "대구", "인천", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주", "세종", "강원", "경기", "광주", "대전", "세종", "인천", "전남", "전북", "제주", "충남", "충북", "경북", "경남"};

        for(int i=0; i<arrBranchCd.length; i++) {
            Map<String, String> map = new HashMap<String, String>();

            map.put("branchCd",  arrBranchCd[i]);
            map.put("branchId",  arrBranchId[i]);
            map.put("branchNm",  arrBranchNm[i] + (i == 0 ? "" : " 모금회"));
            map.put("branchUrl", "https://" + arrBranchId[i] + ".chest.or.kr/");

            branchList.add(map);
        }

        return branchList;
    }

    /**
     * [ Common ] Language List !!
     * @return List<Object>
     * @throws Exception
     */
    public List<Object> selectLanguageList() throws Exception {
        List<Object> list = new ArrayList<Object>();

        String[] arrLangCd = {"001", "002", "003", "004"};
        String[] arrLangId = {"www", "eng", "china", "jp"};
        String[] arrLangNm = {"한국어", "English", "中文", "日文"};//http://localhost:8080

        String url = "";


        for(int i=0; i<arrLangCd.length; i++) {
            Map<String, String> map = new HashMap<String, String>();

            url = "https://" + arrLangId[i] + ".chest.or.kr/";

            map.put("langCd",  arrLangCd[i]);
            map.put("langId",  arrLangId[i]);
            map.put("langNm",  arrLangNm[i]);
            map.put("langUrl", url);

            list.add(map);
        }

        return list;
    }

    /**
     * [ Common ] 지회 ComboBox Option 만들기 (URL 이 필요한 경우) !!
     * @param opt
     * @param val
     * @return String
     * @throws Exception
     */
    public String selectBranchComboString(String opt) throws Exception {
        return this.selectBranchComboString(opt, null);
    }

    public String selectBranchComboString(String opt, String val) throws Exception {
        StringBuffer options = new StringBuffer();

        opt = StringUtils.isNull(opt) ? "S" : opt;
        val = StringUtils.isNull(val) ? ""  : val;

        List<Object> listInfo = this.selectBranchList();


        //===================================================================
        // 조회 된 결과가 없을 경우 !!
        //===================================================================
        if(listInfo.size() == 0) {
            options.append("<option value=\"\">선택</option>");

            return options.toString();
        }


        //===================================================================
        // Html 형태
        //===================================================================
        // <option value="" selected="selected">선택 or 전체</option>
        // <option value="Code1">Name1</option>
        // <option value="Code2">Name2</option>
        // <option value="Code3">Name3</option>
        //===================================================================


        if("A".equals(opt) || "S".equals(opt)){
            String selected  = "".equals(val)  ? "selected=\"selected\"" : "";
            String optString = "A".equals(opt) ? "전체" : "선택";

            options.append("<option value=\"\" " + selected + ">" + optString + "</option>");
        }


        if(listInfo.size() > 0){
            ComCamelMap map = new ComCamelMap();

            for(int i=0; i<listInfo.size(); i++){
                map = (ComCamelMap) listInfo.get(i);

                String code = (String) map.get("branchCd");
                String name = (String) map.get("branchNm");

                String selected = "";

                if(!"".equals(val)){
                    selected = code.equals(val) ? "selected=\"selected\"" : "";
                }

                options.append("<option value=\"" + code + "\" " + selected + ">" + name + "</option>");
            }
        }

        return options.toString();
    }
    
    /**
     * 파일다운로드 경로 조회
     * @param paramMap
     * @return Map<String, Object>
     * @throws Exception
     */
    public Map<String, Object> selectFileDetailInfo(Map<String, String> paramMap) throws Exception {
        Map<String, Object> resMap = new HashMap<String, Object>();

        ComCamelMap filedetailinfo = comMapper.selectFileDetailInfo(paramMap);
        resMap.put("filedetailinfo", filedetailinfo);

        return resMap;
    }
}