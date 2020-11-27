<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    var orgParam = "<c:out value="${paramMap}" escapeXml="false" />";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        $("#btnStore").off("click").on("click", function(){
            updateReply();
        });

        $("#btnList").off("click").on("click", function(){
            goCrwdfundReplyList();
        });

        selectCrwdfundReplyInfo();
    });

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * 클라우드 펀딩 게시물 한 건 조회 !!
     *===========================================================*/
    function selectCrwdfundReplyInfo(){
        var param       = "&answerSn=${paramMap.answerSn}";

        gf_send("/ca/crwdfund/selectCrwdfundReplyInfo.do", param);
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 클라우드 펀딩 게시물 한 건 조회 Callback Function !!
     *===========================================================*/
    function selectCrwdfundReplyInfoAfter(data){
        if(data.dataInfo != null){
            var crwdfundReplyInfo   = data.dataInfo.crwdfundReplyInfo;

            if(!gf_isNull(crwdfundReplyInfo)){
                $("#chargerNm").val(crwdfundReplyInfo.chargerNm);
                $("#chargerPw").val(crwdfundReplyInfo.chargerPw);
                $("#answerCn").val(crwdfundReplyInfo.answerCn);
            }

        }else{
            alert("<spring:message code="com.system.error"></spring:message>");
            return;
        }
    }

    /*===========================================================
     * 클라우드 펀딩 답글 한 건 수정 !!
     *===========================================================*/
    function updateReply(){
        // 저장 공통 체크 !!
        if(!gf_storeDataCheck("replyForm")){
            return false;
        }

        if(!confirm("<spring:message code="check.confirm.store"></spring:message>")){   // 저장하시겠습니까?
            return false;
        }

        gf_sendForm("replyForm");
    }

    /*===========================================================
     * 클라우드 펀딩 답글 한 건 수정 Callback Function !!
     *===========================================================*/
    function updateReplyAfter(data){
        if(data.result == "1"){
            alert("<spring:message code="result.save.success"></spring:message>");  // 저장되었습니다.

            goCrwdfundReplyList();
        } else {
            alert("<spring:message code="result.save.fail"></spring:message>");     // 저장에 실패하였습니다.
        }
    }

    /*===========================================================
     * 클라우드 펀딩게시물 목록으로 이동 !!
     *===========================================================*/
    function goCrwdfundReplyList(){
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');

        gf_submitMovePage("/ca/crwdfund/${paramMap.pEndAt}/initCrwdfundDetail.do", param);
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
            <h3><strong>진행중인 펀딩 </strong><span>당신이 함께하는 응원! 크라우드 펀딩입니다.</span></h3>
            <div class="contents-menu-nav"></div>
        </div>
        <div class="seo-box">
            <div class="end-funding-area">
                <h2 class="table-tit-n">사랑의열매 크라우드펀딩에<br>기부 해주셔서 감사합니다.</h2>
                <div class="reply-wrap type-write">
                    <form id="replyForm" name="replyForm" action="<c:url value='/ca/crwdfund/updateReply.do'/>">
                    <input type="hidden" id="answerSn" name="answerSn" value="${paramMap.answerSn}"/>
                    <div class="reply-list">
                        <!-- <div class="reply-item"> -->
                            <div class="reply-name">
                                <label  class="reply-item-n " for="chargerNm"><span class="mgl-s">기부자명</span></label>
                                <input type="text" class="inp-base _required" id="chargerNm" name="chargerNm">

                                <label class="reply-item-n" for="chargerPw"><span class="mgl-s">비밀번호</span></label>
                                <input type="password"  placeholder="숫자 6자리" class="inp-base _required" id="chargerPw" name="chargerPw">
                            </div>
                            <p class="reply-item-n donation-guide-txt"><span class="mgl-s">응원의 한마디</span></p>
                            <div class="reply-text radi">
                                <textarea class="inp-base _required" name="answerCn" id="answerCn" cols="30" rows="10" placeholder="댓글은 500자까지만 가능합니다.&#13;&#10;사랑의열매가 댓글 1개당 100원을 추가 지원합니다."></textarea>
                            </div>
                        <!-- </div> -->
                    </div>
                    </form>
                </div>

                <div class="btn-area">
                    <button type="button" class="btn-base-imp" id="btnStore">저장</button>
                    <button type="button" class="btn-base-line" id="btnList">댓글 쓰지않고 나가기</button>
                </div>

            </div>
        </div>
    </div>
</main>
