<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var myGrid = null;
    var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();
        
        comboChangekEvent(false);
        
        $("#btnSearch").off("click").on('click', function(e){
            selectPostList();
        });
        
        $("#pBhfCode").off("change").on('change', function(e){
            comboChangekEvent(true);
        });
        
        $("#pSj").off("keypress").on("keypress", function(e){
            if(e.keyCode == 13){
                selectPostList();
            }
        });
    });
    
    /*===========================================================
     * Combo Change 페이지 이동 !!
     *===========================================================*/
    function comboChangekEvent(flag){
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
     * Post 리스트 조회 Callback Function !!
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
                ,pageFunc  : "selectPostList"         // (필수) Page Link Function = Search Function과 동일
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

         gf_submitMovePage("/bbs/${bbsInfo.bbsSn}/initPostDetail.do", param);
     }
</script>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">지원사업</h2>
        <p class="title-sub-txt">2depth 설명글 수급 중입니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>지원안내</strong><span>사랑의열매 지원활동을 안내합니다.</span></h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box" id="searchArea">
            <input type="hidden" id="pBbsSn" name="pBbsSn" value="${bbsInfo.bbsSn}">
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
</main>
