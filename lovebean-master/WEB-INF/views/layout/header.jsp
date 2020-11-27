<%--
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : header.jsp
 * Author      : Chest Front
 * Date        : 2019. 8. 1.
 * Description : [ Layout ] header Page
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

<script type="text/javascript">
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){

        /*===========================================================
         * Button Click Event
         *===========================================================*/
        $(document).on("click", "#btnPcSearch, #btnMobileSearch, #btnResult", function(e){
            e.preventDefault();

            var id = $(this).attr("id");
            if( id == "btnPcSearch" || id == "btnMobileSearch" ) {
                $plugins.uiModal({
                    id:'modalSearch',
                    openback: function() { console.log('open callback'); },
                    closeback: function(v) { $("#modalSearch").attr('aria-hidden', true); }
                });
            } else if (id == "btnResult"){

                var _val = $("#searchKeyword").val().replace(/(^\s*)|(\s*$)/g, "");

                if (gf_isNull(_val)) {
                    alert("검색 키워드를 입력 해주세요.");
                    return false;
                }

                var _valArr = _val.split(' ');
                for(var i=0; i< _valArr.length; i++) {
                    if (_valArr[i].length < 2) {
                        alert("각단어의 검색 키워드를 두글자 이상 해주세요.");
                        return false;
                    }
                }

                var param = "keyword=" +_val+"&pMenuId=99_99_99";
                gf_submitMovePage("/sr/search/initSearchresult.do", param);
            }
        });

        $("#searchKeyword").keyup(function(e) {
            if (e.which == 13) {
                $("#btnPcSearch,#btnMobileSearch,#btnResult").trigger("click");
                $(this).blur();
                return false;
            }
        });

        //지역모금회 선택처리
        if(!gf_isNull($.cookie('__branchCd')) && $.cookie('__branchCd') != "001") {
        	$(".nav-util-box input[id='linkBranchCd'][value="+$.cookie('__branchCd')+"]").parent().css("background","#cb0802");        	
        }
        
    });

    function chestMainClickEvent(){
        // Cookie Value Initialize !!
        $.cookie("__menuId",   null);
        $.cookie("__menuType", null);

        gf_submitMovePage("/base.do", "");
    }



    /*===========================================================
     * Header Menu Click Event : Page Link !!
     *===========================================================*/
    function headerMenuClickEvent(menuUrl, menuId, menuType){
        if(gf_isNull(menuUrl)){
            return false;
        }

        // Cookie Value Initialize !!
        $.cookie("__menuId",   menuId);
        $.cookie("__menuType", menuType);


        var param = "pLinkSepCd=menuLink&bhfCode="+$.cookie("__branchCd");

        var _url = menuUrl;

        if(_url.indexOf('?') > -1) {
            _url = menuUrl.substring(0, menuUrl.indexOf('?'));
            param += "&"+ menuUrl.substring(menuUrl.indexOf('?')+1);
        }

        gf_submitMovePage(_url, param);

        //gf_submitMovePage(menuUrl, "pLinkSepCd=menuLink");
    }

    function chestSitemap() {
        var param = "pMenuId=99_99_99";
        gf_submitMovePage("/sr/sitemap.do", param);
    }

    /*===========================================================
     * Header Branch Click Event : Page Link !!
     *===========================================================*/
    function branchClickEvent(obj){
        var parentObj = $(obj).parent();

        var branchCd  = $("#linkBranchCd",  parentObj).val();
        var branchId  = $("#linkBranchId",  parentObj).val();
        var branchNm  = $("#linkBranchNm",  parentObj).val();
        var branchUrl = $("#linkBranchUrl", parentObj).val();

        if(gf_isNull(branchUrl)){
            return false;
        }

        // Cookie Value Initialize !!
        $.cookie("__branchCd",  branchCd);
        $.cookie("__branchId",  branchId);
        $.cookie("__branchNm",  branchNm);
        $.cookie("__branchUrl", branchUrl);
        $.cookie("__menuId",    null);
        $.cookie("__menuType",  null);

        var protocol = window.location.protocol;    // ex: http:
        var hostname = window.location.hostname;    // ex) localhost
        var host     = window.location.host;        // ex) localhost:8080

        if(hostname == "localhost" || hostname == "192.168.24.68") {
            gf_submitMovePage(protocol + "//" + host + "/", "");
        } else {!
            gf_submitMovePage(branchUrl, "");
        }
    }
</script>

<div class="base-header-wrap">
    <h1 class="logo">
        <a href="javascript:;" OnClick="chestMainClickEvent();">
        
        <c:choose>
            <c:when test="${__branchCd eq '001'}"><img src="/common/img/common/logo.png" srcset="/common/img/common/logo@2x.png 2x, /common/img/common/logo@3x.png 3x" alt="사랑의 열매" ></c:when>
            <c:when test="${__branchCd eq '002'}"><img src="/common/img/common/logo.png" alt="사랑의 열매" ></c:when>
            <c:otherwise><img src="/common/img/common/logo.png" srcset="/common/img/common/logo@2x.png 2x, /common/img/common/logo@3x.png 3x" alt="사랑의 열매" ></c:otherwise>
        </c:choose>
        </a>
    </h1>
    <!-- desktop -->
    <div class="header-desktop">
        <div class="nav-util">
            <button type="button" class="ui-drop" id="uiNavUtil1">지역모금회<i class="sprite-header_blt"></i></button>
            <div class="ui-drop-pnl" data-id="uiNavUtil1">
                <div class="nav-util-box">
                    <ul>
                        <c:if test="${!empty __branchList}">
                            <c:forEach var="branchList" begin="0" end="17" items="${__branchList}" varStatus="status">
                                <li><a href="javascript:;" OnClick="branchClickEvent(this);" title="<c:out value="${branchList.branchNm}" escapeXml="false" /> 열기"><c:out value="${branchList.branchNm}" escapeXml="false" /></a>
                                    <input id="linkBranchCd"  name="linkBranchCd"  type="hidden" value="<c:out value="${branchList.branchCd}" escapeXml="false" />" />
                                    <input id="linkBranchId"  name="linkBranchId"  type="hidden" value="<c:out value="${branchList.branchId}" escapeXml="false" />" />
                                    <input id="linkBranchNm"  name="linkBranchNm"  type="hidden" value="<c:out value="${branchList.branchNm}" escapeXml="false" />" />
                                    <input id="linkBranchUrl" name="linkBranchUrl" type="hidden" value="<c:out value="${branchList.branchUrl}" escapeXml="false" />" />
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>

            <span>|</span>
            <a href="javascript:;" OnClick="chestSitemap();">사이트맵</a>
            <span>|</span>

            <button type="button" class="ui-drop" id="uiNavUtil2">Language<i class="sprite-header_blt"></i></button>
            <div class="ui-drop-pnl" data-id="uiNavUtil2">
                <div class="nav-util-box">
                    <ul>
                        <c:if test="${!empty __langList}">
                            <c:forEach var="langList" items="${__langList}" varStatus="status">
                                <li><a href="<c:out value="${langList.langUrl}" escapeXml="false" />" title="<c:out value="${langList.langNm}" escapeXml="false" />"><c:out value="${langList.langNm}" escapeXml="false" /></a></li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <span>|</span>
            <button type="button" class="btn-sh-open" id="btnPcSearch">검색<i class="sprite-header_sh"></i></button>

        </div>
        <nav class="nav-main" id="baseNav">
            <ul class="nav-main-wrap"></ul>
            <div class="nav-special">
                 <a href="/ca/speclmys/initCovid.do" class="btn-covid"><span class="ir_su">코로나19</span></a>
               <a href="/fr/mycntr/initCntrdtlsinqire.do" class="btn-base">나의 기부</a>
                <a href="/ct/fdrmcntr/initEvemthcntr.do" class="btn-base-imp">기부하기</a>
            </div>
        </nav>
    </div>

    <!-- mobile -->
    <div class="header-mobile">
        <div class="btn-util">
            <button type="button">
                <img src="/common/img/common/btn_srch_m.png" srcset="/common/img/common/btn_srch_m@2x.png 2x, /common/img/common/btn_srch_m@3x.png 3x" id="btnMobileSearch" alt="검색" >
            </button>
            <button type="button" class="ui-menu">
                <img src="/common/img/common/menu.png" srcset="/common/img/common/menu@2x.png 2x, /common/img/common/menu@3x.png 3x" alt="전체메뉴" >
            </button>
        </div>
        <div class="menu-wrap" id="">
            <button type="button" class="btn-close"><span class="hide">닫기</span></button>
            <div class="menu-sec-1">
                <button type="button" class="ui-drop" id="uiNavUtil1_m">
                    <span>지역모금회</span>
                    <i class="sprite-header_blt"></i>
                </button>
                <div class="ui-drop-pnl" data-id="uiNavUtil1_m">
                    <div class="nav-util-box">
                        <ul>

                        <c:if test="${!empty __branchList}">
                            <c:forEach var="branchList" begin="0" end="17" items="${__branchList}" varStatus="status">
                                <li><a href="javascript:;" OnClick="branchClickEvent(this);" title="<c:out value="${branchList.branchNm}" escapeXml="false" /> 열기"><c:out value="${branchList.branchNm}" escapeXml="false" /></a>
                                    <input id="linkBranchCd"  name="linkBranchCd"  type="hidden" value="<c:out value="${branchList.branchCd}" escapeXml="false" />" />
                                    <input id="linkBranchId"  name="linkBranchId"  type="hidden" value="<c:out value="${branchList.branchId}" escapeXml="false" />" />
                                    <input id="linkBranchNm"  name="linkBranchNm"  type="hidden" value="<c:out value="${branchList.branchNm}" escapeXml="false" />" />
                                    <input id="linkBranchUrl" name="linkBranchUrl" type="hidden" value="<c:out value="${branchList.branchUrl}" escapeXml="false" />" />
                                </li>
                            </c:forEach>
                        </c:if>
                        </ul>
                    </div>
                </div>
                <button type="button" class="ui-drop" id="uiNavUtil2_m">
                    <span>KOR</span>
                    <i class="sprite-header_blt"></i>
                </button>
                <div class="ui-drop-pnl" data-id="uiNavUtil2_m">
                    <div class="nav-util-box">
                        <ul>
                            <c:if test="${!empty __langList}">
                                <c:forEach var="langList" items="${__langList}" varStatus="status">
                                    <li><a href="<c:out value="${langList.langUrl}" escapeXml="false" />" title="<c:out value="${langList.langNm}" escapeXml="false" />"><c:out value="${langList.langNm}" escapeXml="false" /></a></li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="menu-sec-2">
                <a href="/fr/mycntr/initCntrdtlsinqire.do" class="btn-base">나의 기부</a>
                <a href="/ct/fdrmcntr/initEvemthcntr.do" class="btn-base-imp">기부하기</a>
            </div>
            <nav class="nav-mobile" id="baseNav2">
                <ul class="ui-acco" role="group" id="AccoNavDepth1"></ul>
				<div style="margin:20px;"> 
				  <a href="/ca/speclmys/initCovid.do" class="btn-covid"><span class="ir_su">코로나19</span></a>
				</div>
            </nav>
            <div class="mobile-sns">
                <ul class="mobile-sns-area">
                    <li class="mobile-sns-item"><a href="https://www.youtube.com/channel/UCJCLW5U-CQXMvLrXDoiaw0g?view_as=subscriber" title="새 창 열림" target="_blank"><i class="sprite-footer_sns2">유튜브</i></a></li>
                    <li class="mobile-sns-item"><a href="javascript:snsMoveEvent('SNS_BG');" title="새 창 열림" ><i class="sprite-footer_sns3" target="_blank">블로그</i></a></li>
                    <li class="mobile-sns-item"><a href="javascript:snsMoveEvent('SNS_PB');" title="새 창 열림" ><i class="sprite-footer_sns1">페이스북</i></a></li>
                    <li class="mobile-sns-item"><a href="javascript:snsMoveEvent('SNS_IS');" title="새 창 열림" ><i class="sprite-footer_sns4" target="_blank">인스타그램</i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="dim-nav"></div>