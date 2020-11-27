<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var myGrid = null;
    var CURR_PAGE_NO = "<c:out value="${paramMap.currPageNo}" />";
    var ORDER        = "<c:out value="${paramMap.pOrder}" />";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();

<c:choose>
    <c:when test="${pEndAt eq 'P'}">
        orderTabClickEvent(ORDER);
    </c:when>
    <c:when test="${pEndAt eq 'E'}">
        selectCrwdfundList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
    </c:when>
</c:choose>

    });

    <c:if test="${pEndAt eq 'P'}">

    function initTab(order){
        order = !gf_isNull(order) ? order : 'N';

        $.each($('.sort-tab button.button_sort'), function(){
            $(this).removeClass("active");
        });

        $.each($('.sort-tab button.button_sort'), function(){
            if("tab" + order == $(this).prop("id")){
                $(this).addClass("active");
            }
        });

        $("#pOrder").val(order);
    }

    /*===========================================================
     * Tab Click 페이지 이동 !!
     *===========================================================*/
    function orderTabClickEvent(order){
        initTab(order);

        selectCrwdfundList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
    }

    </c:if>
     /*************************************************************
      * Ajax Send Event Function !!
      *************************************************************/
     /*===========================================================
      * 클라우드 펀딩 게시물 목록 조회 !!
      *===========================================================*/
    function selectCrwdfundList(pageNo){
        gf_send("/ca/crwdfund/selectCrwdfundList.do", gf_searchParam(pageNo));
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 클라우드 펀딩 게시물 리스트 조회 Callback Function !!
     *===========================================================*/
     function selectCrwdfundListAfter(data){
         $("#dataGridList").html('');
         $('#dataGridPageNavi').html('');

         var listInfo = data.listInfo;
         var pageInfo = data.pageInfo;

         var listHtml = "";

         if(listInfo.length == 0){
             listHtml += '<div style="margin-bottom:20px;text-align:center;"><b>등록된 펀딩이 없습니다.</b><div>';
         }else{

             for(var i=0; i<listInfo.length; i++){
                 var propseSn       = listInfo[i].propseSn;
                 var bsnsSj         = listInfo[i].bsnsSj;
                 var cntrAmountSum  = !gf_isNull(listInfo[i].cntrAmountSum) ? listInfo[i].cntrAmountSum : 0;
                 var cntrAmountCnt  = !gf_isNull(listInfo[i].cntrAmountCnt) ? listInfo[i].cntrAmountCnt : 0;
                 var goalAmount     = !gf_isNull(listInfo[i].goalAmount) ? listInfo[i].goalAmount : 0;

                 var fundRate       = gf_round((cntrAmountSum / goalAmount * 100), 0) + '%';

                 var thumbFileNm = listInfo[i].thumbFileNm;
                 var flpth       = listInfo[i].flpth;
                 var thumbImg    = '';

                 if(!gf_isNull(thumbFileNm)){
                     thumbImg    = '${genFilePath}' + flpth + thumbFileNm;
                 }

                 listHtml += '<li class="funding-item">';
                 listHtml += '  <a href="javascript:;" class="link-funding" onClick="javascript:goCrwdfundDetail(this);" data-propse_sn="' + propseSn + '">';
                 if(thumbImg != ''){
                     listHtml += '   <div class="funding-img"><img src="' + thumbImg + '" alt="' + bsnsSj + '"></div>';
                 }else{
                     listHtml += '   <div class="funding-img"><img src="/common/img/main/@img.png" alt=""></div>';
                 }
                 listHtml += '       <div class="funding-info">';
                 listHtml += '          <p class="funding-title">' + bsnsSj + '</p>';
                 listHtml += '          <div class="donate-point">';
                 listHtml += '              <strong class="percent">' + fundRate + '</strong>';
                 listHtml += '              <div class="bar-wrap">';
                 listHtml += '                  <div class="bar" style="height:4px; width:' + fundRate + '"></div>';
                 listHtml += '              </div>';
                 listHtml += '              <div class="fl-wrap">';
                 listHtml += '                  <div class="fl-item-l">';
                 listHtml += '                      <b>' + gf_comma(cntrAmountSum) + ' 원</b> 기부<b>( ' + gf_comma(cntrAmountCnt) + ' 명 )</b>';
                 listHtml += '                  </div>';
                 listHtml += '                  <div class="fl-item-r">' + gf_comma(goalAmount) + ' 원 목표</div>';
                 listHtml += '              </div>';
                 listHtml += '          </div>';
                 listHtml += '      </div>';
                 listHtml += '    </a>';
                 listHtml += '</li>';
             }
         }

         $("#dataGridList").html(listHtml);

         if(listInfo.length != 0){
             myGrid.makePageNvai(pageInfo, "selectCrwdfundList");
         }
    }

     /*===========================================================
      * 클라우드 펀딩 게시물 상세페이지로 이동 !!
      *===========================================================*/
     function goCrwdfundDetail(obj){
         var propseSn = $(obj).data("propse_sn");
         var param = gf_searchParam(GV_CURR_PAGE_NO);

         param += "&propseSn=" + propseSn;

         gf_submitMovePage("/ca/crwdfund/${pEndAt}/initCrwdfundDetail.do", param);
     }
</script>

<div class="sub-visual visual00_03">
    <div class="sub-title-area">
        <h2 class="heading-title-a">크라우드펀딩</h2>
        <p class="title-sub-txt">당신이 함께하는 응원! 크라우드 펀딩입니다. </p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3>
                <strong>
                    <c:choose>
                        <c:when test="${pEndAt eq 'P'}">진행중인 펀딩 </c:when>
                        <c:when test="${pEndAt eq 'E'}">종료된 펀딩 </c:when>
                    </c:choose>
                </strong>
                <span>당신이 함께하는 응원! 크라우드 펀딩입니다.</span>
            </h3>
            <div class="contents-menu-nav"></div>
        </div>
        <div class="seo-box" id="searchArea">
            <div class="funding-area">
            <c:if test="${pEndAt eq 'P'}">
<!--                 <div class="sort-tab"> -->
<!--                     <button type="button" id="tabN" class="button_sort" onClick="javascript:orderTabClickEvent('N');"><i>최신순</i></button> -->
<!--                     <button type="button" id="tabE" class="button_sort" onClick="javascript:orderTabClickEvent('E');"><i>종료임박순</i></button> -->
<!--                 </div> -->
            </c:if>
                <input type="hidden" id="pEndAt" name="pEndAt" value="${pEndAt}"><!-- P : Progress, E : Ended -->
                <input type="hidden" id="pOrder" name="pOrder" value="E"><!-- N : New, E : End -->
                <input type="hidden" id="pageCount" name="pageCount" value="12">

                <ul class="list-funding" id="dataGridList"></ul>
            </div>
            <!-- Page Navigation Area Start -->
            <div id="dataGridPageNavi" class="paging-area"></div>
            <!-- // Page Navigation Area -->
        </div>
    </div>
</main>
