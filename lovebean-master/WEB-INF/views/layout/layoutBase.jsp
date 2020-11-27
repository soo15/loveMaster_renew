<%--
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : layoutBase.jsp
 * Author      : Chest Admin
 * Date        : 2019. 8. 1.
 * Description : [ Layout ] layoutBase Page
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../include/ghead.jsp"%>

<%
    String image    = (String)request.getAttribute("ogImage");
    String prsn     = (String)request.getAttribute("propseSn");
    String ogurl    = (String)request.getAttribute("ogURL");
    String url      = "";
    if(image == null){
        image   = request.getParameter("pBranchUrl") + "common/img/common/no-img.jpg";
    }

    String siteName = "( " + request.getParameter("pBranchNm") + " ) 사회복지공동모금회 사랑의열매";
    if(prsn == null && ogurl != null){
        url      = ogurl;
    } else {
        url      = request.getParameter("pBranchUrl") + "ca/crwdfund/P/initCrwdfundDetail.do?pMenuType=header&pMenuId=00_01_01&propseSn=" + (String)request.getAttribute("propseSn");
        
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, user-scalable=no">

        <meta name="keywords" content="사랑의 열매, 사회복지공동모금회"/>
        <meta name="description" content=""/>

        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="naver-site-verification" content="4ceec3aa298af6746a1432e53369d1aa1fea56a9" />
		<span itemscope="" itemtype="http://schema.org/Organization">
		<link itemprop="url" href="http://www.mysite.com">
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
		<a itemprop="sameAs" href="https://www.facebook.com/chestkorea"></a>
		<a itemprop="sameAs" href="https://blog.naver.com/nanum_in"></a>
		<a itemprop="sameAs" href="https://www.youtube.com/channel/UCbHsnc9llMcA9ypjVAnpcuQ"></a>
		<a itemprop="sameAs" href="https://www.instagram.com/fruits_of_love"></a>
		</span>

        <!-- 크라우드 펀딩 (진행중인 펀딩 SNS 공유) start -->
        <meta property="og:title" content="${ogTitle}" />
        <meta property="og:type" content="article" />
        <meta property="og:image" content="<%=image %>" />
        <meta property="og:site_name" content="<%=siteName %>" />
        <meta property="og:url" content="<%=url %>" />
        <meta property="og:description" content="${ogDescription }" />
        <!-- 크라우드 펀딩 (진행중인 펀딩 SNS 공유) end -->

        <title>( <c:out value="${__branchNm}" escapeXml="false" /> ) <tiles:insertAttribute name="title" ignore="true" /></title>

        <%@ include file="../include/jhead.jsp"%>

        <style>
            .swiper-container {
                width: 100%;
                height: 100%;
            }
            .swiper-slide {
                text-align: center;
                font-size: 18px;
                background: #fff;
                /* Center slide text vertically */
                display: -webkit-box;
                display: -ms-flexbox;
                display: -webkit-flex;
                display: flex;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                -webkit-justify-content: center;
                justify-content: center;
                -webkit-box-align: center;
                -ms-flex-align: center;
                -webkit-align-items: center;
                align-items: center;
            }

        </style>

        <!-- 20200609 온라인팀 요청으로 추가 start -->
        <!-- 카카오 -->
        <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
        <script type="text/javascript">
              kakaoPixel('6688345712168188879').pageView('1');
        </script>
        <!-- 20200609 온라인팀 요청으로 추가 end -->

        <script type="text/javascript">
            var gmenuid = "";
            var gmenutype = "";
            (function($, win, doc, undefined) {
                $(doc).ready(function(){
                    // Cookies Setting !!
                    var __branchCd  = "<c:out value="${__branchCd}"  escapeXml="false" />";
                    var __branchId  = "<c:out value="${__branchId}"  escapeXml="false" />";
                    var __branchNm  = "<c:out value="${__branchNm}"  escapeXml="false" />";
                    var __branchUrl = "<c:out value="${__branchUrl}" escapeXml="false" />";
                    var __menuId    = "<c:out value="${__menuId}"    escapeXml="false" />";
                    var __menuType  = "<c:out value="${__menuType}"  escapeXml="false" />";
                    gmenuid = __menuId;
                    gmenutype = __menuType;
                    
                    // 필수실행
                    $plugins.common.init({ branchCd  : __branchCd
                                          ,branchId  : __branchId
                                          ,branchNm  : __branchNm
                                          ,branchUrl : __branchUrl
                                          ,menuId    : __menuId
                                          ,menuType  : __menuType });

                    //tab
                    $plugins.uiTab({
                        id:'uiTabguide1',
                        current:0
                    });
                    $plugins.uiTab({
                        id:'uiTabguide2',
                        current:0
                    });
                    $plugins.uiTab({
                        id:'uiTabguide3',
                        current:0
                    });

                    //acco
                    $plugins.uiAccordion({
                        id: 'uiAccoguide1',
                        current: [0],
                        autoclose: true
                    });

                    /*
                                        사랑의 온도탑 관련
                       _todayClose -> 오늘 하루 닫기 쿠키 처리
                       /contentHtml/tpTop.html -> 온도탑 디자인을 변경하기 위해서는 해당경로에 있는 tpTop.html 파일을 수정.
                    */
                    var _todayClose = $.cookie("__todayClose") == undefined || $.cookie("__todayClose") == null ? "N" : $.cookie("__todayClose");

                    if(_todayClose == "N"){
                        $("#rightWing").show();

                        $plugins.uiAjax({
                            id:'rightWing',
                            url:'/contentHtml/tpTop.html',
                            page:true,
                            callback:function(){
                                (!$plugins.browser.mobile) ? $plugins.uiSelect() : '';

                                selectTpTopInfo();
                                $("#rightWing #btnCloseToday").off("click").on("click", function(){
                                    $.cookie("__todayClose", 'Y', { expires: 1 });
                                    $("#rightWing").hide();
                                });
                            }
                        });
                    }else{
                        $("#rightWing").hide();
                    }
                });
            })(jQuery, window, document);

            function snsMoveEvent(snsTp) {
                var url = GV_ARR_SNS_LINK[snsTp+"_${__branchCd}"];
                window.open(url, "_blank");
            }

            /*************************************************************
             * Ajax Send Event Function !!
             *************************************************************/
            /*===========================================================
             * 사랑의 온도탑 조회 !!
             *===========================================================*/
            function selectTpTopInfo(){
                var param  = "&pBhfCode=" + $.cookie("__branchCd");

                gf_send("/selectTpTopInfo.do", param);
            }

            /*************************************************************
             * Ajax Send Callback Function !!
             *************************************************************/
            /*===========================================================
             * 사랑의 온도탑 Callback Function !!
             *===========================================================*/
            function selectTpTopInfoAfter(data){
                if(data.dataInfo != null){
                    var tpTopInfo   = data.dataInfo.tpTopInfo;

                    if(!gf_isNull(tpTopInfo)){
                        var branchNm= "<c:out value="${__branchNm}" escapeXml="false" />";
                        if(branchNm != ""){
                            branchNm    = branchNm.substring(0, 2);

                            if(branchNm == "중앙"){
                                branchNm = "";
                            }
                        }

                        var goal    = !gf_isNull(tpTopInfo.goal) ? gf_comma(tpTopInfo.goal) : 0;
                        var acmslt  = !gf_isNull(tpTopInfo.acmslt) ? gf_comma(tpTopInfo.acmslt) : 0;
                        var pt      = !gf_isNull(tpTopInfo.pt) ? gf_comma(tpTopInfo.pt) : 0;

                        $("#tpTop #branchNm").text(branchNm);
                        $("#tpTop #temperatureVal").text(pt + "도");
                        $("#tpTop #temperatureBar").css({"height":pt + "%"});
                        $("#tpTop #temperatureBar").text(pt + "%");

                        $("#tpTop #acmslt").text(acmslt);
                        $("#tpTop #goal").text(goal);
                    }

                }else{
                    alert("<spring:message code="com.system.error"></spring:message>");
                    return;
                }
            }
            
            <!-- 20200923 온라인팀 요청으로 추가 start -->

            window.dataLayer = window.dataLayer || [];
            //함수나 조건문으로 감싸지 말고 가장 위에 선언

            $(function(){
                var GV_SITEMAP = [];
                GV_SITEMAP = GV_SITEMAP.concat(GV_ARR_MENU_H.menu, GV_ARR_MENU_F.menu);
    
                var mtitle = "";
                var mlink = window.location.href;
                for(var i in GV_SITEMAP) {
                    var menuinfo = GV_SITEMAP[i];
    
                    if(menuinfo.dep2 && menuinfo.dep2.length > 0) {
                        for(var j in menuinfo.dep2) {
                            var menuinfo2 = menuinfo.dep2[j];
                            if (gmenuid == menuinfo2.code) {
                                if (gmenutype == "footer") {
                                    mtitle = menuinfo.name + ">" + menuinfo2.name;
                                }
                            }
                            if(menuinfo2.dep3 && menuinfo2.dep3.length > 0) {
                                for(var k in menuinfo2.dep3) {
                                    var menuinfo3 = menuinfo2.dep3[k];
                                    if (gmenuid == menuinfo3.code) {
                                        if (gmenutype == "header") {
                                            mtitle = menuinfo.name + ">" + menuinfo2.name + ">" + menuinfo3.name;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (mlink.indexOf("initCrwdfundDetail") != -1) {
                    mlink = "<%=url %>";
                    dataLayer.push({ //push로 밀어넣음
                        'pageUrl': mlink,
                        'pageTitle':  mtitle
                       });
                } else {
                    dataLayer.push({ //push로 밀어넣음
                        'pageUrl': mlink,
                        'pageTitle':  mtitle
                    });
                }
                
            });
        </script>
        <script>
        (function(w,d,s,l,i){
            w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-P2S8MLW');
        </script>
        <!-- 20200923 온라인팀 요청으로 추가 end -->
    </head>
    <body>
                
        <div class="base-skip" id="baseSkip">
        	<strong class="hidden">반복영역 건너뛰기</strong>
        	<ul><li><a href="#baseMain">본문 바로가기</a></li></ul>
        </div>
        <div class="base-layer" id="baseLayer">
            <!-- search -->
            <div class="ui-modal type-search" id="modalSearch" role="dialog" aria-hidden="true">
                <div class="ui-modal-wrap">
                    <header class="ui-modal-header">
                        <h1 class="ui-modal-tit"><span>통합검색</span></h1>
                        <p>사랑의열매와 함께 나눔의 행복을 찾아보세요.</p>
                    </header>
                    <div class="ui-modal-cont box-search">
                        <div class="inner-wrap">
                            <input type="text" class="inp-base" id="searchKeyword" title="통합검색" placeholder="검색어를 입력해주세요."></input>
                            <button type="button" class="btn-base-main" id="btnResult">검색하기</button>
                        </div>
                    </div>
                    <div class="ui-modal-footer">
                        <button type="button" class="btn-base ui-modal-close"><span class="hide">닫기</span></button>
                    </div>
                </div>
            </div>

            <div class="ui-modal box-base type-password" id="modalPassword" role="dialog" aria-hidden="true">
                <div class="ui-modal-wrap">
                    <header class="ui-modal-header">
                        <h1 class="ui-modal-tit hide"><span>댓글 수정/삭제</span></h1>
                        <p>댓글입력시 설정한 자신의 비밀번호를 입력하세요.</p>
                    </header>
                    <div class="ui-modal-cont box-password">
                        <div class="inner-wrap">
                            <div>
                                <p>비밀번호</p>
                                <input type="password" id="replyPw" class="inp-base" title="비밀번호" placeholder="숫자 6자리" maxlength="6" >
                            </div>
                            <button type="button" id="btnCheckReplyPw" class="btn-base-imp">확인</button>
                        </div>
                    </div>
                    <div class="ui-modal-footer">
                        <button type="button" class="ui-modal-close btn-close"><span class="hide">닫기</span></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- layout Start -->
        <div class="base-wrap" id="baseWrap">
            <!-- header start -->
            <header class="base-header" id="baseHeader">
                <tiles:insertAttribute name="header"/>
            </header>
            <!-- // header end -->

            <!-- body start -->
            <div class="base-body" id="baseBody">
                <tiles:insertAttribute name="body"/>
            </div>
            <!-- // body end -->

            <!-- footer start -->
            <footer class="base-footer" id="baseFooter">
                <tiles:insertAttribute name="footer"/>
            </footer>
            <!-- // footer end -->

            <!-- Temperature Tower of Love Fruit Start -->
<!--             <div class="box-wing" id="rightWing" style="display:block;"></div> -->
            <!-- Temperature Tower of Love Fruit End -->
        </div>
        <!-- // layout Start -->
    </body>
</html>