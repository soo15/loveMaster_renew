<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<%@ page import="com.common.util.StringUtils"%>
<%
	String speclMysAt = request.getParameter("speclMysAt");
	String eventCode = request.getParameter("eventCode");
	String mbtlnum = (String) request.getAttribute("mbtlnum");
	
	// 세션정보 없을경우 세팅
	if(StringUtils.isNull(session.getAttribute("MBTLNUM")) && !StringUtils.isNull(mbtlnum)) {
		session.setAttribute("MBTLNUM", mbtlnum);
	}
%>
<script>

$(document).ready(function(){
	
	var resultCode = "${resultCode}";	
	if( resultCode == "Fail" ) {		
		var resultMsg = "${resultMessage}";
		alert(resultMsg);
		
		location.href = "/base.do";		
	} else {
		var param = {
			"orderNo" :"${orderNo}"
		}
		gf_send("/ct/lmpscntr/getInipayData.do", param , callback );
	}
	
	function callback( json ) {
		console.log( json );
		$(".seo-box").find("td").each( function() {
			var id = $(this).attr("id");
			console.log(id );
			$("#"+id).text( json.detailInfo[id] ); 
		});
		console.log( "완료!!!!!!!!!!!!!!!!!!!!!!!!");
	}
});

function replyAdd() {
	var speclMysAt = '<%=speclMysAt%>';
	if( speclMysAt == "Y" ) {
		if( $.trim( $("#chargerNm").val() ) == "" ) {
			alert("기부자명을 입력해주세요");
			$("#chargerNm").focus();
			return false;
		}    
		if( $.trim( $("#chargerPw").val() ) == "" ) {
			alert("비밀번호를 입력해주세요");
			$("#chargerPw").focus();
			return false;
		}
		if( $.trim( $("#answerCn").val() ) == "" ) {
			alert("메세지를 입력해주세요");
			$("#answerCn").focus();
			return false;
		}    
		
		if( confirm("등록 하시겠습니까?") ) {
			var param = {
				"answerCn": $("#answerCn").val()
				,"chargerNm": $("#chargerNm").val()
				,"chargerPw": $("#chargerPw").val()
				,"eventCode": "<%= eventCode %>"
			}
			gf_send("/ct/lmpscntr/insertTHP_FundMysAnswer.do", param , answer );
		}
	} else {
		location.href = "/base.do";	
	}
}

function answer(json) {
	if( json.result > 0 ) {
		alert("저장 되었습니다");
		location.href = "/base.do";
		return false;
	} else {
		alert("저장 실패했습니다 \n다시 시도 해주세요 ");
		return false;
	}
}

function keyEvent() {
	//숫자만 입력가능
	$("input:text[numberOnly]").on("keyup keydown", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });		
}

</script>

<main class="base-main" id="baseMain">
	<div class="contents-area">
		<div class="seo-box">
			<div class="payment-head">
				<h2 class="payment-tit"><span class="text-line-mobile">회원님의</span>기부결제가<span class="color-type1"> 완료되었습니다.</span></h2>
				<p class="payment-sub-text">사회복지공동모금회 기부에 참여해주셔서 대단히 감사합니다.</p>
				<i class="icon-payment"></i>
			</div>
			<h2 class="table-tit">기부자 정보</h2>
			<div class="tb-type_a mb-type">
				<table>
					<caption>기부자 정보 입니다.</caption>
					<colgroup>
						<col class="col-s">
						<col class="col-auto">
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">성명</th>
						<td id="nm"></td>
					</tr>
					<tr>
						<th scope="row">휴대폰번호</th>
						<td id="mbtlnum"></td>
					</tr>
					</tbody>
				</table>
			</div>
	
			<h2 class="table-tit">기부내역 정보</h2>
			<div class="tb-type_a mb-type">
				<table>
					<caption>기부내역 정보 입니다.</caption>
					<colgroup>
						<col class="col-s">
						<col class="col-auto">
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">기부금액</th>
						<td class="color-type1" id="cntrAmount"></td>
					</tr>
					<tr>
						<th scope="row">지불결제수단</th>
						<td id="metpaySeNm"></td>
					</tr>
					<tr>
						<th scope="row">승인날짜</th>
						<td id="nowDate"></td>
					</tr>
					<tr>
						<th scope="row">승인시간</th>
						<td id="nowTime"></td>
					</tr>
					</tbody>
				</table>
			</div>
			
<% if( "Y".equals( speclMysAt ) ) { %>
<!-- 			<div class="seo-box"> -->
                      <div class="end-funding-area">
                          <div class="funding-img">
                              <p class="hide">어른이 되어가는 너의 여정을 응원해!</p>
                          </div>
                          
                          <!-- <h2 class="table-tit">댓글쓰기</h2>
                          <div class="reply-wrap type-write">
                              <div class="reply-list">
                                  <div class="reply-item">
                                      <div class="reply-name">
                                          <label for="chargerNm">기부자명</label>
                                          <input type="text" class="inp-base" id="chargerNm" name="chargerNm">

                                          <label for="chargerPw">비밀번호</label>
                                          <input type="password"  placeholder="숫자 6자리" class="inp-base" id="chargerPw" name="chargerPw" numberOnly maxlength="6">

                                      </div>
                                      <p class="donation-guide-txt">* 기부하신분에 한하여 댓글이 가능합니다. 기부시 입력했던 기부자명과 비밀번호를 설정해주세요.</p>
                                      <div class="reply-text">
                                          <textarea class="inp-base" name="answerCn" id="answerCn" cols="30" rows="10" placeholder="펀드 기부를 해주셔서 감사드립니다.&#13;&#10; 여기에 지금 바로 응원의 메시지를 남겨주세요. 댓글은 500자까지만 가능하며, 기부하셨던 분에 한해서만 댓글을 남기실 수 있습니다."></textarea>
                                      </div>
                                  </div>
                              </div>
                          </div> -->
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

                      </div>
<!-- 			</div> -->
<% } %>
	
			<div class="btn-area">
				<button type="button" class="btn-base-imp" onclick="javascript:replyAdd();">확인</button>
			</div>
		</div>
	</div>
</main>