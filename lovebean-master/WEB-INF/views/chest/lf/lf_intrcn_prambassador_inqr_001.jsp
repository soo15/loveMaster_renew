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

        selectPrambassadorList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);

    });

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Prambassador 목록 조회 !!
     *===========================================================*/
    function selectPrambassadorList(pageNo){
        gf_send("<c:url value='/lf/intrcn/selectPrambassadorList.do' />", gf_searchParam(pageNo));
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 홍보대사 리스트 조회 Callback Function !!
     *===========================================================*/
     function selectPrambassadorListAfter(data){
        $("#dataGridList").html('');
        $('#dataGridPageNavi').html('');

        var listInfo = data.listInfo;
        var pageInfo = data.pageInfo;

        var listHtml = "";

        for(var i=0; i<listInfo.length; i++){
            var prambssdrSn = listInfo[i].prambssdrSn;
            var prambssdrNm = listInfo[i].prambssdrNm;
            var thumbFileNm = listInfo[i].thumbFileNm;
            var flpth       = listInfo[i].flpth;
            var thumbImg    = '';

            if(thumbFileNm != null && thumbFileNm != ''){
                thumbImg    = flpth + '/' + thumbFileNm;
            }

            listHtml += '<li>';
            listHtml += '    <a href="javascript:;" onClick="javascript:goPrambassadorDetail(this);" data-prambssdr_sn="' + prambssdrSn + '" class="gallery-link">';
            if(thumbImg != ''){
                listHtml += '       <div class="gallery-img"><img src="${genFilePath}' + thumbImg + '" alt="' + prambssdrNm + '"></div>';
            }else{
                listHtml += '       <div class="gallery-img"><img src="/common/img/common/no-img.jpg" alt=""></div>';
            }
            listHtml += '       <p class="gallery-tit"><b>' + prambssdrNm + '</b></p>';
            listHtml += '    </a>';
            listHtml += '</li>';
        }

        $("#dataGridList").html(listHtml);

        if(listInfo.length != 0){
            myGrid.makePageNvai(pageInfo, "selectPrambassadorList");
        }
    }

     /*===========================================================
      * Prambassador 상세페이지로 이동 !!
      *===========================================================*/
     function goPrambassadorDetail(obj){
         var prambssdrSn = $(obj).data("prambssdr_sn");
         var param = gf_searchParam(GV_CURR_PAGE_NO);

         param += "&prambssdrSn=" + prambssdrSn;

         gf_submitMovePage("<c:url value='/lf/intrcn/initPrambassadorDetail.do' />", param);
     }
</script>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">홍보대사</h2>
        <p class="title-sub-txt">당신의 나눔이 모두의 행복입니다. <span class="mobile-block-mini">나눔의 힘을 믿어보세요.</span></p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area" id="searchArea">
        <div class="contents-hd">
            <h3><strong>홍보대사</strong><span>Goodwill Ambassador 스포츠, 음악, 방송 등 각 분야의 대표가 사랑의열매 홍보대사로 활동하고 있습니다.</span></h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box">
            <input type="hidden" id="pBhfCode" name="pBhfCode" value="001">
            <input type="hidden" id="pageCount" name="pageCount" value="12">
            <div class="gallery-list type-person">
                <ul id="dataGridList"></ul>
            </div>
            <!-- Page Navigation Area Start -->
            <div id="dataGridPageNavi" class="paging-area"></div>
            <!-- // Page Navigation Area -->
        </div>
    </div>
</main>
