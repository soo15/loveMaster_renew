package com.chest.ca.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

import com.common.config.PropertyConfig;
import com.common.map.ComCamelMap;
import com.common.util.ComUtils;
import com.common.util.CookieUtils;
import com.common.util.RequestProc;
import com.common.util.SessionUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.chest.bn.service.ScaService;
import com.common.service.ComService;

/**
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : CovidController.java
 * Author      : Chest Front
 * Date        : 2020. 4. 16.
 * Description : [ 특별모금 ] 코로나19
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2020. 4. 16.    Chest Front      Initial Release
 * CH_01
 *************************************************************************************************
 */
@Controller
@RequestMapping(value="/ca/speclmys")
public class CovidController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ScaService service;
    
     /**
      * [특별모금] 코로나19  Page Loading
      * @param paramMap
      * @param model
      * @return String
      * @throws Exception
      */
     @RequestMapping(value = "/initCovid.do", method = {RequestMethod.GET, RequestMethod.POST})
     public String initCovid(@RequestParam Map<String, String> paramMap, ModelMap model) throws Exception {

         
         return "chest:/ca/ca_speclmys_covid_html_001";
     } 
     
     
}