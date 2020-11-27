<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<script>

$(document).ready(function(){
	
	var resultCode = "${resultCode}";	
	if( resultCode == "Fail" ) {		
		var resultMsg = "${resultMessage}";
		alert(resultMsg);		
		pageMove();
	} else {	
		var param = {
			"cntrSn" :"${cntrSn}"
		};
		gf_send("/ct/fdrmcntr/payInfo.do", param , callback );	
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

function pageMove() {
	if("${popupYn}" == "Y") {
		WinClose();
	} else {
		location.href = "/base.do";
	}
}

function WinClose(){
	window.close();
	window.open('','_self').close();	
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
	
			<div class="btn-area">
				<button type="button" class="btn-base-imp" onclick='javascript:pageMove();'>확인</button>
			</div>
		</div>
	</div>
</main>