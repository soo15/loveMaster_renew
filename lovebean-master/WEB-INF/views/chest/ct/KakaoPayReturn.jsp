<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/ghead.jsp"%>

<script>

var resultCode = "${resultCode}";
if( resultCode == "Fail" ) {		
	var resultMsg = "${resultMessage}";
	
	if(resultMsg == "userCancel") {
		alert("구매자취소 처리 되었습니다!");	
	} else if(resultMsg == "webhookFail") {
		alert("호출 응답 실패되었으니 다시 처리하세요.");
	} else if(resultMsg == "paymentTimeExpire") {
		alert("결제 시간 초과되었습니다.");
	} else if(resultMsg == "OwnerAuthFail") {
		alert("본인 카드 인증 오류 입니다.");
	} else {
		alert(resultMsg);
	}
	
	if(window.opener != null) {
		opener.location.href = "/base.do";
	}
	
	WinClose();
	
} else {	
	var resParam;
	if("${payType}" == "recurrent") {
		resParam = new Array("${cntrSn}","${resultCode}","${resultMessage}");
	} else {
		resParam = new Array("${orderNo}","${speclMysAt}","${eventCode}","${payType}");
	}
	
	if(window.opener != null) {
		window.opener.goPayResult(resParam);
		WinClose();
	} else {
		goPayResult(resParam);
	}
}

function WinClose(){
	window.close();
	window.open('','_self').close();	
}

function goPayResult(resParam)
{
	if("${payType}" == "recurrent") {
		var param = "cntrSn="+resParam[0]+"&resultCode="+resParam[1]+"&resultMessage="+resParam[2]+"&popupYn=Y";
		location.href = "/ct/fdrmcntr/INIStdPayReturn.do?"+param;
	} else {	
		var param = "orderNo="+resParam[0]+"&speclMysAt="+resParam[1]+"&eventCode="+resParam[2]+"&payType="+resParam[3]+"&popupYn=Y";	
		location.href = "/ct/lmpscntr/NaverPayReturn.do?"+param;
	}	
}

</script>
