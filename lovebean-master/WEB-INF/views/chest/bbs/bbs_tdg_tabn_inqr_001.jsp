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
        
        selectPostList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
        
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
        $("#dataGridList").html('');
        $('#dataGridPageNavi').html('');
         
        var listInfo = data.listInfo;
        var pageInfo = data.pageInfo;
    
        var listHtml = "";
        
        if(listInfo.length == 0){
            listHtml += '<div style="margin-bottom:20px;text-align:center;"><b>No data available in table</b><div>';
        }else{
            for(var i=0; i<listInfo.length; i++){
                var listSn  = listInfo[i].listSn;
                var sj      = listInfo[i].sj;
                var serverFileNm= listInfo[i].serverFileNm;
                var fileExtsn   = listInfo[i].fileExtsn;
                var flpth       = listInfo[i].flpth;
                var thumbImg    = '';
                
                if(serverFileNm != null && serverFileNm != ''){
                    thumbImg    = flpth + '/' + serverFileNm + '_thumb.' + fileExtsn;
                }
                
                listHtml += '<li>';
                listHtml += '    <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-list_sn="' + listSn + '" class="gallery-link">';
                if(thumbImg != ''){
                    listHtml += '       <div class="gallery-img"><img src="${genFilePath}' + thumbImg + '" alt="' + sj + '"></div>';
                }else{
                    listHtml += '       <div class="gallery-img"><img src="/common/img/common/no-img.jpg" alt=""></div>';
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
            <h3><strong>나눔과 변화 스토리</strong><span>사랑의열매 지원활동을 안내합니다.</span></h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box" id="searchArea">
            <input type="hidden" id="pBbsSn" name="pBbsSn" value="${bbsInfo.bbsSn}">
            <input type="hidden" id="pageCount" name="pageCount" value="${bbsInfo.listCnt }">
            <div class="sort-area">
                <div class="sort-area-item">
                    <div class="ui-select">
                        <select id="pBhfCode" name="pBhfCode" title="지회코드">
                            <c:out value="${pBhfCode}" escapeXml="false" />
                        </select>
                    </div>
                </div>
            </div>
            <div class="gallery-list">
                <ul id="dataGridList"></ul>
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
