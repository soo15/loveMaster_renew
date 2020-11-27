<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var orgParam    = "<c:out value="${paramMap}" escapeXml="false" />";
    var BBS_NM       = "<c:out value='${bbsInfo.bbsNm}' />";
    var LIST_SN     = "<c:out value="${paramMap.listSn}" escapeXml="false" />";

<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
    var BBS_SN       = "<c:out value='${bbsInfo.bbsSn}' />";
    </c:when>
</c:choose>

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        $("#tabTitle").text("${bbsInfo.bbsNm}");

<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
        initTab(BBS_SN, BBS_NM);
    </c:when>
</c:choose>

        $("#btnList").off("click").on('click', function(e){
            goPostList();
        });

        selectPostInfo();
    });

<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
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
    </c:when>
</c:choose>

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Post 한 건 조회 !!
     *===========================================================*/
    function selectPostInfo(){
        var param  = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');
        param += "&hideFlpth=Y";

        gf_send("/bbs/selectPostInfo.do", param);
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * Post 한 건 조회 Callback Function !!
     *===========================================================*/
    function selectPostInfoAfter(data){

        if(data.dataInfo != null){
            var postInfo   = data.dataInfo.postInfo;

            if(!gf_isNull(postInfo)){
                $("#sj").html(postInfo.sj);
                $("#rgsde").html(postInfo.rgsde);
                $("#rdcnt").html(postInfo.rdcnt);
                $("#cn").html(postInfo.cn);
            }

            var fileListInfo = data.dataInfo.fileListInfo;

            if(fileListInfo != null && fileListInfo.length != 0){
                $.each(fileListInfo, function(i, v){
                    var fileHtml    = '';

                    if(i == (fileListInfo.length - 1)){
                        fileHtml+= '<div class="attach-item">';
                    }else{
                        fileHtml+= '<div class="attach-item" style="margin-bottom : 5px;">';
                    }
                    fileHtml    += '    <i class="ico-file"></i>';
                    
                    fileHtml    += '    <a href="javascript:;" OnClick="gf_genFileExportSn(this);">' + v.orginlFileNm + '</a>';
                    //fileHtml    += '    <a href="javascript:;" OnClick="gf_genFileExport(this);">' + v.orginlFileNm + '</a>';
                    // 실제 경로를 DB 에서 가져왔을 때 주석 풀기. 현재는 properties 에 있는 경로로 테스트. 
                    fileHtml    += '    <input id="filePath"   name="filePath"   type="hidden" value="' + v.flpth + '" />';
                    fileHtml    += '    <input id="phycFileNm" name="phycFileNm" type="hidden" value="' + v.serverFileNm + '" />';
                    fileHtml    += '    <input id="logcFileNm" name="logcFileNm" type="hidden" value="' + v.orginlFileNm + '" />';
                    fileHtml    += '</div>';

                    $('#fileList').append(fileHtml);
                });

                $("#attachArea").show();
            }else{
                $("#attachArea").hide();
            }

            var listInfo    = data.dataInfo.listInfo;

            if(listInfo != null && listInfo.length != 0){
                $.each(listInfo, function(i, v){
                    var listSn  = v.listSn;
                    var sj      = v.sj;
                    var rgsde   = v.rgsde;
                    var gubun   = v.gubun;

                    var listHtml    = '';

                    listHtml    += '<dl class="prenet-item">';
                    if(gubun == 'P'){
                        listHtml    += '<dt><i class="sprite-paging-prenet1"></i>이전글</dt>';
                    }else{
                        listHtml    += '<dt><i class="sprite-paging-prenet2"></i>다음글</dt>';
                    }
                    listHtml    += '    <dd>';
                    listHtml    += '        <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-list_sn="' + listSn + '" class="clamp">' + sj + '</a>';
                    listHtml    += '    </dd>';
                    listHtml    += '    <dd class="prenet-day">' + rgsde + '</dd>';
                    listHtml    += '</dl>';

                    $('#preNextArea').append(listHtml);
                });
            }
        }else{
            alert("<spring:message code="com.system.error"></spring:message>");
            return;
        }
    }

    function goPostList(){
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');
<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
        gf_submitMovePage("/bbs/" + $("#pBbsSn").val() + "/initPostList.do", param);
    </c:when>
    <c:otherwise>
        gf_submitMovePage("/bbs/${bbsInfo.bbsSn}/initPostList.do", param);
    </c:otherwise>
</c:choose>
    }

    /*===========================================================
     * Post 상세페이지로 이동 !!
     *===========================================================*/
    function goPostDetail(obj){
        var listSn = $(obj).data("list_sn");
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&').replace('listSn='+LIST_SN, 'listSn='+listSn);

<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
        gf_submitMovePage("/bbs/" + $("#pBbsSn").val() + "/initPostDetail.do", param);
    </c:when>
    <c:otherwise>
        gf_submitMovePage("/bbs/${bbsInfo.bbsSn}/initPostDetail.do", param);
    </c:otherwise>
</c:choose>
    }

<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
    /*===========================================================
     * Tab Click 페이지 이동 !!
     *===========================================================*/
     function tabClickEvent(bbsSn){
        $("#pBbsSn").val(bbsSn);

        gf_submitMovePage("/bbs/" + bbsSn + "/initPostList.do", gf_searchParam(1));
     }
    </c:when>
</c:choose>
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
                <span>사랑의열매의 새로운 소식을 알려드립니다.</span>
            </h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box" id="searchArea">
            <input type="hidden" id="pBbsSn" name="pBbsSn" value="${paramMap.bbsSn}">
            <input type="hidden" id="pBhfCode" name="pBhfCode" value="${paramMap.pBhfCode }"/>
            <input type="hidden" id="pSj" name="pSj" value="${paramMap.pSj }"/>
<c:choose>
    <c:when test="${bbsInfo.tabAt eq 'Y'}">
            <div class="page-tab">
        <c:if test="${!empty tabList}">
            <c:forEach var="tabList" items="${tabList}" varStatus="status">
                <div class="tab-col">
                    <a href="javascript:;" id="tab${tabList.bbsSn}" onClick="javascript:tabClickEvent('${tabList.bbsSn}');" class="tab-col-item"><i>${tabList.bbsNm}</i></a>
                </div>
            </c:forEach>
        </c:if>
            </div>
    </c:when>
</c:choose>

            <div class="view-box">
                <div class="view-header">
                    <div class="view-header-top">
                        <p class="view-header-title" id="sj"></p>
                        <span class="view-header-item"><strong>등록일</strong><span id="rgsde"></span></span>
                        <span class="view-header-item"><strong>조회수</strong><span id="rdcnt"></span></span>
                    </div>
                    <div class="view-header-info">
                        <span class="view-header-item"><strong>등록자</strong><span id="registerNm">모금회</span></span>
                    </div>
                </div>
<!--                 <div class="view-contents"> -->
                <div class="mg-m">
                    <!-- div 추가 -> 내용과 파일 영역을 나누기 위해 -->
                    <div id="cn"></div>
                    <div class="attach-area" id="attachArea" style="display:none;">
                        <dl class="attach-box">
                            <dt class="attach-box-tit">첨부파일</dt>
                            <dd class="attach-box-content" id="fileList"></dd>
                        </dl>
                    </div>
                </div>
            </div>
            <div class="prenet-area" id="preNextArea"></div>
            <div class="btn-area">
                <a href="javascript:;" id="btnList" class="btn-base-imp">목록</a>
            </div>
        </div>
    </div>
</main>
