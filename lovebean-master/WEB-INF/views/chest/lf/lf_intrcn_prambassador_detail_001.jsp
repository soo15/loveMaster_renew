<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var orgParam      = "<c:out value="${paramMap}" escapeXml="false" />";
    var PRAMBSSDR_SN  = "<c:out value="${paramMap.prambssdrSn}" escapeXml="false" />";
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        $("#btnList").off("click").on('click', function(e){
            goPrambassadorList();
        });

        selectPrambassadorInfo();
    });

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * Prambassador 한 건 조회 !!
     *===========================================================*/
    function selectPrambassadorInfo(){
        var param  = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');

        gf_send("<c:url value='/lf/intrcn/selectPrambassadorInfo.do' />", param);
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * Prambassador 한 건 조회 Callback Function !!
     *===========================================================*/
    function selectPrambassadorInfoAfter(data){

        if(data.dataInfo != null){
            var prambassadorInfo   = data.dataInfo.prambassadorInfo;

            if(!gf_isNull(prambassadorInfo)){
                $("#prambssdrNm").html(prambassadorInfo.prambssdrNm);
                $("#prambssdrNmOccp").html(prambassadorInfo.prambssdrNm + "<span>" + prambassadorInfo.occp + "</span>");
                var entrstDe = prambassadorInfo.entrstDe;
                if(gf_isValidDate(entrstDe)){   // 값이 날짜
                    entrstDe    = gf_formatDate(entrstDe);      // 데이트 형식으로 만들어줌
                    entrstDe    = entrstDe.replace(/-/g, ".");  // 원하는 데이트 형식으로 만들어줌
                    $("#entrstDe").html(entrstDe);
                }else{
                    $("#entrstDe").html("");
                }
                $("#mainAct").html(prambassadorInfo.mainAct);
            }

            if(prambassadorInfo.serverFileNm != ''){
                $("#profileImg").prop("src", "${genFilePath}" + prambassadorInfo.flpth + "/" + prambassadorInfo.serverFileNm);
                $("#profileImg").prop("alt", prambassadorInfo.prambssdrNm);
                $("#profileImg").prop("title", prambassadorInfo.prambssdrNm);
            }

            var listInfo    = data.dataInfo.listInfo;

            if(listInfo != null && listInfo.length != 0){
                $.each(listInfo, function(i, v){
                    var prambssdrSn  = v.prambssdrSn;
                    var prambssdrNm  = v.prambssdrNm;
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
                    listHtml    += '        <a href="javascript:;" onClick="javascript:goPrambassadorDetail(this);" data-prambssdr_sn="' + prambssdrSn + '" class="clamp">' + prambssdrNm + '</a>';
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

    function goPrambassadorList(){
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');

        gf_submitMovePage("<c:url value='/lf/intrcn/initPrambassador.do' />", param);
    }

    /*===========================================================
     * Prambassador 상세페이지로 이동 !!
     *===========================================================*/
    function goPrambassadorDetail(obj){
        var prambssdrSn = $(obj).data("prambssdr_sn");
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&').replace('prambssdrSn='+PRAMBSSDR_SN, 'prambssdrSn='+prambssdrSn);

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
            <div class="view-box">
                <div class="view-header">
                    <div class="view-header-top">
                        <p class="view-header-title" id="prambssdrNm">채시라</p>
                    </div>
                </div>
                <div class="view-contents">
                    <div class="view-type3">
                        <div class="view-img">
                            <img id="profileImg" src="" alt="">
                        </div>
                        <div class="view-desc">
                            <p class="desc-tit" id="prambssdrNmOccp"></p>
                            <dl>
                                <dt>위촉일</dt>
                                <dd id="entrstDe"></dd>

                                <dt>주요 활동</dt>
                                <dd id="mainAct"></dd>
                            </dl>
                        </div>
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
