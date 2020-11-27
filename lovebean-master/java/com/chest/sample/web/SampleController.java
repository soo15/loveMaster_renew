package com.chest.sample.web;

import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.chest.sample.service.SampleService;
import com.common.service.ComService;

@Controller
@RequestMapping(value="/sample/templet")
public class SampleController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SampleService sampleService;

    @Autowired
    private ComService commService;

    @RequestMapping(value = "/initTemplet.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String initialCodeMgmt(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

        logger.debug("test================");
//        model.addAttribute("companyCdCombo", commService.searchComCdComboString("G100001", "A", "") ); // 회사 Combo String

        return "chest:/sample/templet";
    }


    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/searchSampleList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String searchUserMgmtList(@RequestParam Map<String, String> paramMap, Model model) throws Exception {
//        Map<String, Object> resMap = sampleService.searchUserMgmtList(SessionUtils.setSessionInfo(paramMap));
//
//        model.addAttribute("pageInfo", (Map<String, String>)resMap.get("pageInfo"));
//        model.addAttribute("listInfo", (List<Object>)resMap.get("listInfo"));

        return "jsonView";
    }
}