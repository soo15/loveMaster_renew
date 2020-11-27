<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<style>
.tab-content{
    display:none;
}
</style>
<script type="text/javascript">
    var myGrid = null;
    var BBS_SN       = "<c:out value='${bbsInfo.bbsSn}' />";
    var BBS_NM       = "<c:out value='${bbsInfo.bbsNm}' />";
    var CN_TY        = "<c:out value='${bbsInfo.cnTy}' />";
    var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();

        tabClickEvent(BBS_SN, BBS_NM, CN_TY, false);
        
        $("#btnSearch").off("click").on('click', function(e){
            selectPostList();
        });
        
        $("#pBhfCode").off("change").on('change', function(e){
            // 첫번째 탭으로 이동
            tabClickEvent("${fstTabInfo.bbsSn}", "${fstTabInfo.bbsNm}", "${fstTabInfo.cnTy}", true);
        });
        
        $("#pSj").off("keypress").on("keypress", function(e){
            if(e.keyCode == 13){
                selectPostList();
            }
        });
    });
    
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
            }
       });
    }
    
    function initTab(bbsSn, bbsNm){
        $("#tabTitle").text(bbsNm);
        
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
        var listHtml = "";
        
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
            listHtml += '    <td title="' + registerNm + '" class="th-write">'          + registerNm   + '</td>';
            listHtml += '    <td title="' + rgsde      + '" class="th-day">'            + rgsde        + '</td>';
            listHtml += '    <td title="' + rdcnt      + '" class="th-count">'          + rdcnt        + '</td>';
            listHtml += '</tr>';
        }
        
        var opt = { listHtml  : listHtml              // (필수) List Html
                ,pageFunc  : "selectPostList"       // (필수) Page Link Function = Search Function과 동일
                ,pageInfo  : data.pageInfo            // (필수) Page Information Object
               };

        myGrid.makeList(opt);
    }
    
     /*===========================================================
      * Post 상세페이지로 이동 !!
      *===========================================================*/
     function goPostDetail(obj){
         var listSn = $(obj).data("list_sn");
         var param = gf_searchParam(GV_CURR_PAGE_NO);

         param += "&listSn=" + listSn;

         gf_submitMovePage("/bbs/" + $("#pBbsSn").val()  + "/initPostDetail.do", param);
     }
     
</script>

<div class="sub-visual visual04_02">
    <div class="sub-title-area">
        <h2 class="heading-title-a">안내</h2>
        <p class="title-sub-txt">2depth 설명글 수급 중입니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3>
                <strong id="tabTitle"></strong>
                <span>사랑의열매의 새로운 소식을 알려드립니다.</span>
            </h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box" id="searchArea">
            <div class="page-tab">
                <input type="hidden" id="pBbsSn" name="pBbsSn" value="${paramMap.pBbsSn}">
        <c:if test="${!empty tabList}">
            <c:forEach var="tabList" items="${tabList}" varStatus="status">
                <div class="tab-col">
                    <a href="javascript:;" id="tab${tabList.bbsSn}" onClick="javascript:tabClickEvent('${tabList.bbsSn}', '${tabList.bbsNm}', '${tabList.cnTy}', true);" class="tab-col-item"><i>${tabList.bbsNm}</i></a>
                </div>
            </c:forEach>
        </c:if>                
            </div>
            <div class="tab-content" id="htmlDiv">
            </div>
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
                <div class="tb-type_b not-head">
                    <table id="dataGridList" summary="게시판 목록">
                        <caption>게시판 목록입니다.</caption>
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
    </div>
</main>
