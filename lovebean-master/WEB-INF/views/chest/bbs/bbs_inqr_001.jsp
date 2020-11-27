<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<style>
.tab-content{
    display:none;
}
</style>
<script type="text/javascript">
    var myGrid = null;
    var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";
    var BBS_NM       = "<c:out value='${bbsInfo.bbsNm}' />";

<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
    var BBS_SN       = "<c:out value='${bbsInfo.bbsSn}' />";
    var CN_TY        = "<c:out value='${bbsInfo.cnTy}' />";
    </c:when>
</c:choose>

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();

        $("#tabTitle").text(BBS_NM);
        $("#tabTitleTable").text(BBS_NM + " 목록입니다.");
<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
        tabClickEvent(BBS_SN, BBS_NM, CN_TY, false);

        $("#pBhfCode").off("change").on('change', function(e){
            // 첫번째 탭으로 이동
            tabClickEvent("${fstTabInfo.bbsSn}", "${fstTabInfo.bbsNm}", "${fstTabInfo.cnTy}", true);
        });
    </c:when>
    <c:otherwise>
        comboChangekEvent(false);

        $("#pBhfCode").off("change").on('change', function(e){
            comboChangekEvent(true);
        });
    </c:otherwise>
</c:choose>

        $("#btnSearch").off("click").on('click', function(e){
            selectPostList();
        });

        $("#pSj").off("keypress").on("keypress", function(e){
            if(e.keyCode == 13){
                selectPostList();
            }
        });
    });

<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
    /*===========================================================
     * CN_TY 에 따른 초기화 !!
     *===========================================================*/
    function initContentDiv(cnTy, bbsSn){
        $("div.tab-content").hide();
        if(cnTy == "D"){
            $("#gridDiv").show();
        }else{
            getHtmlContent(bbsSn);
        }
    }

    function getHtmlContent(bbsSn){
        // 초기화
        $("#htmlDiv").html('');

        $.ajax({
            url:'/contentHtml/' + bbsSn + '.html',
            dataType:'html',
            type:'GET',
            async: false, // true: 비동기, false: 동기
            beforeSend : function(request){
                request.setRequestHeader('AJAX', 'true'); // ajax 호출을  header에 기록
            },
            complete : function(request){console.log("Success loading html...")},
            error: function(data, status, err) {
                console.log('status ::: ' + status + ', err ::: ' + err);
            },
            success:function(result, status) {
               	$("#htmlDiv").html(result);
               	$("#htmlDiv").show();
				$('div[id*=div]').hide();
				$("#div" + "${branchCd}").show();
            }
       });
    }

    function initTab(bbsSn, bbsNm){
        $("#tabTitle").text(bbsNm);
        $("#tabTitleTable").text(bbsNm + " 목록입니다.");

        $.each($('.page-tab div.tab-col a'), function(){
            $(this).removeClass("active");
        });

        $.each($('.page-tab div.tab-col a'), function(){
            if("tab" + bbsSn == $(this).prop("id")){
                $(this).addClass("active");
            }
        });

        $("#pBbsSn").val(bbsSn);
    }

    /*===========================================================
     * Tab Click 페이지 이동 !!
     *===========================================================*/
    function tabClickEvent(bbsSn, bbsNm, cnTy, flag){
        initContentDiv(cnTy, bbsSn);

        initTab(bbsSn, bbsNm);

        if(flag){
            initParam();
        }

        selectPostList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
    }
    </c:when>
    <c:otherwise>
    /*===========================================================
     * Combo Change 페이지 이동 !!
     *===========================================================*/
    function comboChangekEvent(flag){
        if(flag){
            initParam();
        }

        selectPostList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
    }
    </c:otherwise>
</c:choose>


    /*===========================================================
     * parameter init
     *===========================================================*/
     function initParam(){
         CURR_PAGE_NO = 1;
         $("#pSj").val("");
    }

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Post 목록 조회 !!
     *===========================================================*/
    function selectPostList(pageNo){
        gf_send("/bbs/selectPostList.do", gf_searchParam(pageNo));
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 게시판 리스트 조회 Callback Function !!
     *===========================================================*/
     function selectPostListAfter(data){
        var listInfo = data.listInfo;
        var pageInfo = data.pageInfo;

        var listHtml = "";

<c:choose>
    <c:when test="${bbsInfo.tmplatTy eq 'TDB'}">
        for(var i=0; i<listInfo.length; i++){
            var no         = listInfo[i].no;
            var listSn     = listInfo[i].listSn;
            var bbsNm      = listInfo[i].bbsNm;
            var sj         = listInfo[i].sj;
            var registerNm = listInfo[i].registerNm;
            var rgsde      = listInfo[i].rgsde;
            var rdcnt      = listInfo[i].rdcnt;

            listHtml += '<tr>';
            listHtml += '    <td title="' + no         + '" class="th-number">'         + no           + '</td>';
            listHtml += '    <td title="' + bbsNm      + '" class="th-type">'           + bbsNm        + '</td>';
            listHtml += '    <td title="' + sj         + '" class="th-title txt-left">';
            listHtml += '      <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-list_sn="' + listSn + '">' + sj + '</a>';
            listHtml += '    </td>';
//             listHtml += '    <td title="' + registerNm + '" class="th-write">'          + registerNm   + '</td>';
            listHtml += '    <td title="' + registerNm + '" class="th-write">모금회</td>'; // 작성자 모금회로 통일 20191119
            listHtml += '    <td title="' + rgsde      + '" class="th-day">'            + rgsde        + '</td>';
            listHtml += '    <td title="' + rdcnt      + '" class="th-count">'          + rdcnt        + '</td>';
            listHtml += '</tr>';
        }

        var opt = { listHtml  : listHtml              // (필수) List Html
                ,pageFunc  : "selectPostList"       // (필수) Page Link Function = Search Function과 동일
                ,pageInfo  : pageInfo            // (필수) Page Information Object
               };

        myGrid.makeList(opt);
    </c:when>
    <c:otherwise>
        $("#galleryList").removeClass();        // 모든 class 삭제
        var nttAtrb  = "${bbsInfo.nttAtrb}";    // 갤러리형 게시판 타입 (가로형-001, 세로형-002)
        var divClass = "";

        if(nttAtrb == "001"){
            $("#galleryList").addClass("gallery-list type-vod");
            divClass = "gallery-img";
        }else if(nttAtrb == "002"){
            $("#galleryList").addClass("gallery-list type-press");
            divClass = "press-img";
        }

        $("#dataGridList").html('');
        $('#dataGridPageNavi').html('');

        if(listInfo.length == 0){
            listHtml += '<div style="margin-bottom:20px;text-align:center;"><b>No data available in table</b><div>';
        }else{
            for(var i=0; i<listInfo.length; i++){
                var listSn  = listInfo[i].listSn;
                var sj      = listInfo[i].sj;
                var serverFileNm= listInfo[i].serverFileNm;
                var fileExtsn   = listInfo[i].fileExtsn;
                var flpth       = listInfo[i].flpth;
                var thumbFileNm = listInfo[i].thumbFileNm;
                var thumbImg    = '';

                if(!gf_isNull(thumbFileNm)){
                    thumbImg    = flpth + thumbFileNm;
                }

                listHtml += '<li>';
                listHtml += '    <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-list_sn="' + listSn + '" class="gallery-link">';
                if(thumbImg != ''){
                    listHtml += '       <div class="' + divClass + '"><img src="${genFilePath}' + thumbImg + '" alt="' + sj + '"></div>';
                }else{
                    listHtml += '       <div class="' + divClass + '"><img src="/common/img/common/no-img.jpg" alt=""></div>';
                }
                listHtml += '       <p class="gallery-tit"><b>' + sj + '</b></p>';
                listHtml += '    </a>';
                listHtml += '</li>';
            }
        }

        $("#dataGridList").html(listHtml);

        if(listInfo.length != 0){
            myGrid.makePageNvai(pageInfo, "selectPostList");
        }
    </c:otherwise>
</c:choose>
    }

    /*===========================================================
     * Post 상세페이지로 이동 !!
     *===========================================================*/
    function goPostDetail(obj){
        var listSn = $(obj).data("list_sn");
        var param = gf_searchParam(GV_CURR_PAGE_NO);

        param += "&listSn=" + listSn;
<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
        gf_submitMovePage("/bbs/" + $("#pBbsSn").val()  + "/initPostDetail.do", param);
    </c:when>
    <c:otherwise>
        gf_submitMovePage("/bbs/${bbsInfo.bbsSn}/initPostDetail.do", param);
    </c:otherwise>
</c:choose>
     }

</script>

<!-- menu 에 따라 바뀌는 처리 -->
<c:set var="subVisual"></c:set>
<c:set var="headingTitle"></c:set>
<c:set var="subTitle"></c:set>
<c:choose>
    <c:when test="${bbsInfo.bbsSn eq '1004' or bbsInfo.bbsSn eq '1009' or bbsInfo.bbsSn eq '1023'}">
        <c:set var="subVisual">visual02_01</c:set>
        <c:set var="headingTitle">지원사업</c:set>
        <c:set var="subTitle">소중한 성금이 꼭 필요한 곳에 사용되도록 최선을 다하고 있습니다</c:set>
    </c:when>
    <c:when test="${bbsInfo.bbsSn eq '1005' or bbsInfo.bbsSn eq '1018'}">
        <c:set var="subVisual">visual03_01</c:set>
        <c:set var="headingTitle">나눔문화 활성화</c:set>
        <c:set var="subTitle">나눔문화 활성화를 위해 다양한 사업을 진행하고 있습니다</c:set>
    </c:when>
    <c:when test="${bbsInfo.bbsSn eq '1019' or bbsInfo.bbsSn eq '1020'}">
        <c:set var="subVisual">visual00_04</c:set>
        <c:set var="headingTitle">나눔캠페인</c:set>
        <c:set var="subTitle">나눔문화 활성화를 위한 다양한 캠페인을 진행합니다.</c:set>
    </c:when>
    <c:when test="${bbsInfo.bbsSn eq '1006' or bbsInfo.bbsSn eq '1007' or bbsInfo.bbsSn eq '1008'
        or bbsInfo.bbsSn eq '1010' or bbsInfo.bbsSn eq '1011' or bbsInfo.bbsSn eq '1012' or bbsInfo.bbsSn eq '1013' or bbsInfo.bbsSn eq '1014' or bbsInfo.bbsSn eq '1015' or bbsInfo.bbsSn eq '1016' or bbsInfo.bbsSn eq '1017'}">
        <c:set var="subVisual">visual04_01</c:set>
        <c:set var="headingTitle">소개</c:set>
        <c:set var="subTitle">사랑의열매는 이웃사랑의 상징입니다</c:set>
    </c:when>
    <c:when test="${bbsInfo.bbsSn eq '1000' or bbsInfo.bbsSn eq '1001' or bbsInfo.bbsSn eq '1002' or bbsInfo.bbsSn eq '1003'}">
        <c:set var="subVisual">visual04_02</c:set>
        <c:set var="headingTitle">안내</c:set>
        <c:set var="subTitle">사랑의열매는 이웃사랑의 상징입니다</c:set>
    </c:when>
    <c:when test="${bbsInfo.bbsSn eq '1024'}">
        <c:set var="subVisual">visual04_03</c:set>
        <c:set var="headingTitle">신뢰와 투명성</c:set>
        <c:set var="subTitle">사랑의열매는 소중한 성금을 투명하고 공정하게 집행하고 있습니다.</c:set>
    </c:when>
</c:choose>

<div class="sub-visual ${subVisual }">
    <div class="sub-title-area">
        <h2 class="heading-title-a">${headingTitle }</h2>
        <p class="title-sub-txt">${subTitle }</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3>
                <strong id="tabTitle"></strong>
<c:choose>
    <c:when test="${bbsInfo.bbsSn eq '1024'}">
                <span>투명성을 위해 더욱 노력하겠습니다.</span>
    </c:when>
    <c:otherwise>
                <span>사랑의열매의 새로운 소식을 알려드립니다.</span>
    </c:otherwise>
</c:choose>
            </h3>
            <div class="contents-menu-nav"></div>
        </div>
<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
        <!-- 탭 있음 -->
        <div class="seo-box" id="searchArea">
            <input type="hidden" id="pBbsSn" name="pBbsSn" value="${paramMap.pBbsSn}">
            <input type="hidden" id="pageCount" name="pageCount" value="${bbsInfo.listCnt }">
            <div class="page-tab">
<c:choose>
    <c:when test="${bbsInfo.bbsSn eq '1024' and __branchCd ne '001'}">
                
    </c:when>
    <c:otherwise>
        <c:if test="${!empty tabList}">
            <c:forEach var="tabList" items="${tabList}" varStatus="status">
                <div class="tab-col">
                    <a href="javascript:;" id="tab${tabList.bbsSn}" onClick="javascript:tabClickEvent('${tabList.bbsSn}', '${tabList.bbsNm}', '${tabList.cnTy}', true);" class="tab-col-item">
                        <i>${tabList.bbsNm}</i>
                    </a>
                </div>
            </c:forEach>
        </c:if>
    </c:otherwise>
</c:choose>
            </div>
            
            <!-- html page -->
            <div class="tab-content" id="htmlDiv"></div>
            
            <div class="tab-content" id="gridDiv">
                <div class="sort-area">
                    <div class="sort-area-item">
                        <div class="ui-select">
                            <select id="pBhfCode" name="pBhfCode" title="지회코드">
                                <c:out value="${pBhfCode}" escapeXml="false" />
                            </select>
                        </div>
                    </div>
                </div>
        <c:choose>
            <c:when test="${bbsInfo.tmplatTy eq 'TDB'}">
                <div class="tb-type_b not-head">
                    <table id="dataGridList">
                        <caption>
                            <p id="tabTitleTable"> 게시물입니다.</p>
                        </caption>
                        <colgroup>
                            <col style="width:9.3%">
                            <col style="width:11%">
                            <col style="width:auto">
                            <col style="width:11%">
                            <col style="width:11%">
                            <col style="width:9.3%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">구분</th>
                            <th scope="col">제목</th>
                            <th scope="col">등록자</th>
                            <th scope="col">등록일</th>
                            <th scope="col">조회수</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </c:when>
            <c:when test="${bbsInfo.tmplatTy eq 'TDG'}">
                <div id="galleryList">
                    <ul id="dataGridList"></ul>
                </div>
            </c:when>
        </c:choose>
                <!-- Page Navigation Area Start -->
                <div id="dataGridPageNavi" class="paging-area"></div>
                <!-- // Page Navigation Area -->

                <div class="bbs-search">
                    <div class="search-area">
                        <div class="search-col int">
                            <input type="text" class="inp-base ui-inpcancel" id="pSj" name="pSj" value="${paramMap.pSj }" title="검색어 입력">
                        </div>
                        <div class="search-col btns"><button type="button" class="btn-base-imp" id="btnSearch">검색</button></div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <!-- 탭 없음 -->
        <div class="seo-box" id="searchArea">
            <input type="hidden" id="pBbsSn" name="pBbsSn" value="${bbsInfo.bbsSn}">
            <input type="hidden" id="pageCount" name="pageCount" value="${bbsInfo.listCnt }">
        <c:if test="${bbsInfo.bbsSn ne '1009'}">
            <div class="sort-area">
                <div class="sort-area-item">
                    <div class="ui-select">
                        <select id="pBhfCode" name="pBhfCode" title="지회코드">
                            <c:out value="${pBhfCode}" escapeXml="false" />
                        </select>
                    </div>
                </div>
            </div>
        </c:if>
        <c:choose>
            <c:when test="${bbsInfo.tmplatTy eq 'TDB'}">
            <div class="tb-type_b not-head">
                <table id="dataGridList">
                    <caption>
                        <p id="tabTitleTable"> 게시물입니다.</p>
                    </caption>
                    <colgroup>
                        <col style="width:9.3%">
                        <col style="width:11%">
                        <col style="width:auto">
                        <col style="width:11%">
                        <col style="width:11%">
                        <col style="width:9.3%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">구분</th>
                        <th scope="col">제목</th>
                        <th scope="col">등록자</th>
                        <th scope="col">등록일</th>
                        <th scope="col">조회수</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            </c:when>
            <c:when test="${bbsInfo.tmplatTy eq 'TDG'}">
                <div id="galleryList">
                    <ul id="dataGridList"></ul>
                </div>
            </c:when>
        </c:choose>
            <!-- Page Navigation Area Start -->
            <div id="dataGridPageNavi" class="paging-area"></div>
            <!-- // Page Navigation Area -->

            <div class="bbs-search">
                <div class="search-area">
                    <div class="search-col int">
                        <input type="text" class="inp-base ui-inpcancel" id="pSj" name="pSj" value="${paramMap.pSj }" title="검색어 입력">
                    </div>
                    <div class="search-col btns"><button type="button" class="btn-base-imp" id="btnSearch">검색</button></div>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
    </div>
</main>
