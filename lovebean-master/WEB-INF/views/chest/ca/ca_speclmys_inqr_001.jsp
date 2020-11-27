<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var myGrid = null;
    var TAB          = !gf_isNull("<c:out value='${paramMap.tab}' />") ? "<c:out value='${paramMap.tab}' />" : 1;
    var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();

        $("#btnSearch").off("click").on('click', function(e){
            selectSpeclmysList();
        });

        $("#pMysspecleNm").off("keypress").on("keypress", function(e){
            if(e.keyCode == 13){
                selectSpeclmysList();
            }
        });

        selectSpeclmysList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
    });

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Speclmys 목록 조회 !!
     *===========================================================*/
    function selectSpeclmysList(pageNo){
        gf_send("<c:url value='/ca/speclmys/selectSpeclmysList.do' />", gf_searchParam(pageNo));
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 게시판 리스트 조회 Callback Function !!
     *===========================================================*/
     function selectSpeclmysListAfter(data){
        $("#dataGridList").html('');
        $('#dataGridPageNavi').html('');

        var listInfo = data.listInfo;
        var pageInfo = data.pageInfo;

        var listHtml = "";

        if(listInfo.length == 0){
            listHtml += '<li style="width:100%;text-align:center;"><b>해당 지회의 진행 중인 이벤트가 존재하지 않습니다.</b></li>';
        }else{
            for(var i=0; i<listInfo.length; i++){
                var mysspecleSn     = listInfo[i].mysspecleSn;
                var bhfCode         = listInfo[i].bhfCode;
                var mysspecleNm     = listInfo[i].mysspecleNm;
                var flpth           = listInfo[i].flpth;
                var thumbFileNm     = listInfo[i].thumbFileNm;

                var imgSrc          = "${genFilePath}" + flpth + thumbFileNm;

                listHtml += '<li>';
                listHtml += '    <a href="javascript:;" onClick="javascript:goSpeclmysDetail(this);" data-mysspecle_sn="' + mysspecleSn + '" class="gallery-link">';
                if(thumbFileNm != ''){
                    listHtml += '       <div class="gallery-img"><img src="' + imgSrc + '" alt="' + mysspecleNm + '"></div>';
                }else{
                    listHtml += '       <div class="gallery-img"><img src="/common/img/common/no-img.jpg" alt=""></div>';
                }
                listHtml += '       <p class="gallery-tit"><b>' + mysspecleNm + '</b></p>';
                listHtml += '    </a>';
                listHtml += '</li>';
            }
        }

        $("#dataGridList").html(listHtml);

        if(listInfo.length != 0){
            myGrid.makePageNvai(pageInfo, "selectSpeclmysList");
        }
    }

     /*===========================================================
      * Speclmys 상세페이지로 이동 !!
      *===========================================================*/
     function goSpeclmysDetail(obj){
         var mysspecleSn = $(obj).data("mysspecle_sn");
         var param = gf_searchParam(GV_CURR_PAGE_NO);

         param += "&mysspecleSn=" + mysspecleSn;

         gf_submitMovePage("<c:url value='/ca/speclmys/initSpeclmysDetail.do' />", param);
     }

</script>

<div class="sub-visual visual00_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">특별모금</h2>
        <p class="title-sub-txt">사랑의 열매는 연중 다양한 주제로 모금을 진행하고 있습니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="seo-box" id="searchArea">
            <input type="hidden" id="pageCount" name="pageCount" value="8">
            <input type="hidden" id="pBhfCode" name="pBhfCode" value="<c:out value="${__branchCd}"  escapeXml="false" />">
            <div class="campaign-contents">

                <div class="gallery-list">
                    <ul id="dataGridList"></ul>
                </div>

                <!-- Page Navigation Area Start -->
                <div id="dataGridPageNavi" class="paging-area"></div>
                <!-- // Page Navigation Area -->

                <div class="bbs-search">
                    <div class="search-area">
                        <div class="search-col int">
                            <input type="text" class="inp-base ui-inpcancel" id="pMysspecleNm" name="pMysspecleNm" value="${paramMap.pMysspecleNm }" title="검색어 입력">
                        </div>
                        <div class="search-col btns"><button type="button" class="btn-base-imp" id="btnSearch">검색</button></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
