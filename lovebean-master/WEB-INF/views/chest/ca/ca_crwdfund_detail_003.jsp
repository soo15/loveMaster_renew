<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<style>
    .sns-wrap{
        padding:30px 0 0;
        background: none;
    }

    .sns-wrap a {
        display: inline-block;
        width: 40px;
        height: 46px;
        text-decoration : none;
        background: none;
        margin: 0 8px;
    }
</style>
<script type="text/javascript">
    var myGrid   = null;
    var orgParam = "<c:out value="${paramMap}" escapeXml="false" />";

    // reply parameter
    var REPLY_CURRENT_PAGE  = 1;
    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        myGrid = gf_initMyGrid();

        $plugins.uiDropdown({
            id:'btnShareSns',
            ps:'tc',
            eff:'st',
            auto: false,
            dim:false,
            openback: function() { console.log('open callback'); },
            closeback: function() { console.log('close callback'); },
            offset:true
        });

        //acco
        $plugins.uiAccordion({
            id: 'goalAmountUsePlanAcco',
            current: [0],
            autoclose: true
        });

        $("#btnList").off("click").on('click', function(e){
            goCrwdfundList();
        });

        $("#btnCt").off("click").on('click', function(e){
            goCtForm($(this));
        });

        selectCrwdfundInfo();
        
        selectCrwdfundAnswerList();
    });

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * 클라우드 펀딩 게시물 한 건 조회 !!
     *===========================================================*/
    function selectCrwdfundInfo(){
        var param  = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');

        gf_send("/ca/crwdfund/selectCrwdfundInfo.do", param);
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 클라우드 펀딩 게시물 한 건 조회 Callback Function !!
     *===========================================================*/
    function selectCrwdfundInfoAfter(data){
        if(data.dataInfo != null){
            var crwdfundInfo   = data.dataInfo.crwdfundInfo;

            if(!gf_isNull(crwdfundInfo)){
                $("#bsnsSj").val(crwdfundInfo.bsnsSj);
                $("#title4").val(crwdfundInfo.bsnsSj);
                $("#bsnsCn").html(crwdfundInfo.bsnsCn);

                if(!gf_isNull(crwdfundInfo.propseInsttFileNm)){
                    $("#propseInsttFileNm").prop('src', '${genFilePath}' + crwdfundInfo.flpth + crwdfundInfo.propseInsttFileNm);
                }else{
                    $("#propseInsttFileNm").prop('src', '/common/img/contents/ico_lovebean.png');
                }

                $("#propseInsttNm").html(crwdfundInfo.propseInsttNm);
                $("#mysPd").html(crwdfundInfo.mysPd);
                $("#goalAmount").html(!gf_isNull(crwdfundInfo.goalAmount) ? gf_comma(crwdfundInfo.goalAmount) : 0);
                var cntrAmountSum   = !gf_isNull(crwdfundInfo.cntrAmountSum) ? gf_comma(crwdfundInfo.cntrAmountSum) : 0;
                $("#cntrAmountSum_1").html(cntrAmountSum);
                $("#cntrAmountSum_2").html(cntrAmountSum);
                $("#cntrAmountCnt").html(crwdfundInfo.cntrAmountCnt);
                $("#bsnsPd").html(crwdfundInfo.bsnsPd);
                $("#goalAmountUsePlan").html(crwdfundInfo.goalAmountUsePlan);
                
                if (crwdfundInfo.goalAmountUsePlan == "") {
                    $("#goalAmountUsePlanAcco").hide();
                } else {
                    $("#goalAmountUsePlanAcco").show();
                }

                $("#btnCt").data({"event_code" : crwdfundInfo.eventCode ,"ct_form_url" : crwdfundInfo.ctFormUrl, "ct_menu_id" : crwdfundInfo.ctMenuId});
            }

        }else{
            alert("<spring:message code="com.system.error"></spring:message>");
            return;
        }

        $plugins.common.setTitle($.cookie('__branchNm'));

    }

    /*===========================================================
     * 클라우드 펀딩게시물 목록으로 이동 !!
     *===========================================================*/
    function goCrwdfundList(){
        var param = orgParam.replace(/[\{\}\s]/gi, '').replace(/\,/gi, '&');

        gf_submitMovePage("/ca/crwdfund/${pEndAt}/initCrwdfund.do", param);
    }

    /*===========================================================
     * 기부페이지로 이동 !!
     *===========================================================*/
    function goCtForm(obj){
        var url         = obj.data("ct_form_url");
        var menuId      = obj.data("ct_menu_id");
        var eventCode   = obj.data("event_code");

        // Cookie Value Initialize !!
        $.cookie("__menuId",   menuId);
        $.cookie("__menuType", "header");

        var param = "pLinkSepCd=menuLink";
        param     += "&eventCode=" + eventCode;
        param     += "&speclMysAt=Y";

        gf_submitMovePage(url, param);
    }

    /*===========================================================
     * 공유하기 함수 !!
     *===========================================================*/
     // facebook start //
     function facebookSharePost(){
         var url     = '<%=request.getParameter("pBranchUrl")%>ca/crwdfund/P/initCrwdfundDetail.do?pMenuType=header&pMenuId=00_01_01&propseSn=${paramMap.propseSn }';
         console.log(url);
         var title   = $("#bsnsSj").val();
         var encodeUrl = encodeURIComponent(url);
         var encodeTitle = encodeURIComponent( title );
         var link = urlParameterReplace('https://www.facebook.com/sharer/sharer.php?u={0}&t={1}', encodeUrl, encodeTitle );
         window.open( link, 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600' );
         return false;
    }
    // facebook end //
    // naver start //
    function naverBlogSharePost() {
        var url     = '<%=request.getParameter("pBranchUrl")%>ca/crwdfund/P/initCrwdfundDetail.do?pMenuType=header&pMenuId=00_01_01&propseSn=${paramMap.propseSn }';
        console.log(url);
        var title   = $("#bsnsSj").val();
        var encodeUrl = encodeURIComponent(url);
        var encodeTitle = encodeURIComponent( title );
        var link = urlParameterReplace('http://blog.naver.com/openapi/share?url={0}&title={1}', encodeUrl, encodeTitle );
        window.open( link, 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600' );
        return false;
    }

    // naver end //
    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * 클라우드 펀딩 답글 목록 조회 !!
     *===========================================================*/
    function selectCrwdfundAnswerList(pageNo){
       gf_send("/ca/crwdfund/selectCrwdfundAnswerList.do", gf_searchParam(pageNo, "searchAreaReply"));
    }

   /*************************************************************
    * Ajax Send Callback Function !!
    *************************************************************/
   /*===========================================================
    * 클라우드 펀딩 답글 리스트 조회 Callback Function !!
    *===========================================================*/
    function selectCrwdfundAnswerListAfter(data){
        $("#dataGridList").html('');
        $('#dataGridPageNavi').html('');

        var listInfo = data.listInfo;
        var pageInfo = data.pageInfo;

        var listHtml = "";

        if(listInfo.length == 0){
            listHtml += '<li style="width:100%;text-align:center;"><b>등록된 댓글이 없습니다.</b></li>';
        }else{

            for(var i=0; i<listInfo.length; i++){
                var answerSn  = listInfo[i].answerSn;
                var propseSn  = listInfo[i].propseSn;
                var answerCn  = !gf_isNull(listInfo[i].answerCn) ? listInfo[i].answerCn : '';
                var chargerNm = !gf_isNull(listInfo[i].chargerNm) ? listInfo[i].chargerNm : '익명';
                var rgsde     = listInfo[i].rgsde;

                listHtml += '<li class="reply-item">';
                listHtml += '   <div class="reply-name">';
                listHtml += '       <b>' + chargerNm + '</b>';
                listHtml += '       <span>' + rgsde + '</span>';
                listHtml += '   </div>';
                listHtml += '   <div class="reply-text">' + answerCn + '</div>';
                listHtml += '   <div class="reply-btn">';
                listHtml += '       <button type="button" class="reply-pw-check" data-mode="U" data-answer_sn="' + answerSn + '">수정</button>';
                listHtml += '       <span>|</span>';
                listHtml += '       <button type="button" class="btn-del reply-pw-check" data-mode="D" data-answer_sn="' + answerSn + '">삭제</button>';
                listHtml += '   </div>';
                listHtml += '</li>';
            }
        }

        $("#dataGridList").html(listHtml);

        $("#searchAreaReply #dataGridList .reply-pw-check").off("click").on("click", function(){
            popUpPassword($(this));
        });

        if(listInfo.length != 0){
            myGrid.makePageNvai(pageInfo, "selectCrwdfundAnswerList");
        }
    }

    /*===========================================================
     * 답글 수정/삭제를 위한 비밀번호 입력 팝업 !!
     *===========================================================*/
    function popUpPassword(obj){
        $plugins.uiModal({
            id:'modalPassword',
            openback: function() {
                $("#modalPassword #btnCheckReplyPw").off("click").on("click", function(){
                    checkReplyPw(obj);
                });

                $("#modalPassword #replyPw").off("keypress").on("keypress", function(e){
                    if(e.keyCode == 13){
                        checkReplyPw(obj);
                    }
                });
            },
            closeback: function(v) {
                $("#modalPassword").attr('aria-hidden', true);
                $("#modalPassword #replyPw").val('');
            }
        });
    }

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * 답글 수정/삭제를 위한 비밀번호 체크 !!
     *===========================================================*/
    function checkReplyPw(obj){
        var pw          = $("#modalPassword #replyPw").val();
        if(gf_isNull(pw)){
            alert("비밀번호를 입력해주세요.");
            return false;
        }

        var mode        = obj.data("mode");
        var answerSn    = obj.data("answer_sn");

        var param  = "&mode=" + mode;
        param      += "&answerSn=" + answerSn;
        param      += "&chargerPw=" + pw;

        gf_send("/ca/crwdfund/checkReplyPw.do", param);
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * 답글 수정/삭제를 위한 비밀번호 체크 Callback Function !!
     *===========================================================*/
     function checkReplyPwAfter(data){
         if(data.dataInfo != null){
            var result      = data.dataInfo.checkPwCnt;

            if(result == "1"){
                var mode        = data.dataInfo.paramData.mode;

                if(mode == "D"){
                    // 모달 팝업 닫기 처리.
                    $plugins.uiModalClose({ id: 'modalPassword' });
                    deleteReply(data.dataInfo.paramData);
                }else{
                    goReplyEditForm(data.dataInfo.paramData);
                }
            }else{
                alert("비밀번호가 다릅니다.\n다시 한번 확인하여 주십시오.");
                return ;
            }
         }else{
             alert("<spring:message code="com.system.error"></spring:message>");
             return;
         }
     }

     /*************************************************************
      * Ajax Send Event Function !!
      *************************************************************/
     /*===========================================================
      * 답글 삭제 !!
      *===========================================================*/
     function deleteReply(param){
         var answerSn    = param.answerSn;

         var param  = "&answerSn=" + answerSn;

         gf_send("/ca/crwdfund/deleteReply.do", param);
     }

     /*************************************************************
      * Ajax Send Callback Function !!
      *************************************************************/
     /*===========================================================
      * 답글 삭제 Callback Function !!
      *===========================================================*/
      function deleteReplyAfter(data){
          if(data.result == "1"){
              alert("<spring:message code="result.delete.success"></spring:message>");

              // 삭제 처리 후 재조회
              selectCrwdfundAnswerList(1);
          }else{
              alert("<spring:message code="result.delete.fail"></spring:message>");
              return;
          }
      }

      /*===========================================================
       * 답글 수정 페이지로 이동 !!
       *===========================================================*/
      function goReplyEditForm(param){
          var answerSn  = param.answerSn;

          var param     = "&answerSn=" + answerSn;
          param        += "&propseSn=${paramMap.propseSn}";
          param        += "&pEndAt=${pEndAt}";

          gf_submitMovePage("/ca/crwdfund/initCrwdfundReply.do", param);
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
        <div class="seo-box">
            <input type="hidden" id="bsnsSj" />
            <input type="hidden" id="title4" />
            <div class="end-funding-area">
                <div id="bsnsCn"></div>
                <div class="funding-data">
                    <div class="funding-data-col funding-data-name">
                        <span class="funding-logo"><img id="propseInsttFileNm" src="" alt=""></span>
                        <p class="text-small">프로젝트팀</p>
                        <p class="text-normal" id="propseInsttNm"></p>
                    </div>
                    <div class="funding-data-col funding-data-day">
                        <p class="text-small">모금기간</p>
                        <p class="text-normal" id="mysPd"></p>
                    </div>
                    <div class="funding-data-col funding-data-total">
                        <p class="text-small">목표금액 : <em id="goalAmount">0</em>원</p>
                        <p class="text-normal">총 :<em id="cntrAmountSum_1">0</em>원 (<em id="cntrAmountCnt">0</em>명)</p>
                    </div>
                </div>

                <div class="btn-area">
            <c:choose>
                <c:when test="${thisEndAt eq 'P'}">
                    <div class="btn-col">
                        <div class="btn-wrap">
                            <button type="button" class="btn-base-blue ui-drop " id="btnShareSns"><span>SNS공유하기</span></button>
                            <div class="ui-drop-wrap">
                                <section class="ui-drop-pnl" data-id="btnShareSns">
                                    <div class="sns-modal-wrap">
                                        <div class="sns-modal-tit">
                                            <h1>SNS 공유하기</h1>
                                            <button type="button" class="ui-drop-close btn-close"><span class="hide">닫기</span></button>
                                        </div>
                                        <div class="sns-wrap">
                                            <a href="javascript:;" onclick="javascript:facebookSharePost();"><img src="/common/img/contents/btn_fb.png" alt="페이스북" title="새 창 열림"></a>
<!--                                             <a href="javascript:;"><img src="/common/img/contents/btn_ig.png" alt="인스타그램"></a> -->
                                            <a href="javascript:;" onclick="javascript:naverBlogSharePost();"><img src="/common/img/contents/btn_bg.png" alt="블로그" title="새 창 열림"></a>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <div class="btn-col">
                        <button type="button" class="btn-base-imp" id="btnCt">기부하기</button>
                        <span class="text-data">기부 : <em id="cntrAmountSum_2">0</em></span>
                    </div>
                </c:when>
                <c:when test="${thisEndAt eq 'E'}">
                    <span class="btn-col">
                        <button type="button" class="btn-base-blue" disabled="disabled">SNS공유하기</button>
                    </span>
                    <span class="btn-col">
                        <button type="button" class="btn-base-imp" disabled="disabled">기부종료</button>
                        <span class="text-data">기부 : <em id="cntrAmountSum_2">0</em></span>
                    </span>
                </c:when>
            </c:choose>
                    <div class="btn-col">
                        <button type="button" class="btn-base-line" id="btnList">목록</button>
                    </div>
                </div>
                 <!-- text추가2006 -->
				<div><p style="text-align:center; color:orange; padding-top:20px;">- 모금된 금액은 수수료없이 전액 사업에 사용됩니다 - </p></div>
                <!-- //text추가2006  -->
                <!-- 배너영역추가2008 -->
                 <div class="funding__thumbnail">
                            <h2>함께해요!</h2>
                            <p>사랑의열매 크라우드펀딩에 동참해주세요.</p>
                            <i><a href="https://chest.or.kr/ca/crwdfund/P/initCrwdfund.do">더보기<span>></span></a></i>
                            <div class="funding__thumbnail--boxs">
            <c:choose>
                <c:when test="${paramMap.propseSn eq '26'}">
                        	    <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI3'">
                                    <img src="/common/img/contents/Camp/voice_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>여러분의 목소리를 보는 사람들이 있습니다.</p>
                                        <p>사랑의달팽이</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI1'">
                                    <img src="/common/img/contents/Camp/bathchair_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>그들의 아찔하고 위험한 질주를 지금 바로 멈춰주세요.</p>
                                        <p>울산광역시보조기기센터</p>
                                    </div>
                                </div>
                </c:when>
                <c:when test="${paramMap.propseSn eq '27'}">
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI4'">
                                    <img src="/common/img/contents/Camp/bnr_funding_Thumbnail.jpg" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>나는 감정노동자입니다.</p>
                                        <p>공감인</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI1'">
                                    <img src="/common/img/contents/Camp/bathchair_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>그들의 아찔하고 위험한 질주를 지금 바로 멈춰주세요.</p>
                                        <p>울산광역시보조기기센터</p>
                                    </div>
                                </div>
                </c:when>
                <c:when test="${paramMap.propseSn eq '28'}">
                        	    <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI3'">
                                    <img src="/common/img/contents/Camp/voice_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>여러분의 목소리를 보는 사람들이 있습니다.</p>
                                        <p>사랑의달팽이</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI1'">
                                    <img src="/common/img/contents/Camp/bathchair_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>그들의 아찔하고 위험한 질주를 지금 바로 멈춰주세요.</p>
                                        <p>울산광역시보조기기센터</p>
                                    </div>
                                </div>
                </c:when>
                <c:when test="${paramMap.propseSn eq '29'}">
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI3'">
                                    <img src="/common/img/contents/Camp/voice_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>여러분의 목소리를 보는 사람들이 있습니다.</p>
                                        <p>사랑의달팽이</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI4'">
                                    <img src="/common/img/contents/Camp/bnr_funding_Thumbnail.jpg" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>나는 감정노동자입니다.</p>
                                        <p>공감인</p>
                                    </div>
                                </div>
                </c:when>
                <c:when test="${paramMap.propseSn eq '13'}">
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI3'">
                                    <img src="/common/img/contents/Camp/voice_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>여러분의 목소리를 보는 사람들이 있습니다.</p>
                                        <p>사랑의달팽이</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI4'">
                                    <img src="/common/img/contents/Camp/bnr_funding_Thumbnail.jpg" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>나는 감정노동자입니다.</p>
                                        <p>공감인</p>
                                    </div>
                                </div>
                </c:when>
                <c:when test="${paramMap.propseSn eq '15'}">
                        	    <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI3'">
                                    <img src="/common/img/contents/Camp/voice_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>여러분의 목소리를 보는 사람들이 있습니다.</p>
                                        <p>사랑의달팽이</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI4'">
                                    <img src="/common/img/contents/Camp/bnr_funding_Thumbnail.jpg" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>나는 감정노동자입니다.</p>
                                        <p>공감인</p>
                                    </div>
                                </div>
                </c:when>
                <c:when test="${paramMap.propseSn eq '6'}">
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI2'">
                                    <img src="/common/img/contents/Camp/abuse_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>아직 끝나지 않은 이야기. 학대피해아동, 우리 곁에 늘 있었습니다.</p>
                                        <p>학대피해쉼터 그루터기</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTE1'">
                                    <img src="/common/img/contents/Camp/H_less_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>고인의 마지막이 더 이상 외롭지 않도록</p>
                                        <p>사단법인 돌보미연대</p>
                                    </div>
                                </div>
                </c:when>
                <c:when test="${paramMap.propseSn eq '5'}">
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI3'">
                                    <img src="/common/img/contents/Camp/voice_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>여러분의 목소리를 보는 사람들이 있습니다.</p>
                                        <p>사랑의달팽이</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI4'">
                                    <img src="/common/img/contents/Camp/bnr_funding_Thumbnail.jpg" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>나는 감정노동자입니다.</p>
                                        <p>공감인</p>
                                    </div>
                                </div>
                </c:when>
                <c:when test="${paramMap.propseSn eq '25'}">
                        	    <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI3'">
                                    <img src="/common/img/contents/Camp/voice_funding_Thumbnail.png" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>여러분의 목소리를 보는 사람들이 있습니다.</p>
                                        <p>사랑의달팽이</p>
                                    </div>
                                </div>
                                <div class="funding__thumbnail--box" OnClick="location.href ='/bridgelink.do?pBranchCd=${__branchCd}&bhfCode=${__branchCd}&_mid=00_01_01&_murl=L2NhL2Nyd2RmdW5kL1AvaW5pdENyd2RmdW5kRGV0YWlsLmRvP3Byb3BzZVNuPTI4'">
                                    <img src="/common/img/contents/Camp/bnr_funding_Thumbnail.jpg" alt="">
                                    <div class="funding__thumbnail--description">
                                        <h4>펀딩 참여하기</h4>
                                        <p>나는 감정노동자입니다.</p>
                                        <p>공감인</p>
                                    </div>
                                </div>
                </c:when>
            </c:choose>
                            </div>
                        </div>
                <!-- //배너영역추가2008 -->
                <div class="ui-acco type-qna" role="group" id="goalAmountUsePlanAcco">
                    <dl class="ui-acco-wrap">
                        <dt class="ui-acco-tit">
                            <button type="button" class="ui-acco-btn">모금액은 이렇게 사용됩니다.<span class="ui-acco-arrow"></span></button>
                        </dt>
                        <dd class="ui-acco-pnl">
<!--                             <p><span class="b">&lt; 사업기간 : <span id="bsnsPd"></span> &gt;</span></p> -->
                            <div id="goalAmountUsePlan" style="line-height:25px;"></div>
                        </dd>
                    </dl>
                </div>
<%--             <c:if test="${thisEndAt eq 'P'}"> --%>
                <div class="reply-wrap" id="searchAreaReply">
                    <input type="hidden" id="pageCount" name="pageCount" value="3"/>
                    <input type="hidden" id="propseSn" name="propseSn" value="${paramMap.propseSn }"/>
                    <ul class="reply-list" id="dataGridList"></ul>
                </div>

                <!-- Page Navigation Area Start -->
                <div id="dataGridPageNavi" class="paging-area"></div>
                <!-- // Page Navigation Area -->
<%--             </c:if> --%>

            </div>
        </div>
    </div>
</main>
