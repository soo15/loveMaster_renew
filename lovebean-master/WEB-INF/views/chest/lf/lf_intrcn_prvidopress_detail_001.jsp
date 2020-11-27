<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var orgParam    = "<c:out value="${paramMap}" escapeXml="false" />";
    var LIST_SN     = "<c:out value="${paramMap.listSn}" escapeXml="false" />";
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        $("#btnList").off("click").on('click', function(e){
            goPrvidopressList();
        });
        
        selectPrvidopressInfo();
    });
    
    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Prvidopress 한 건 조회 !!
     *===========================================================*/
    function selectPrvidopressInfo(){
        var param  = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');
        
        gf_send("<c:url value='/lf/intrcn/selectPrvidopressInfo.do' />", param);
    }
    
    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * Prvidopress 한 건 조회 Callback Function !!
     *===========================================================*/
    function selectPrvidopressInfoAfter(data){
        
        if(data.dataInfo != null){
            var prvidopressInfo   = data.dataInfo.prvidopressInfo;
            
            if(!gf_isNull(prvidopressInfo)){
                $("#sj").html(prvidopressInfo.sj);
                $("#rgsde").html(prvidopressInfo.rgsde);
                $("#rdcnt").html(prvidopressInfo.rdcnt);
                $("#cn").html(prvidopressInfo.cn);
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
                    listHtml    += '        <a href="javascript:;" onClick="javascript:goPrvidopressDetail(this);" data-list_sn="' + listSn + '" class="clamp">' + sj + '</a>';
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
    
    function goPrvidopressList(){
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');

        gf_submitMovePage("<c:url value='/lf/intrcn/initPrvidopress.do' />", param);
    }
    
    /*===========================================================
     * Prvidopress 상세페이지로 이동 !!
     *===========================================================*/
    function goPrvidopressDetail(obj){
        var listSn = $(obj).data("list_sn");
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&').replace('listSn='+LIST_SN, 'listSn='+listSn);

        gf_submitMovePage("<c:url value='/lf/intrcn/initPrvidopressDetail.do' />", param);
    }
    
</script>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">홍보영상&인쇄물</h2>
        <p class="title-sub-txt">당신의 나눔이 모두의 행복입니다. <span class="mobile-block-mini">나눔의 힘을 믿어보세요.</span></p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>홍보영상&인쇄물</strong><span>사회복지공동모금회 홍보관입니다.</span></h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box">
            <div class="view-box">
                <div class="view-header">
                    <div class="view-header-top">
                        <p class="view-header-title" id="sj"></p>
                        <span class="view-header-item"><strong>등록일</strong><span id="rgsde"></span></span>
                        <span class="view-header-item"><strong>조회수</strong><span id="rdcnt"></span></span>
                    </div>
<!--                     <div class="view-header-info"> -->
<!--                         <span class="view-header-item"><strong>등록자</strong>모금회</span> -->
<!--                     </div> -->
                </div>
                <div class="view-contents" id="cn"></div>
            </div>
            <div class="prenet-area" id="preNextArea"></div>
            <div class="btn-area">
                <a href="javascript:;" id="btnList" class="btn-base-imp">목록</a>
            </div>
        </div>
    </div>
</main>
