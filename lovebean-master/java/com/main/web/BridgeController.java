package com.main.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BridgeController {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    /**[ 브릿지 ] Page Loading
    *
    * Usage :
    *
    * 외부 링크를 통해 사용자 화면을 접근할 경우 (예 : 이메일 등)
    * 다음과 같은 링크 형식으로 작성합니다.
    *
    * ex) 예시는 나눔문화연구소 연구자료 특정 상세페이지로 이동할 경우립니다.
    *
    *   https://www.chest.or.kr/bridgelink.do?pBranchCd=018&bhfCode=018&_mid=02_01_00&_murl=L2Jicy8xMDA1L2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xJnBCaGZDb2RlPTAwMQ==
    *
    *
    *   02_01_00 -> 해당 메뉴 ID 로 메뉴배열에 있는 ID -> 추후 이 부분은 넘기지 않아도 되도록 개선 예정
    *
    * @param paramMap
    * @param model
    * @return String
    * @throws Exception
    */

    @SuppressWarnings("restriction")
    @RequestMapping(method = RequestMethod.GET, value = "bridgelink.do")
    public String bridge(Model model, HttpServletRequest request) throws Exception {

        String menuId = StringUtils.trimToEmpty(request.getParameter("_mid"));
        String orgUrl = StringUtils.trimToEmpty(request.getParameter("_murl"));
        String param = "";
        String menuUrl = "";
        orgUrl = new String((new sun.misc.BASE64Decoder()).decodeBuffer(orgUrl));

        if(StringUtils.indexOf(orgUrl, "?") > -1) {
            menuUrl = StringUtils.substring(orgUrl, 0, StringUtils.indexOf(orgUrl, "?"));
            param = StringUtils.substring(orgUrl, StringUtils.indexOf(orgUrl, "?")+1);
        } else {
            menuUrl = orgUrl;
        }
        model.addAttribute("bridgeMenuId", menuId);
        model.addAttribute("bridgeMenuUrl", menuUrl);
        model.addAttribute("bridgeParam", param);

        return "blank:/bridge/bridge";
    }
}