<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.inicis.std.util.ParseUtil"%>
<%@ page import="com.inicis.std.util.SignatureUtil"%>
<%@ page import="com.inicis.std.util.HttpUtil"%>
<%@ page import="java.util.*"%>
<%
	Map<String, String> resultMap = new HashMap<String, String>();
	Map<String,String> paramMap = new Hashtable<String,String>();
	
	String speclMysAt = null;
	String resultCode = "";
	String chk_message = "";
	
	try{
		//#############################
		// 인증결과 파라미터 일괄 수신
		//#############################
		request.setCharacterEncoding("UTF-8");
		Enumeration elems = request.getParameterNames();
		String temp = "";
		while(elems.hasMoreElements())
		{
			temp = (String) elems.nextElement();
			paramMap.put(temp, request.getParameter(temp));
		}
		System.out.println("paramMap : "+ paramMap.toString());
		speclMysAt = paramMap.get("speclMysAt");
		resultCode = paramMap.get("resultCode");
		// validator
		String chk_result = (String) request.getAttribute("chk_result");
		if("Fail".equals(chk_result)) {
			resultCode = "9999";
			chk_message = (String) request.getAttribute("chk_message");
		}
		
		//#####################
		// 인증이 성공일 경우만
		//#####################
		if("0000".equals(resultCode)){
			System.out.println("####인증성공/승인요청####");
			//############################################
			// 1.전문 필드 값 설정(***가맹점 개발수정***)
			//############################################
			
			String mid 		= paramMap.get("mid");						// 가맹점 ID 수신 받은 데이터로 설정
// 			String signKey	= (String) request.getAttribute("signKey");
			String signKey	= paramMap.get("id");
			System.out.println("signKey =========" + signKey);
			System.out.println("speclMysAt =========" + speclMysAt);
			
			String timestamp= SignatureUtil.getTimestamp();				// util에 의해서 자동생성
			String charset 	= "UTF-8";								    // 리턴형식[UTF-8,EUC-KR](가맹점 수정후 고정)
			String format 	= "JSON";								    // 리턴형식[XML,JSON,NVP](가맹점 수정후 고정)
			String authToken= paramMap.get("authToken");			    // 취소 요청 tid에 따라서 유동적(가맹점 수정후 고정)
			String authUrl	= paramMap.get("authUrl");				    // 승인요청 API url(수신 받은 값으로 설정, 임의 세팅 금지)
			String netCancel= paramMap.get("netCancelUrl");			 	// 망취소 API url(수신 받은 값으로 설정, 임의 세팅 금지)
			String ackUrl 	= paramMap.get("checkAckUrl");			    // 가맹점 내부 로직 처리후 최종 확인 API URL(수신 받은 값으로 설정, 임의 세팅 금지)		
			String merchantData = paramMap.get("merchantData");			// 가맹점 관리데이터 수신
			
			//#####################
			// 2.signature 생성
			//#####################
			Map<String, String> signParam = new HashMap<String, String>();

			signParam.put("authToken",	authToken);		// 필수
			signParam.put("timestamp",	timestamp);		// 필수

			// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
			String signature = SignatureUtil.makeSignature(signParam);

      		String price = "";  // 가맹점에서 최종 결제 가격 표기 (필수입력아님)
		    // 1. 가맹점에서 승인시 주문번호가 변경될 경우 (선택입력) 하위 연결.  
		    // String oid = "";             
			//#####################
			// 3.API 요청 전문 생성
			//#####################
			Map<String, String> authMap = new Hashtable<String, String>();

			authMap.put("mid"			    ,mid);			  // 필수
			authMap.put("authToken"		,authToken);	// 필수
			authMap.put("signature"		,signature);	// 필수
			authMap.put("timestamp"		,timestamp);	// 필수
			authMap.put("charset"		  ,charset);		// default=UTF-8
			authMap.put("format"		  ,format);		  // default=XML
      		//authMap.put("price" 		,price);		    // 가격위변조체크기능 (선택사용)
      
			System.out.println("##승인요청 API 요청##");

			HttpUtil httpUtil = new HttpUtil();

			try{
				//#####################
				// 4.API 통신 시작
				//#####################
				String authResultString = "";
				authResultString = httpUtil.processHTTP(authMap, authUrl);
				//############################################################
				//5.API 통신결과 처리(***가맹점 개발수정***)
				//############################################################
				String test = authResultString.replace(",", "&").replace(":", "=").replace("\"", "").replace(" ","").replace("\n", "").replace("}", "").replace("{", "");
				resultMap = ParseUtil.parseStringToMap(test); //문자열을 MAP형식으로 파싱
				
			} catch (Exception ex) {
				System.out.println(ex);
				//#####################
				// 망취소 API
				//#####################
				String netcancelResultString = httpUtil.processHTTP(authMap, netCancel);	// 망취소 요청 API url(고정, 임의 세팅 금지)
			}
		}else{
			if(!"Fail".equals(chk_result)) 
				chk_message = paramMap.get("resultMsg");
		}

	}catch(Exception e){

		System.out.println(e);
	}
%>
<%@ include file="../../include/ghead.jsp"%>
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
						<td class="color-type1" id="cntrAmount"><%=resultMap.get("TotPrice")%></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th scope="row">결제일(이체일)</th> -->
<!-- 						<td id="cntrBgnmt"></td> -->
<!-- 					</tr> -->
					<tr>
						<th scope="row">지불결제수단</th>
						<td id="metpaySeNm"></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th scope="row">카드번호(계좌은행)</th> -->
<!-- 						<td id="metpayNo"></td> -->
<!-- 					</tr> -->
					<tr>
						<th scope="row">승인날짜</th>
						<td id="nowDate"></td>
					</tr>
					<tr>
						<th scope="row">승인시간</th>
						<td id="nowTime"></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<th scope="row">할부기간</th> -->
<!-- 						<td id="periodNm"></td> -->
<!-- 					</tr> -->
					</tbody>
				</table>
			</div>
			
			<!-- C : 클라우드 펀딩 댓글 , S : 특별모금 댓글 숨김 -->
			<% if( "C".equals( speclMysAt ) ) { %>
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
			</div>
				
			<div class="btn-area">
				<button type="button" class="btn-base-imp" onclick="javascript:replyAdd();">확인</button>
			</div>
		</div>
	</div>
</main>

<script>
$(document).ready(function(){
	var resultCode = "<%= resultCode %>";
	console.log( resultCode );
	if( resultCode == "0000" ) {
		var param = {
			"orderNo" :"<%= resultMap.get("MOID")	%>"			//주문번호
			,"inicisCrtfcNo":"<%= resultMap.get("tid") %>"	//tid
			,"resultCode": "<%=resultMap.get("resultCode")%>"
			,"resultMsg": "<%=resultMap.get("resultMsg")%>"
			,"TotPrice": "<%=resultMap.get("TotPrice")%>"
			,"CARD_Quota": "<%=resultMap.get("CARD_Quota")%>"
			,"CARD_Code": "<%=resultMap.get("CARD_Code")%>"
			,"CARD_Num": "<%=resultMap.get("CARD_Num")%>"
		};
		gf_send("/ct/lmpscntr/insert.do", param , insertCallback );
	} else {
		var resultMsg = "<%= chk_message %>";
		alert(resultMsg);
		
		location.href = "/base.do";	
	}
});

function insertCallback( json ) {
	var param = {
 		"orderNo":'<%= resultMap.get("MOID") %>'
	}
	gf_send("/ct/lmpscntr/getInipayData.do", param , callback );
}
function callback( json ) {
	$(".seo-box").find("td").each( function() {
		var id = $(this).attr("id");
		$("#"+id).text( json.detailInfo[id] ); 
	});
}

function replyAdd() {
	var speclMysAt = '<%=speclMysAt%>';
	if( speclMysAt == "C" ) {
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
				,"eventCode": "<%= paramMap.get("eventCode") %>"
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
