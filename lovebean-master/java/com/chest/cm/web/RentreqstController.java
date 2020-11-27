package com.chest.cm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartRequest;

import com.chest.cm.service.RentreqstService;
import com.common.map.ComCamelMap;
import com.common.util.SessionUtils;

@Controller
@RequestMapping(value="/cm/rentreqst")
public class RentreqstController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private RentreqstService service;
    
    //파일다운로드 경로
    @Value("#{chest['DOWNLOAD.FILEPATH']}")
    public String DOWN_FILE;
    
    /**[ 대관관리 - 대관현황 ] Page Loading
     * @param paramMap
     * @param model
     * @return String
     * @throws Exception
     */
    @RequestMapping(value = "/init.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String init(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {
    	model.addAttribute("downPath", DOWN_FILE );
    	Map<String, String> result = new HashMap<String , String>();
    	paramMap = getDate(result);
    	String week = paramMap.get("week");
    	model.addAttribute("week", week);
        return "chest:/cm/cm_rentreqst__regist_005";
    }
    
    /***
     * 주말을 제외한 일수 구해오는곳
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/diffList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String diffCnt(@RequestParam Map<String, String> paramMap , Model model) throws Exception {
        Map<String, Object> resMap = service.diffList(paramMap);
    	model.addAttribute("result", (List<ComCamelMap>) resMap.get("listInfo"));
        return "jsonView";
        
    }
    
    /***
     * 임직원 여부 확인
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/emplChk.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String emplChk(@RequestParam Map<String, String> paramMap , Model model) throws Exception {
    	Map<String, Object> resMap = service.emplChk(paramMap);
    	model.addAttribute("result", (List<ComCamelMap>) resMap.get("listInfo"));
        return "jsonView";
    }
    
    /***
     * 예약 패스워드 확인
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/passwordCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String passwordCheck(@RequestParam Map<String, String> paramMap , Model model) throws Exception {
    	int cnt = service.passwordCheck(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detail", ( cnt != 0 ? "success" : "fail" ) );
        return "jsonView";
    }
    
    /***
     * SELECT BOX 
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectElstList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectSelList(@RequestParam Map<String, String> paramMap , Model model) throws Exception {
        Map<String, Object> resMap = service.selectElstList(paramMap);
        model.addAttribute("elstList", (List<ComCamelMap>) resMap.get("listInfo"));
        return "jsonView";
    }
  
    /***
     * 대관신청 저장하기
     * @param paramMap
     * @param multipartRequest
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insert.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String insert(@RequestParam Map<String, String> paramMap, MultipartRequest multipartRequest , Model model) throws Exception {
    	model.addAttribute("result", service.insert(SessionUtils.setSessionInfo(paramMap), multipartRequest));
        return "jsonView";
    }
    
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/SelectReserveStatus.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String SelectReserveStatus(@RequestParam Map<String, String> paramMap , Model model) throws Exception {
        Map<String, Object> resMap = service.SelectReserveStatus(paramMap);
        model.addAttribute("list", (List<ComCamelMap>) resMap.get("listInfo"));
        return "jsonView";
    }
    
    /***
     * 달력선택시 예약불가일을 선택못하게 disable
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectIgnoreCalendar.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectIgnoreCalendar(@RequestParam Map<String, String> paramMap , Model model) throws Exception {
        Map<String, Object> resMap = service.selectIgnoreCalendar(paramMap);
        model.addAttribute("list", (List<ComCamelMap>) resMap.get("listInfo"));
        return "jsonView";
    }
    
    
    /***
     * 상세 검색 
     * @param paramMap
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectReserveDetailList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectReseverList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        Map<String, Object> list = service.selectReserveDetailList(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("pageInfo", (Map<String, String>) list.get("pageInfo"));
        model.addAttribute("listInfo", (List<ComCamelMap>) list.get("listInfo"));
        return "jsonView";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	System.out.println("paramMap ==" + paramMap.toString());
    	
    	String yyyyMm = paramMap.get("yyyyMm");
    	String calMonth = paramMap.get("calMonth");
    	if( yyyyMm.equals("") && calMonth.equals("") ) {
    		paramMap = getDate(paramMap);
    	}
    	
    	Map<String, Object> getDate = service.selectGetDate(SessionUtils.setSessionInfo(paramMap));
    	Map<String, String> result = new HashMap<String , String>();
    	result = (Map<String, String>) getDate.get("getDate");
    	paramMap.putAll(result);
    	
     	String firstDate = paramMap.get("thisyear").toString() + paramMap.get("thismonth").toString() + "01";
    	String endDate = paramMap.get("thisyear").toString() + paramMap.get("thismonth").toString() + paramMap.get("endday").toString();
    	paramMap.put("firstDate", firstDate);
    	paramMap.put("endDate", endDate);	
    	
    	//주차에 해당되는 목록
    	Map<String, Object> week = service.weekList(paramMap);
    	
    	Map<String,String> param = new HashMap<String,String>();
    	
    	param.put("firstDate", paramMap.get("firstDate"));
    	param.put("weekNum", "");    	
    	//해당 월에 주차 , 요일 목록 - 전체
    	Map<String, Object> weekList = service.weekList(param);
    	
        //예약 된 리스트
        List<ComCamelMap> list = (List<ComCamelMap>) week.get("listInfo");
        param = new HashMap<String,String>();
        param.putAll(paramMap);
        
        for( int i=0; i<list.size(); i++ ) {
        	if( i==0 ) param.put("firstDate", list.get(i).get("dateList").toString() );
        	if( i== ( list.size() - 1 ) ) param.put("endDate", list.get(i).get("dateList").toString() );
        }
        
        param.put("elstCode", paramMap.get("elstCode"));
        Map<String, Object> elstLmttSetup = service.selectTHP_ElstLmttSetup( param);
        List<ComCamelMap> setupList = (List<ComCamelMap>) elstLmttSetup.get("list");
        Map<String,Object> listIgnore = new HashMap<String,Object>();
        List<ComCamelMap> ignoreList = new ArrayList<ComCamelMap>();
        
        for( int i=0; i<setupList.size(); i++) {
        	listIgnore = new HashMap<String,Object>();
        	param.put("sdate", setupList.get(i).get("sdate").toString() );
        	param.put("edate", setupList.get(i).get("edate").toString() );
        	listIgnore = service.selectListIgnore(param);
        	ignoreList.addAll( (List<ComCamelMap>) listIgnore.get("listIgnore") );
        }
        
        System.out.println("ignoreList ===" + ignoreList );
    	
        Map<String, Object> listReserve = service.SelectReserveList(param);
        model.addAttribute("listReserve" , (List<ComCamelMap>) listReserve.get("listReserve") );
        model.addAttribute("getDate", result);
        model.addAttribute("listIgnore", ignoreList);
        model.addAttribute("week", (List<ComCamelMap>) week.get("listInfo"));
        model.addAttribute("weekList", (List<ComCamelMap>) weekList.get("listInfo"));
        
        return "jsonView";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectDetail(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	Map<String, Object> listDetail = service.selectDetail(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("listDetail", (List<ComCamelMap>) listDetail.get("listDetail"));
        return "jsonView";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectDetailList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectDetailList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	
    	String yyyyMm = paramMap.get("yyyyMm");
    	String calMonth = paramMap.get("calMonth");
    	if( yyyyMm.equals("") && calMonth.equals("") ) {
    		paramMap = getDate(paramMap);
    	}
    	
    	Map<String, Object> getDate = service.selectGetDate(SessionUtils.setSessionInfo(paramMap));
    	Map<String, String> result = new HashMap<String , String>();
    	result = (Map<String, String>) getDate.get("getDate");
    	paramMap.putAll(result);
    	
        Map<String, Object> listDetail = service.selectDetailList(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("getDate", result);
        model.addAttribute("listDetail", (List<ComCamelMap>) listDetail.get("listDetail"));
        return "jsonView";
    }
    
    @RequestMapping(value = "/updateProgrsStep.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String updateProgrsStep(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
    	int cnt = service.updateProgrsStep(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("result", cnt);
        return "jsonView";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectPeriodDate.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectGetDate(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        Map<String, Object> resMap = service.selectPeriodDate(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detail", (Map<String, String>) resMap.get("detail"));
        return "jsonView";
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/selectDetailModify.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectDetailModify(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
        Map<String, Object> resMap = service.selectDetailModify(SessionUtils.setSessionInfo(paramMap));
        model.addAttribute("detail", (Map<String, String>) resMap.get("detail"));
        return "jsonView";
    }
    
    public Map<String , String> getDate( Map<String, String> paramMap ) {
		Map<String,String> result = new HashMap<String,String>();
		
		Calendar cal  = Calendar.getInstance(); 
		String year   = String.valueOf( cal.get ( cal.YEAR ) ); 
		String month  = String.format("%02d", cal.get(cal.MONTH) + 1 );
		String today  = String.valueOf(cal.get(cal.DAY_OF_MONTH) );
		String endDay = String.valueOf(cal.getActualMaximum(cal.DAY_OF_MONTH) );
		String week   = String.valueOf(cal.get(Calendar.WEEK_OF_MONTH));
		
		result.putAll(paramMap);
		result.put("yyyyMm", year+""+month);
		result.put("calMonth", "0");
		result.put("week", week);
		return result;
	}
    
}