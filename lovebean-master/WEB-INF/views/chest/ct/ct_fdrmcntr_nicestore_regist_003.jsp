<!--
	########################### 정기기부 착한가게 ###########################
-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>
<%@ include file="../../common/iniPay/INIStdPayRequest.jsp"%>
<!-- 네이버페이 -->
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<script type="text/javascript">

var url = "/ct/fdrmcntr";
var param={};
var _compayCheckFlag = false;
var _tabClickIdx=0;
var _speclMysAt = "${speclMysAt}";	//이벤트 여부
var _eventCode = "${eventCode}";
var _myscl = "${myscl}";
var __branchCd = $.cookie('__branchCd');
var _mobileCheck = "PC"; //모바일 체크
var _path = "<%=path%>";

	//웹 & 모바일 체크
	$(document).ready(function(){
		$(".base-wrap").removeClass();
		var userAgent = navigator.userAgent;
		if( userAgent.toLowerCase().indexOf( "mobile" ) >= 0 ) {
			_mobileCheck = "mobile";
		} 
	});

    $(document).ready(function(){
    	_common.addBlockEvent();
    	$(".base-wrap").removeClass();
    	keyEvent();	//숫자만 입력가능
    	makeSelectBox();
    	radioEvent('metpaySe');
    	radioEvent('certification');
		$(".field-wrap ul li").hide();
		$("[data-action]").trigger("click");

		if( _path.indexOf("localhost") > -1 ) {
			setTestData();
		}
		// 직접입력 감추기
    	//$('[data-action=direct]').hide();
    	//$("button[data-action]:first").trigger("click");
    	
		// 미사용 기부방식선택 감추기 
    	$("#radiopay04").hide();	//네이버페이
    	$("#radiopay05").hide();	//카카오페이
    });

    $(document).on("click", "#btnCounsel", function(e){
    	e.preventDefault();
        var id = $(this).attr("id");
        if( id == "btnCounsel" ) $(".sb-box").toggle();
    });

    /*===========================================================
     * 착한가게 자세히보기 버튼 클릭시 Function !!
     *===========================================================*/
    $(document).on("click", "#btnMore", function(e){

        gf_submitMovePage("<c:url value='/ct/cntrpt/initNicestore.do' />", "" );

    });

    $(document).on("click", "#searchZipCode , #checkPlus , #btnInsert , #arsCheck , #btnCompanyInsert ,#companyCheckPlus , #accountCheck", function(e){
        e.preventDefault();
        var id = $(this).attr("id");
        if( id == "searchZipCode") {
        	openZipCode('zip','adres1');
        }
        //개인기부 본인인증
        if( id == "checkPlus") {
        	window.name='mainPopup';
        	fnPopup();
        }
        if( id == "arsCheck") {
        	arsCheck();
        }
        //계좌인증
        if( id == "accountCheck" ) {
        	accountCheck();
        }
        //기업기부 본인인증
        if( id == "companyCheckPlus") {
        	_compayCheckFlag = true;
        	window.name='mainPopup';
        	fnPopup();
        }

        if( id == "btnInsert") {
        	if( !validator() ) return;
        	if( confirm("기부 하시겠습니까?") ) {
        		var metpaySe= $(':radio[name="metpaySe"]:checked').val();
        		// 네이버페이
        		if( metpaySe == "04" ) {
        			makeFormData();   
            		var data = $('form[name="frm"]').serialize();        			
        		   	gf_send("<c:url value='" + url + "/getNaverpayProperties.do' />", data );
        		 // 카카오페이
        		} else if( metpaySe == "05" ) {
        			makeFormData();   
            		var data = $('form[name="frm"]').serialize();
        			gf_send("<c:url value='" + url + "/insertTHP_KakaopayLog.do' />", data , insertKpayLogCallback );
        		
        		} else {
        			makeFormData();
        			gf_sendFileForm("frm");
        		}
        	}
        }

        if( id == "btnCompanyInsert" ) {
        	if( !companyValidator() ) return;
        	if( confirm("상담 신청 하시겠습니까?") ) {
        		var chk = $("input:checkbox[name='agreeInfoCompany']").is(":checked");
        		var telno = $("#companyPhone1").val() + "" +  $("#companyPhone2").val() + "" +  $("#companyPhone3").val();
        		$("#hidBhfCode").val( $("#bhfCode option:checked").val() );
        		$("#hidComNm").val( $("#companyNm").val() );
        		$("#hidTelno").val( telno );
        		$("#hidAgreAt").val( ( chk == true ? "Y" : "N" )  );
        		$("#reqstCn").val($("#reqstCnView").val());
//         		var code="0001";
//         		if( _tabClickIdx == 1 ) code = "0002";
//         		else if( _tabClickIdx == 2 ) code = "0003";
//         		$("#companyFrm > input[name=reqstManageTy]").val( code );
        		gf_sendForm("companyFrm" , url + "/insertCompany.do" );
        	}
        }
    });

    $(document).on("click", "[data-action]", function(e){
        e.preventDefault();
        var action = $(this).data("action");
        var price = $(this).attr("price");
        if( action == "direct" ) {
        	$("#cntrAmount").attr("readonly" , false);
        	$("#cntrAmount").val("");
        } else {
        	$("#cntrAmount").attr("readonly" , true);
        	$("#cntrAmount").val(price);
        }
    });

    $(document).on("change", "#intrstRealm", function(e){
    	var idx = $("#intrstRealm option").index( $("#intrstRealm option:selected") );
    	$(".field-wrap ul li").hide();
    	if( idx == 0 ) return;
    	$(".field-wrap ul li:eq('" + ( idx -1 ) + "')").show();
    });

    function getNaverpayPropertiesAfter(data) {    	
    	var cntrAmount = uncomma ( $("#cntrAmount").val() );
		var oPay = Naver.Pay.create({
		    "payType" : "recurrent",
		    "mode" : "${_mode}", 		// development or production
		    "clientId": "${_clientId}", // clientId
		    "chainId": data.chainId, 	// chainId
		    "openType": "popup",
		    "onAuthorize" : function(oData) {        
		        if(oData.resultCode === "Success") {
		        	$("#reserveId").val(oData.reserveId);
		        	$("#tempReceiptId").val(oData.tempReceiptId);
		        	
		        	makeFormData();
	        		gf_sendFileForm("frm");
	        		
		        } else {		        	
		        	if(oData.resultMessage === "userCancel") {
		    			alert("구매자취소 처리 되었습니다.");	
		    		} else if(oData.resultMessage === "webhookFail") {
		    			alert("호출 응답 실패되었으니 다시 처리하세요.");
		    		} else if(oData.resultMessage === "paymentTimeExpire") {
		    			alert("결제 시간 초과되었습니다.");
		    		} else if(oData.resultMessage === "OwnerAuthFail") {
		    			alert("본인 카드 인증 오류 입니다.");
		    		} else {
		    			alert(oData.resultMessage);
		    		}  
		        }
		    }
		});
		
		oPay.open({ // Pay Reserve Parameters를 참고 바랍니다.
	          "actionType" : "${_actionType}",
	          "productCode": $("#eventCode option:checked").val() +""+ $("#cntrBgnmtY option:checked").val() +""+ $("#cntrBgnmtM option:checked").val() +""+ cntrAmount,
	          "productName": "사랑의열매 정기기부",
	          "totalPayAmount": Number(cntrAmount),
	          "returnUrl": _path+url+"/NpayAuthReturn.do?orderNo="+data.timestamp
	        });
    	
    }

	function insertKpayLogCallback( data ) {
    	
		// check validator
    	if(data.chk_result == "Fail") {
    		alert(data.chk_message);
    		return;
    	}
		
    	if(data.result_cnt <= 0) {    		
    		alert("카카오페이 정보 가져오기 실패했습니다. 다시 시도 바랍니다.");
    		return;
    	}
    	
    	var next_redirect_url;
    	if( _mobileCheck == "PC" ) {
    		next_redirect_url = data.next_redirect_pc_url;
    	} else {
    		next_redirect_url = data.next_redirect_mobile_url;
    	}
    	
    	if(gf_isNull(next_redirect_url)) {
			alert("올바른 접속경로가 아닙니다!");
    		return;
		}    	
    	
    	$("#timestamp").val( data.timestamp );
    	    	
    	gf_openWin(next_redirect_url);
    	
    }
    
    function insertAfter(data) {
    	var result = data.result;
    	if( result.indexOf("success_") == 0 ) {
    		var a = result.lastIndexOf("_");
    		var cntrSn = result.substring( a + 1  , result.length );
    		location.href = url + "/INIStdPayReturn.do?cntrSn=" + cntrSn;
    	} else {
    		$("#timestamp").val( data.timestamp );
    		alert( data.result );
    		return;
    	}
    }

    function insertCompanyAfter( data ) {
    	if( data.result > 0 ) {
    		alert("상담신청이 완료 되었습니다");
    		location.href = url + "/initNicestore.do";
    		return false;
    	}
    }

    function arsCheck() {
    	if( $.trim( $("#arsPhone1").val() ).length == 0 ) {
    		alert("휴대폰 번호를 입력해주세요");
    		$("#arsPhone1").focus();
    		return false;
    	}
    	if( $.trim( $("#arsPhone2").val() ).length == 0 ) {
    		alert("휴대폰 번호를 입력해주세요");
    		$("#arsPhone2").focus();
    		return false;
    	}
    	if( $.trim( $("#arsPhone3").val() ).length == 0 ) {
    		alert("휴대폰 번호를 입력해주세요");
    		$("#arsPhone3").focus();
    		return false;
    	}
    	if( $.trim( $("#acnutno").val() ).length == 0 ) {
    		alert("계좌번호를 입력해주세요");
    		$("#acnutno").focus();
    		return false;
    	}
    	if( $.trim( $("#dpstr").val() ).length == 0 ) {
    		alert("예금주를 입력해주세요");
    		$("#dpstr").focus();
    		return false;
    	}
    	if( confirm("인증 하시겠습니까?") ) {
    		var yy= $('select[name="yy"]').val();							//생년월일 년
    	    var mm= $('select[name="mm"]').val();							//생년월일 월
    	    var dd= $('select[name="dd"]').val();							//생년월일 일
    	    var brthdy = yy + "" + mm + "" + dd;
    		param = {
    				"dpstr"       : $("#dpstr").val()			//예금주
    				, "brthdy"    : brthdy					//생년월일
    				, "acnutBank" : $("#acnutBank option:checked").text()	//은행
    				, "acnutno"   : $("#acnutno").val()		//계좌번호
	    			, "arsPhone1" : $("#arsPhone1").val()
	    			, "arsPhone2" : $("#arsPhone2").val()
	    			, "arsPhone3" : $("#arsPhone3").val()
	    		}
	    	gf_send( url + "/arsCheck.do", param );
    	}
    }

    function arsCheckAfter( data ) {
    	if( data.result.result == "00" ) {
    		$("#arsResult").val("Y");
    		$("#authReqNumber").val( data.result.authReqNumber);
    		alert("인증 되었습니다.");
    	} else {
    		alert( arsResultCode( data.result.result ) );
    	}
    }

    function accountCheck() {
    	if( $.trim( $("#acnutno").val() ).length == 0 ) {
    		alert("계좌번호를 입력해주세요");
    		$("#acnutno").focus();
    		return false;
    	}
    	param = {
    			"bank_cd": $("#acnutBank option:checked").val()
    			, "acct_no": $("#acnutno").val()
    			};
    	if( confirm("인증 하시겠습니까?") ) {
    		gf_send( url + "/accountCheck.do", param );
    	}
    }

    function accountCheckAfter(data ) {
    	if( data.result.reply == "0000" ) {
    		$("#accountResult").val("Y");
    		alert("정상처리 되었습니다");
    	}else {
    		alert(data.result.reply_msg);
    	}
    }

    function keyEvent() {
		//숫자만 입력가능
		$("input:text[numberOnly]").on("keyup keydown", function() {
            $(this).val($(this).val().replace(/[^0-9]/g,""));
        });

		$("#cntrAmount").on( "keyup keydown", function() {
			inputNumberFormat(this);
		});
	}

    function success( obj ) {
    	var sname = obj.sName;
    	var mobileNo = obj.sMobileNo;
    	var result = obj.result;
    	var a,b,c,m = mobileNo;

    	if( m.length > 0 ) {
	    	if( m.length > 10 ) {
	    		a=m.substring(0,3);
	    		b=m.substring(3,7);
	    		c=m.substring(7);
	    	} else {
	    		a=m.substring(0,3);
	    		b=m.substring(3,6);
	    		c=m.substring(6);
	    	}
    	}
    	if( !_compayCheckFlag ) {
    		$("#nm").val(sname);
	    	$("#phone1").val(a);
	    	$("#phone2").val(b);
	    	$("#phone3").val(c);
	    	$("#result").val(result);
	    	
	    	var birth = obj.sBirthDate;
			//생년월일
			if( birth != "" && birth != null ) {
				$("#yy option[value='" + birth.substring(0,4) + "']").prop("selected","selected");
				$("#mm option[value='" + birth.substring(4,6) + "']").prop("selected","selected");
				$("#dd option[value='" + birth.substring(6,8) + "']").prop("selected","selected");		
			}
			_common.makeSelectLayout();
    	} else {
    		$("#companyNm").val(sname);
    		$("#companyPhone1").val(a);
	    	$("#companyPhone2").val(b);
	    	$("#companyPhone3").val(c);
	    	$("#companyResult").val(result);
    	}
    	_compayCheckFlag = false;
    }

    function fail() {
    	_compayCheckFlag = false;
    	alert("본인인증이 실패하였습니다.");
    }

	function makeFormData() {
		var metpaySe= $(':radio[name="metpaySe"]:checked').val();					//기부방식
	    var rciptReqstAt= $(':radio[name="rciptReqstAt"]:checked').val();			//영수증 신청 여부
	    var certification = $(':radio[name="certification"]:checked').val(); 		//자동이체추가인증
	    var ihidnumBizno;
	    if( _tabClickIdx == 0 )
	    	ihidnumBizno = $("#jumin1").val() + "" + $("#jumin2").val();
	    else
	    	ihidnumBizno = $("#bizNo1").val() + "" + $("#bizNo2").val() + "" + $("#bizNo3").val();

	    var yy= $('select[name="yy"]').val();							//생년월일 년
	    var mm= $('select[name="mm"]').val();							//생년월일 월
	    var dd= $('select[name="dd"]').val();							//생년월일 일
	    var brthdy = yy + "" + mm + "" + dd;
	    $("#brthdy").val( brthdy );

	    var adres = $("#adres1").val() + " " + $("#adres2").val();						//주소 + 상세주소
	    $("#adres").val( adres );

	    var mbtlnum = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
	    $("#mbtlnum").val( mbtlnum );

		if( rciptReqstAt == "Y" ) {
			$("#ihidnumBizno").val( ihidnumBizno );
			var email = $("#email1").val() + "@" + $("#email2").val();				//이메일
		    $("#email").val( email );
		}

	    var cntrBgnmt = $("#cntrBgnmtY option:checked").val() + "" + $("#cntrBgnmtM option:checked").val();
    	$("#cntrBgnmt").val( cntrBgnmt );										//기부시작월
    	$("#cntrEndmt").val("999999");											//기부종료월

	    //신용카드
	    if( metpaySe == "01" ) {
	    	$("#cntrTransfrDe").val( $("#cntrTransfrDe1").val() );				//결제일 지정
	    	var mm = $('#cardExpdateM option:checked').val();
	    	var yy = $('#cardExpdateY option:checked').val();
	    	$("#cardExpdate").val( mm + "/" + yy );								//카드유효기간
	    	onlineDtClean();
	    }
	    //온라인계좌이체
	    if( metpaySe == "03" ) {
	    	$("#cntrTransfrDe").val( $("#cntrTransfrDe2").val() );				//결제일 지정
	    	cardDtClean();
	    }
	  	//네이버페이
	    if( metpaySe == "04" || metpaySe == "05" ) {
	    	$("#cntrTransfrDe").val( $("#cntrTransfrDe1").val() );				//결제일 지정
	    	onlineDtClean();
	    	cardDtClean();
	    }

		$("#sign").val( sign.toDataURL() );

	    //개인정보 수집
	    var arr=[];
		$('input[name="agreeInfo"]').each(function(i) {
			var chk = $("input:checkbox[name='agreeInfo']").eq(i).is(":checked");
			if( i==0 ) arr = ( chk == true ? "Y" : "N" );
			else arr = arr + "-" + ( chk == true ? "Y" : "N" );
		});
		$("#agree_arr").val( arr );
		
		$("#jihoe").val( $("#eventCode option:checked").attr("bhfcode")  );
	}

	function validator() {
    	var metpaySe= $(':radio[name="metpaySe"]:checked').val();				//기부방식
    	var rciptReqstAt= $(':radio[name="rciptReqstAt"]:checked').val();		//영수증 신청 여부
    	var certification = $(':radio[name="certification"]:checked').val(); 		//자동이체추가인증

    	if( $.trim( $("#eventCode option:checked").val() ).length == 0 ) {
    		alert("희망지역을 선택해주세요");
    		$("#eventCode").focus();
    		return false;
    	}
    	if( $.trim( $("#cntrAmount").val() ).length == 0 ) {
    		alert("금액을 선택해주세요");
    		$("#cntrAmount").focus();
    		return false;
    	}
        if( $.trim( $("#result").val() ) == "N" ) {
            alert("본인인증을 해주세요");
            $("#checkPlus").focus();
            return false;
        }
    	if( $.trim( $("#nm").val() ).length == 0 ) {
    		alert("이름을 입력해주세요");
    		$("#nm").focus();
    		return false;
    	}
    	if( $.trim( $("#zip").val() ).length == 0 ) {
    		alert("우편번호를 입력해주세요");
    		$("#zip").focus();
    		return false;
    	}
    	if( $.trim( $("#adres1").val() ).length == 0 ) {
    		alert("주소를 입력해주세요");
    		return false;
    	}
    	if( $.trim( $("#adres2").val() ).length == 0 ) {
    		alert("상세주소를 입력해주세요");
    		$("#adres2").focus();
    		return false;
    	}
    	if( rciptReqstAt == "Y" ) {

    		if( _tabClickIdx == 0 ) {
	    		if( $.trim( $("#jumin1").val() ).length == 0) {
	    			alert("주민번호를 입력해주세요");
	    			$("#jumin1").focus();
	    			return false;
	    		}
	    		if( $.trim( $("#jumin2").val() ).length == 0) {
	    			alert("주민번호를 입력해주세요");
	    			$("#jumin2").focus();
	    			return false;
	    		}
    		} else {
    			if( $.trim( $("#bizNo1").val() ).length == 0) {
	    			alert("사업자번호를 입력해주세요");
	    			$("#bizNo1").focus();
	    			return false;
	    		}
    			if( $.trim( $("#bizNo2").val() ).length == 0) {
	    			alert("사업자번호를 입력해주세요");
	    			$("#bizNo2").focus();
	    			return false;
	    		}
    			if( $.trim( $("#bizNo3").val() ).length == 0) {
	    			alert("사업자번호를 입력해주세요");
	    			$("#bizNo3").focus();
	    			return false;
	    		}
    		}
    	}

    	if( $.trim( $("#bplcNm").val() ).length == 0) {
			alert("사업자명을 입력해주세요");
			$("#bplcNm").focus();
			return false;
		}

    	var cntrBgnmt = $("#cntrBgnmtY option:checked").val() + "" + $("#cntrBgnmtM option:checked").val();
    	var today = new Date();
    	var nowDate = today.getFullYear() + "" + zeroSum( parseInt( today.getMonth() ) + 1 );
    	var cntrAmount = uncomma ( $("#cntrAmount").val() );
    	var moneyOnlyNumeric = cntrAmount;

		if( nowDate > cntrBgnmt ) {
			$("#cntrBgnmtM").focus();
			alert("기부 시작월을 확인해주세요");
			return false;
		}

    	if( metpaySe == "01" ) {
    		if( $.trim( $("#cardNo").val() ).length == 0) {
    			alert("카드번호를 입력해주세요");
    			$("#cardNo").focus();
    			return false;
    		}
    		if( moneyOnlyNumeric < 30000 ){
    			alert("수수료 문제로 인해 30,000원 이하 기부금은 처리할 수 없습니다.\n\n30,000원 이상 기부를 부탁드립니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    		if( moneyOnlyNumeric > 10000000 ){
    			alert("신용카드 기부가능액은 최대 1000만원입니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    	}
    	if( metpaySe == "03" ) {
    		if( moneyOnlyNumeric < 30000 ){
        		alert("수수료 문제로 인해 30,000원 이하 기부금은 처리할 수 없습니다.\n\n30,000원 이상 기부를 부탁드립니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
        	if( moneyOnlyNumeric > 1000000 ){
        		alert("휴대폰 기부가능액은 최대 100만원입니다.");
        		$("#cntrAmount").focus();
        		return false;
        	}
    		if( $.trim( $("#acnutno").val() ).length == 0) {
    			alert("계좌번호를 입력해주세요");
    			$("#acnutno").focus();
    			return false;
    		}
    		if( $("#accountResult").val() == "N" ) {
    			alert("계좌인증을 해주세요");
    			$("#acnutno").focus();
    			return false;
    		}
    		if( certification == "pad" ) {
        		if (sign.isEmpty()) {
    				alert("사인해 주세요!!");
    				return false;
        		}
        	}
        	if( certification == "ars" ) {
        		if( $.trim( $("#arsPhone1").val() ).length == 0) {
        			alert("ARS인증받을 휴대폰 번호를 입력해주세요");
        			$("#arsPhone1").focus();
        			return false;
        		}
        		if( $.trim( $("#arsPhone2").val() ).length == 0) {
        			alert("ARS인증받을 휴대폰 번호를 입력해주세요");
        			$("#arsPhone2").focus();
        			return false;
        		}
        		if( $.trim( $("#arsPhone3").val() ).length == 0) {
        			alert("ARS인증받을 휴대폰 번호를 입력해주세요");
        			$("#arsPhone3").focus();
        			return false;
        		}
        		if( $("#arsResult").val() == "N" ) {
        			alert("ARS인증을 해주세요.");
        			return false;
        		}
        	}
        	if( certification == "agree" ) {
        		if( $.trim( $("#txt").val() ).length == 0) {
        			alert("출금의뢰동의서를 업로드 해주세요");
        			$("#txt").focus();
        			return false;
        		}
        	}

    	}
    	
    	// 20200901 이희서 주임에게 금액제한 확인 (네이버페이)
    	if( metpaySe == "04" || metpaySe == "05" ) {
    		if( moneyOnlyNumeric < 30000 ){
    			alert("수수료 문제로 인해 30,000원 이하 기부금은 처리할 수 없습니다.\n\n30,000원 이상 기부를 부탁드립니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    		if( moneyOnlyNumeric > 10000000 ){
    			alert("기부가능액은 최대 1000만원입니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    	}
    	
    	if(!$("#agreeInfo").is(':checked')){
    		alert(" 이용에 동의해 주시길 바랍니다.");
    		$("#agreeInfo").focus();
    		return false;
    	}
    	if(!$("#agreeInfo1").is(':checked')){
    		alert("개인정보 제3자 제공에 동의해 주시길 바랍니다.");
    		$("#agreeInfo1").focus();
    		return false;
    	}
    	return true;
    }

	function companyValidator() {
    	var chk = $("input:checkbox[name='agreeInfoCompany']").is(":checked");
			if( $("#bhfCode option:checked").val() == "" ) {
				alert("상담지역을 선택해주세요");
	    		$("#bhfCode").focus();
	    		return false;
			}
			if( $.trim( $("#companyNm").val() ).length == 0 ) {
				alert("성명을 입력해주세요");
	    		$("#companyFrm #nm").focus();
	    		return false;
			}
			if( !chk ) {
				alert("개인정보 수집·이용에 동의해 주세요");
	    		$("#agreeInfoCompany").focus();
	    		return false;
			}
			if( $("#companyResult").val()  == "N" ) {
				alert("본인인증을 해주세요");
	    		return false;
		}
		return true;
    }

	function cardDtClean() {
		$("#cardNo , #cardExpdate").val("");
	}

	function onlineDtClean() {
		$("#acnutBank , #acnutno , #dpstr").val("");
	}

	function goPayResult(resParam)
	{
		var param = "cntrSn="+resParam[0]+"&resultCode="+resParam[1]+"&resultMessage="+resParam[2];
		gf_submitMovePage("<c:url value='/ct/fdrmcntr/INIStdPayReturn.do' />", param);
	}

</script>

<form name="form_chk" method="post">
	<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="<%= sEncData %>">				<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="result" id="result" value="N" />
	<input type="hidden" name="companyResult" id="companyResult" value="N" />
	<input type="hidden" name="accountResult" id="accountResult" value="N" />
	<input type="hidden" name="arsResult" id="arsResult" value="N" />
</form>

<!-- 상담신청 폼 -->
<form id="companyFrm" name="companyFrm" method="post" >
	<input type="hidden" name="bhfCode" id="hidBhfCode" />
	<input type="hidden" name="nm" id="hidComNm" />
	<input type="hidden" name="telno" id="hidTelno" />
	<input type="hidden" name="agreAt" id="hidAgreAt" />
	<input type="hidden" name="iemCode" id=""  value="02"/>
	<input type="hidden" name="reqstManageTy" id=""  value="0001"/> <!-- HP0025 -->
	<input type="hidden" name="progrsSttus" id=""  value="01"/>
    <input type="hidden" name="reqstCn" id="reqstCn" />
</form>

	<div class="sub-visual visual01_01">
		<div class="sub-title-area">
			<h2 class="heading-title-a">정기 기부</h2>
			<p class="title-sub-txt">당신의 나눔이 모두의 행복입니다.</p>
		</div>
	</div>

	<%@ include file="../../layout/breadcrumbs.jsp"%>

			<main class="base-main" id="baseMain">
				<div class="contents-area">
					<div class="contents-hd">
						<h3><strong id="eventNm">착한가게</strong><span>당신의 나눔이 모두의 행복입니다. 나눔의 힘을 믿어보세요.</span></h3>
						<div class="contents-menu-nav">
						</div>
					</div>

					<div class="seo-box">

					<form id="frm" name="frm" method="post"  enctype="multipart/form-data" action="<c:url value='/ct/fdrmcntr/insert.do' />" >
					<input type=hidden name="brthdy" 			id="brthdy" />							<!-- 생년월일 -->
					<input type=hidden name="adres" 			id="adres" />							<!-- 생년월일 -->
					<input type=hidden name="email" 			id="email" />							<!-- 이메일 -->
					<input type=hidden name="mbtlnum" 			id="mbtlnum" />							<!-- 휴대폰번호 -->
					<input type=hidden name="ihidnumBizno" 		id="ihidnumBizno" />					<!-- 영수증 신청시 주민번호 -->
					<input type=hidden name="cntrBgnmt" 		id="cntrBgnmt" />						<!-- 기부시작월 -->
					<input type=hidden name="cntrEndmt" 		id="cntrEndmt" />						<!-- 기부종료월 -->
					<input type=hidden name="cntrTransfrDe" 	id="cntrTransfrDe" />					<!-- 결제 , 이체지정일 -->
					<input type=hidden name="cardExpdate" 		id="cardExpdate" />						<!-- 카드유효기간 -->
					<input type=hidden name="chargerCnfirmAt" 	id="chargerCnfirmAt" value="N" />		<!-- 담당자 확인여부 -->
					<input type=hidden name="sign" 				id="sign" />							<!-- 생년월일 -->
					<input type=hidden name="agree_arr" 		id="agree_arr" />
					<input type=hidden name="timestamp" 		id="timestamp" value="<%=timestamp %>" >
					<input type=hidden name="authReqNumber" 	id="authReqNumber" />
					<input type=hidden name="jihoe" 			id="jihoe" />
					<input type=hidden name="reserveId" 		id="reserveId" />						<!-- 네이버페이 등록예약번호 -->
					<input type=hidden name="tempReceiptId" 	id="tempReceiptId" />					<!-- 네이버페이 임시접수번호 -->
					<input type=hidden name="payType"			id="payType"	value="recurrent" />
					
				 	<!-- S : 2019-10-28 modify -->
					<div class="area-type-a type8">
						<img src="/common/img/contents/donation-logo11.png" alt="착한가게">
						<p class="area-type-tit color-type1 mgt-xxl mgb-n">착한가게 행복이 착!착!착! 여러분의 가게에 행복을 드리겠습니다. <br>착한가게에 참여해주시면 착한가게 현판을 보내드립니다.</p>
						<p>착한가게란 중소규모의 자영업에 종사하며 매출액의 일정액을 통해 나눔을 실천하는 세상의 모든 가게를 말합니다.<br>매장을 경영하는 자영업자 또는 중소기업, 프랜차이즈, 학원, 병원등 어떠한 업종의 가게도 참여가 가능합니다. <br>규모와 종류는 다르지만 나눔을 실천하는 착한가게의 행복은 세상의 행복, 그 모든 것입니다.</p>
					</div>
					<!-- E : 2019-10-28 modify -->


						<div class="ui-tab ui-tab-type2 col-3 contents-tab mgt-xxxl" id="uiTabCCKFUNR_1">
							<div class="ui-tab-btns" btn-id="uiTabCCKFUNR_1">
								<button type="button" class="ui-tab-btn"><i>개인</i></button>
								<button type="button" class="ui-tab-btn"><i>개인사업자</i></button>
								<button type="button" class="ui-tab-btn"><i>법인사업자</i></button>
							</div>
							<div class="ui-tab-pnls" pnl-id="uiTabCCKFUNR_1">
								<section class="ui-tab-pnl">
									<h1 class="hide">개인</h1>
									<div class="tab-contents">

										<div class="donation-guide">
											<dl>
												<dt class="donation-guide-tit">기부정보확인 서비스가 완료되는데 소요되는 기간</dt>

												<dd class="donation-guide-item n1">
													<div>
														신용카드 기부
														<strong>15일 이후</strong>
													</div>
												</dd>
												<dd class="donation-guide-item n2">
													<div>
														정기이체 기부
														<strong>15일 이후</strong>
													</div>
												</dd>
											</dl>
											<p class="donation-guide-txt">기부시 <b>후원금_KG 이니시스, KG 이니시스</b>로 표시되어 청구됩니다.</p>
										</div>

										<!-- 기부방식 선택 -->
                                        <div class="donate-select mg-t-m">
											<p class="select-tit">기부방식 선택</p>
											<div class="select-radio-group">
												<span class="radio">
													<input type="radio"  name="metpaySe" id="metpaySe1" value="01" onclick="radioEvent('metpaySe');" checked >
													<label for="metpaySe1"><span>신용카드</span></label>
												</span>
												<span class="radio">
													<input type="radio" name="metpaySe" id="metpaySe2" value="03" onclick="radioEvent('metpaySe');"  checked>
													<label for="metpaySe2"><span>정기이체</span></label>
												</span>
												<span class="radio" id="radiopay04">
													<input type="radio" name="metpaySe" id="metpaySe3" value="04" onclick="radioEvent('metpaySe');" >
													<label for="metpaySe3"><span>네이버페이</span></label>
												</span>
												<span class="radio" id="radiopay05">
													<input type="radio" name="metpaySe" id="metpaySe5" value="05" onclick="radioEvent('metpaySe');" >
													<label for="metpaySe5"><span>카카오페이</span></label>
												</span>
<!-- 												<p class="select-desc">온라인계좌이체 기부시 <span>후원금_KG 이니시스, KG 이니시스</span>로 표시되어 청구됩니다.</p> -->
											</div>
										</div>
										<!-- //기부방식 선택 -->

										<!-- 01. 희망지역/기부금액 -->
										<h2 class="table-tit">01. 희망지역/기부금액</h2>
										<div class="tb-type_a mb-type">
											<table>
												<colgroup>
													<col class="col-xs">
													<col class="col-auto">
												</colgroup>
												<tbody>
												<tr>
													<th scope="row">
														<label for="eventCode">희망지역<span class="required" aria-label="필수">*</span></label>
													</th>
													<td class="hope-area">
														<div class="ui-select form-w01">
															<select class="sel_type" id="eventCode" name="eventCode" title="희망지역 선택"></select>
														</div>
														<p class="donation-guide-txt">사회복지공동모금회법에 의해 각 지역에서 모금된 성금은 <b>해당지역의 사회복지</b>를 위해 쓰여집니다.</p>
													</td>
												</tr>
												<tr>
													<th scope="row">금액<span class="required" aria-label="필수">*</span></th>
													<td>
														<div class="ui-togglebtn type-sum">
															<button type="button" class="btn-base small" data-action="" price="30,000">3만원</button>
															<button type="button" class="btn-base small" data-action="" price="50,000">5만원</button>
															<button type="button" class="btn-base small" data-action="" price="100,000">10만원</button>
															<button type="button" class="btn-base small mgl-s" data-action="direct">직접입력</button>
															<input type="text" class="inp-base ui-inpcancel" name="cntrAmount" id="cntrAmount"  title="금액직접입력"  placeholder="직접입력" readonly numberOnly maxlength="9">
															<span class="txt-mark">원</span>
														</div>
													</td>
												</tr>
												</tbody>
											</table>
										</div>
										<!-- //01. 희망지역/기부금액 -->

										<!-- 02. 기부자 정보 -->
										<h2 class="table-tit">02. 기부자 정보</h2>
										<div class="tb-type_a mb-type">
											<table>
												<colgroup>
													<col class="col-xs">
													<col class="col-auto">
												</colgroup>
												<tbody>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="phone1">휴대폰 번호<span class="required" aria-label="필수">*</span>
                                                        </label>
                                                    </th>
                                                    <td>
                                                        <div class="phone-area">
                                                            <input type="text" class="inp-base" title="휴대폰 앞자리" name="phone1" id="phone1" readonly value="">
                                                            <span class="txt-mark">-</span>
                                                            <input type="text" class="inp-base" title="휴대폰 중간자리" name="phone2" id="phone2" readonly value="">
                                                            <span class="txt-mark">-</span>
                                                            <input type="text" class="inp-base" title="휴대폰 뒷자리" name="phone3" id="phone3" readonly value="">
                                                            <button type="button" class="btn-base-imp small" id="checkPlus">인증</button>
                                                        </div>
                                                        <p class="donation-guide-txt">- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
                - 기부자 본인을 확인하기 위해서 기부자님의 본인인증이 반드시 필요합니다.</p>
                                                    </td>
                                                </tr>

												<tr>
													<th scope="row">
														<label for="nm">이름<span class="required" aria-label="필수">*</span></label>
													</th>
													<td><input type="text" class="form-w01" name="nm" id="nm" title="기부자 이름" readonly="readonly"></td>
												</tr>
												<tr>
													<th scope="row">
														<label for="yy">생년월일<span class="required" aria-label="필수">*</span></label>
													</th>
													<td>
														<div class="day-form">
															<div class="day-form-row">
																 <div class="ui-select sel_small">
																	<select class="sel_type" id="yy" name="yy" title="년 선택"></select>
																</div>
																<span class="day-txt">년</span>
															</div>
															<div class="day-form-row">
																<div class="ui-select sel_small2">
																	<select class="sel_type" id="mm" name="mm" title="월 선택"></select>
																</div>
																<span class="day-txt">월</span>
															</div>
															<div class="day-form-row">
																<div class="ui-select sel_small2">
																	<select class="sel_type" id="dd" name="dd" title="일 선택"></select>
																</div>
																<span class="day-txt">일</span>
															</div>
														</div>
													</td>
												</tr>


												<tr>
													<th scope="row">
														<label for="bplcNm">사업자명<span class="required" aria-label="필수">*</span></label>
													</th>
													<td>
														<input type="text" class="form-w01" id="bplcNm" name="bplcNm" title="사업장명">
													</td>
												</tr>
												<!-- //190920 수정 -->
												</tbody>
											</table>
										</div>
										<!-- //02. 기부자 정보 -->

										<!-- 03. 기부방식 정보설정 -->
										<h2 class="table-tit">03. 기부방식 정보설정</h2>
										<div class="tb-type_a">
											<table>
												<colgroup>
													<col class="col-xs">
													<col class="col-auto">
												</colgroup>
												<tbody>
												<tr>
													<th scope="row">
														<label for="cntrBgnmtY">기부시작월<span class="required" aria-label="필수">*</span></label>
													</th>
													<td>
														<div class="day-form">
															<div class="day-form-row">
																 <div class="ui-select sel_small">
																	<select class="sel_type" id="cntrBgnmtY" title="년 선택"></select>
																</div>
																<span class="day-txt">년</span>
															</div>
															<div class="day-form-row">
																<div class="ui-select sel_small2">
																	<select class="sel_type" id="cntrBgnmtM" title="월 선택"></select>
																</div>
																<span class="day-txt">월 부터</span>
															</div>
														</div>
													</td>
												</tr>

												<!-- 신용카드 -->
												<tr class="cardLayoutDe">
													<th scope="row">
														<label for="cntrTransfrDe1">결제일 지정<span class="required" aria-label="필수">*</span>
														</label>
													</th>
													<td>
														<div class="day-form">
															<div class="day-form-row">
																	<div class="ui-select sel_small2">
																	<select class="sel_type" id="cntrTransfrDe1" title="일 선택">
																		<option value="10">10</option>
																		<option value="25">25</option>
																	</select>
																</div>
																<span class="day-txt">일</span>
															</div>
															<p class="donation-guide-txt">매월 지정하신 날짜로 기부금액이 결제됩니다</p>
														</div>
													</td>
												</tr>
												<tr class="cardLayout">
													<th scope="row">
														<label for="cardNo">카드번호<span class="required" aria-label="필수">*</span></label>
													</th>
													<td><input type="text" class="form-w01" id="cardNo" name="cardNo" title="카드번호" maxlength="16" numberOnly ></td>
												</tr>
												<tr class="cardLayout">
													<th scope="row">
														<label for="cckfunr01_s8">카드유효기간<span class="required" aria-label="필수">*</span>
														</label>
													</th>
													<td>
														<div class="day-form">
															<div class="day-form-row">
																	<div class="ui-select sel_small2">
																	<select class="sel_type" id="cardExpdateY" name="cardExpdateY" title="카드유효기간 년 선택"></select>
																</div>
																<span class="day-txt">년</span>
															</div>
															<div class="day-form-row">
																<div class="ui-select sel_small2">
																	<select class="sel_type" id="cardExpdateM" name="cardExpdateM" title="카드유효기간 월 선택"></select>
																</div>
																<span class="day-txt">월</span>
															</div>

														</div>
													</td>
												</tr>
												<!-- //신용카드 -->

												<!-- 계좌이체 -->
												<tr class="onlineLayout">
													<th scope="row">
														<label for="cckfunr01_s11">이체일 지정<span class="required" aria-label="필수">*</span></label>
													</th>
													<td>
														<div class="day-form">
															<div class="day-form-row">
																	<div class="ui-select sel_small2">
																	<select class="sel_type" id="cntrTransfrDe2" title="일 선택">
																		<option value="10">10</option>
																		<option value="25">25</option>
																	</select>
																</div>
																<span class="day-txt">일</span>
															</div>
															<p class="donation-guide-txt">본인 명의 통장만 가능하며 2주후부터 매월 지정하신 날짜에 이체가 시작됩니다.</p>
														</div>
													</td>
												</tr>
												<tr class="onlineLayout">
													<th scope="row">
														<label for="acnutBank">계좌은행<span class="required" aria-label="필수">*</span></label>
													</th>
													<td>
														<div class="ui-select form-w01">
															<select class="sel_type" id="acnutBank" name="acnutBank" title="계좌은행 선택"></select>
														</div>
														<p class="donation-guide-txt">- CMA 통장은 자동이체가 되지 않으니 양해 바랍니다.</p>
													</td>
												</tr>
												<tr class="onlineLayout">
													<th scope="row">
														<label for="acnutno">계좌번호<span class="required" aria-label="필수">*</span></label>
													</th>
													<td>
														<input type="text" class="form-w01" name="acnutno" id="acnutno" placeholder="숫자만 입력" title="계좌번호" maxlength="20" numberOnly>
														<button type="button" class="btn-base-imp small" id="accountCheck">계좌인증</button>
													</td>
												</tr>
												<tr class="onlineLayout">
													<th scope="row">
														<label for="dpstr">예금주<span class="required" aria-label="필수">*</span></label>
													</th>
													<td><input type="text" class="form-w01" name="dpstr" id="dpstr" title="예금주"></td>
												</tr>
												<tr class="onlineLayout" class="onlineLayout">
													<th scope="row">
														<label for="dpstr">자동이체<br> 추가인증<span class="required" aria-label="필수">*</span></label>
													</th>
													<td>
														<div id="directDebitAddCert">
														<p class="donation-guide-txt">온라인 자동이체의 경우 전자금융거래법 제15조 및 동법 시행령 제 10조에 의겨해 출금동의 인증을 받도록 되었습니다.</p>
														<div class="radio-group">
															<span class="radio">
																<input type="radio" name="certification" id="certification1" value="pad" onclick="radioEvent('certification');" checked>
																<label for="certification1"><span>일반전자서명 인증</span></label>
															</span>
															<span class="radio">
																<input type="radio" name="certification" id="certification2" value="ars" onclick="radioEvent('certification');">
																<label for="certification2"><span>ARS 인증</span></label>
															</span>

															<span class="radio">
																<input type="radio" name="certification" id="certification3" value="agree" onclick="radioEvent('certification');">
																<label for="certification3"><span>출금의뢰동의서</span></label>
															</span>
														</div>

													<div class="addcert n1" id="signature-pad">
														<div class="sign-wrap">
															<canvas width="340" height="170"></canvas>
														</div>
														<p class="donation-guide-txt">마우스를 위 영역에 올린 후 클릭한 상태에서 서명해주세요.</p>
														<button type="button" class="btn-base-imp small mgt-xxs" data-action="clear">다시 서명하기</button>
														<!-- @190921 수정 -->
													</div>

													<div class="addcert n2" style="display:none" id="ars">
											<label for="arsPhone1">ARS인증받을 휴대폰 번호</label>
											<div class="phone-area">
												<input type="text" class="inp-base" title="휴대폰 앞자리" id="arsPhone1" maxlength="3" numberOnly value="">
												<span class="txt-mark">-</span>
												<input type="text" class="inp-base" title="휴대폰 중간자리" id="arsPhone2" maxlength="4" numberOnly value="">
												<span class="txt-mark">-</span>
												<input type="text" class="inp-base" title="휴대폰 뒷자리" id="arsPhone3" maxlength="4" numberOnly value="">
												<button type="button" class="btn-base-imp small" id="arsCheck">ARS 인증전화 받기</button>
											</div>
											<p class="donation-guide-txt">- 휴대폰번호로 전화가 오면 안내에 따라 인증을 진행하세요.<br>
											- 전화 인증이 끝나면 아래 추가정보를 입력하세요.</p>
										</div>
										</div>

											<div class="addcert n3" style="display:none" id="agree">
												<p class="donation-guide-txt mgt-xs mgb-xs">
													<span>출금의뢰동의서 양식을 다운받으셔서 작성후 다시 업로드 해주세요. </span>
													<a href="#" class="btn-base-bline small mgl-xs" onclick="gf_genFileExport(this);">출금의뢰동의서 다운로드</a>
													<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}' escapeXml='false' />" />
													<input id="phycFileNm" name="phycFileNm" type="hidden" value="agree.hwp" />
										         	<input id="logcFileNm" name="logcFileNm" type="hidden" value="agree.hwp" />
												</p>

												<div class="fileupload-area">
													<input type="text" class="inp-base" title="출금의로동의서 업로드" id="txt" readonly="readonly">
													<input type="file" size="30" id="file" name="attachFile1"  title="파일 찾아보기"  style="display:none;" onchange="fileOnchangeEvent(this);" />
													<button type="button" class="btn-base small" onclick="$('#file').click();">찾아보기</button>
												</div>
												<ul class="list-fileupload">
												</ul>
											</div>

													</td>
												</tr>

												<tr>
													<th scope="row">
														<label for="receiptYn1">영수증 신청 여부<span class="required" aria-label="필수">*</span>
														</label>
													</th>
													<td>
														<div class="radio-group">
															<span class="radio">
																<input type="radio" name="rciptReqstAt" id="receiptYn1" value="Y" onclick="radioEvent('rciptReqstAt');" checked>
																<label for="receiptYn1"><span>신청</span></label>
															</span>
															<span class="radio">
																<input type="radio" name="rciptReqstAt" id="receiptYn2" value="N" onclick="radioEvent('rciptReqstAt');">
																<label for="receiptYn2"><span>미신청</span></label>
															</span>
														</div>
													</td>
												</tr>

												<!-- 190920 수정 -->
												<!-- 개인 -->
												<tr id="cckfunr_per">
													<th scope="row">
														<label for="jumin1">영수증 신청  <br>주민등록번호<span class="required" aria-label="필수">*</span>
														</label>
													</th>
													<td>
														<div class="jumin-area">
															<input type="text" class="inp-base" title="주민등록번호 앞자리" name="jumin1" id="jumin1" numberOnly maxlength="6">
															<span class="txt-mark">-</span>
															<input type="password" class="inp-base" title="주민등록번호 뒷자리" name="jumin2" id="jumin2" numberOnly maxlength="7">
														</div>
														<p class="donation-guide-txt">- 기부금영수증발급을 위한 필수 정보입니다.<br>- 개인정보보호법 제2조, 사회복지공동모금회법 제18조, 소득세법 제160조의3, 소득세법시행령 제208조의 3</p>
													</td>
												</tr>
												<!-- //개인 -->

												<!-- 개인사업자 / 법인사업자 -->
												<tr id="cckfunr_bsn">
													<th scope="row">
														<label for="cckfunr01_i8_b">영수증 신청  <br>사업자등록번호<span class="required" aria-label="필수">*</span>
														</label>
													</th>
													<td>
														<div class="busnum-area">
															<input type="text" class="inp-base" title="사업자등록번호 앞자리" id="bizNo1" numberOnly maxlength="3">
															<span class="txt-mark">-</span>
															<input type="text" class="inp-base" title="사업자등록번호 중간자리" id="bizNo2" numberOnly maxlength="2">
															<span class="txt-mark">-</span>
															<input type="text" class="inp-base" title="사업자등록번호 뒷자리" id="bizNo3" numberOnly maxlength="5">
														</div>
													</td>
												</tr>
												<!-- //개인사업자 / 법인사업자 -->
												<tr>
													<th scope="row">우편번호<span class="required" aria-label="필수">*</span></th>
													<td>
														<div class="post-code">
															<input type="text" class="form-w02" name="zip" id="zip" readonly title="우편번호">
															<button type="button" class="btn-base-imp small" id="searchZipCode">우편번호 검색</button>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="adres1">
														주소<span class="required" aria-label="필수">*</span>
														</label>
													</th>
													<td>
														<input type="text" class="form-w01" readonly title="주소" name="adres1" id="adres1">
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="adres2">상세주소<span class="required" aria-label="필수">*</span></label>
													</th>
													<td>
														<input type="text" class="form-w01" title="상세주소" name="adres2" id="adres2">
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="email1">이메일</label>
													</th>
													<td>
														<div class="email-area">
															<input type="text" class="in-w03" title="이메일 아이디" name="email1" id="email1" style="ime-mode:disable;" >
															<span class="txt-mark">@</span>
															<input type="text" class="in-w03" title="이메일 도메인주소" name="email2" id="email2" style="ime-mode:disable;">
														</div>
													</td>
												</tr>

												</tbody>
											</table>
										</div>
										<!-- //03. 기부방식 정보설정 -->
									</div>
								</section>
							</div>
						</div>





						<!-- 추가정보 -->
						<h2 class="table-tit">추가정보</h2>
						<div class="tb-type_a mb-type">
							<table>
								<colgroup>
									<col class="col-xs">
									<col class="col-auto">
								</colgroup>
								<tbody>
								<tr>
									<th scope="row">
										<label for="intrstRealm">관심분야</label>
									</th>
									<td>
										<div class="ui-select form-w01">
											<select class="sel_type" id="intrstRealm" name="intrstRealm" title="관심분야 선택" >
												<c:out value="${intrstRealm}" escapeXml="false" />
											</select>
										</div>
										<div class="field-wrap">
											<ul>
												<li class="n1"><span class="hide">1. 경제적빈곤퇴치</span></li>
												<li class="n2"><span class="hide">2.  영양 및 급식지원/기아종식</span></li>
												<li class="n3"><span class="hide">3. 신체·정서적 건강과 회복</span></li>
												<li class="n4"><span class="hide">4. 교육 및 자립역량 강화
												<li class="n5"><span class="hide">5. 성평등</span></li>
												<li class="n6"><span class="hide">6. 깨끗한 물과 위생</span></li>
												<li class="n7"><span class="hide">7. 모두를 위한 깨끗한 에너지</span></li>
												<li class="n8"><span class="hide">8. 양질의 일자리만들기</span></li>
												<li class="n9"><span class="hide">9. 적정기술과 정보기술 격차 해소 지원</span></li>
												<li class="n10"><span class="hide">10. 사회적 배제 감소와 불평등 완화</span></li>
												<li class="n11"><span class="hide">11. 지속가능한 지역사회 인프라 구축</span></li>
												<li class="n12"><span class="hide">12. 지속가능한 생산과 소비</span></li>
												<li class="n13"><span class="hide">13. 기후변화 대응</span></li>
												<li class="n14"><span class="hide">14. 해양 생태계 보존</span></li>
												<li class="n15"><span class="hide">15. 육상 생태계 보호</span></li>
												<li class="n16"><span class="hide">16. 사회적 약자의 권리증진</span></li>
												<li class="n17"><span class="hide">17. 지구촌 협력</span></li>
											</ul>
										</div>
									</td>
								</tr>
								</tbody>
							</table>
						</div>
						<!-- //추가정보 -->

						<!-- 동의 -->
						<div class="terms-group">
												<span class="checkbox">
													<input type="checkbox" name="agreeInfo" id="agreeInfo">
													<label for="agreeInfo"><span>개인정보 수집 및 이용에 동의 합니다.</span></label>
												</span>
												<textarea class="inp-base" readonly="readonly" title="개인정보 수집 및 이용에 동의에 관한 정보입니다.">사회복지공동모금회(이하 “모금회”라 함)는 「개인정보 보호법」제15조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며, 고지 후 수집된 정보는 모금회의 개인정보 수집 및
이용목적외의 용도로는 절대 이용,제공되지 않습니다. 기부자는 정보주체로서 개인정보의 삭제ㆍ
처리정지 요구와 개인정보의 수집ㆍ이용 및 제공에 대한 동의 거부를 할 수 있으나, 이 경우 모금회에서 수행하는 아래의 업무와 관련된 서비스제공이 불가합니다.
  가. 기부금영수증의 발급,
  나. 소득공제를 위한 국세청 연말정산 서비스에 필요한 자료제공,
 다. 정기기부금의 CMS(금융결제원)연계 출금처리
  라. 기부자 결과보고 제공

본인은 모금회가 「개인정보 보호법」제15조제1항 및 제24조제1항제1호에 의거, 다음과 같이 본인의 개인정보 및 고유식별정보(이하 “개인정보”라 함)를 수집ㆍ이용하는 것에 대하여 동의합니다.
  가. 개인정보의 수집ㆍ이용자(개인정보처리자) : 모금회
  나. 개인정보의 수집ㆍ이용 목적  : 모금회에서 처리하는 기부금관련 업무(발급ㆍ기부내역제공 등)
  다. 개인정보의 수집ㆍ이용 항목  : 개인정보 등(성명, 주민등록번호(외국인등록번호), 연락처, 주소, 전자메일주소, 계좌번호 등)
  라. 개인정보의 보유 및 이용기간 : 1.주민등록번호 : 기부금 입금일을 기준으로 소득공제가 실시되는 기간동안, 2.기타 : 모금회가 정한 보존기간동안</textarea>
												<span class="checkbox">
													<input type="checkbox" name="agreeInfo" id="agreeInfo1">
													<label for="agreeInfo1" ><span>개인정보 제 3자 제공에 동의 합니다.</span></label>
												</span>
												<textarea class="inp-base" readonly="readonly" title="개인정보 제 3자 제공에 동의에 관한 정보입니다.">본인은 모금회가 「개인정보 보호법」제17조제1항제1호에 의거, 다음과 같이 본인의 개인정보를 제3자에게 제공하는 것에 대하여 동의합니다.
  가. 개인정보를 제공받는 자 : 기부금의 자동 출금을 위한 금융결제원, 기부내역의 소득공제 확인을 위한 국세청
  나. 개인정보를 제공받는 자의 이용 목적 : 정기기부금의 출금 및 기부금 소득공제 근거자료 활용
  다. 제공하는 개인정보의 항목 : 위 1호 다목에 해당하는 개인정보
  라. 개인정보를 제공받는 자의 보유 및 이용기간 :
       주민등록번호 : 기부금 입금일을 기준으로 소득공제가 실시되는 기간동안
     기타 : 모금회가 정한 보존기간동안</textarea>
											<div class="btn-area-r">
												<button type="button" class="btn-base-bline small" onclick="javascript:goFootPrivacy();">개인정보처리방침</button>
											</div>
										</div>
						<!-- //동의 -->

						<!-- 기부하기 -->
						<div class="btn-area">
							<button type="button" class="btn-base-bline fl-item-l" id="btnCounsel">기부상담하기</button>
							<button type="button" class="btn-base-imp counsel-open" id="btnInsert">기부하기</button>
							<button type="button" class="btn-base-line fl-item-r" id="btnMore">착한가게 소개 자세히보기</button>

						</div>
						<!-- 기부하기 -->

						<!-- S : 기부상담신청 -->
						<div id="" class="sb-box dis-none">
							<div class="sb-box-inner">
						    <p class="sb-contents-tit">기부상담신청</p>
						    <p class="sb-contents-desc">기부상담을 위해 상담받으실 분 성함과 연락처를 남겨주시면 빠른시간안에 연락드리도록 하겠습니다.</p>
						    <div class="sb-content">
						        <div class="sb-content-tbl">
						            <table>
						                <colgroup>
						                    <col class="col-l">
						                    <col class="col-auto">
						                </colgroup>
						                <tbody>
						                <tr>
						                    <th scope="row">
						                        <label for="bhfCode">상담지역</label>
						                    </th>
						                    <td>
						                        <div class="ui-select w-full">
						                            <select class="sel_type" id="bhfCode" name="bhfCode" title="상담지역 선택"></select>
						                        </div>
						                    </td>
						                </tr>
						                <tr>
						                    <th scope="row">
						                        <label for="companyNm">성명</label>
						                    </th>
						                    <td>
						                        <input type="text" class="inp-base w-full" id="companyNm" title="성명" readonly="readonly">
						                    </td>
						                </tr>
						                <tr>
						                    <th scope="row">
						                        <label for="companyPhone1">휴대폰번호<span class="required" aria-label="필수">*</span></label>
						                    </th>
						                    <td class="phone-area">
						                        <div class="table-cell ps-box">
						                            <span>
						                            	<input type="text" class="inp-base" title="휴대폰 앞자리" id="companyPhone1" readonly="readonly" numberOnly value="">
						                            </span>
						                            <span>
						                            	<input type="text" class="inp-base" title="휴대폰 중간자리" id="companyPhone2" readonly="readonly" numberOnly value="">
													</span>
						                            <span>
						                            	<input type="text" class="inp-base" title="휴대폰 뒷자리" id="companyPhone3" readonly="readonly" numberOnly value="">
													</span>
						                            <button type="button" class="btn-base-imp small" id="companyCheckPlus">인증</button>
						                        </div>
						                        <p class="table-cell">NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.</p>
						                    </td>
						                </tr>
                                        <tr>
                                            <th>상담신청내용</th>
                                            <td>
                                                <textarea class="inp-base" id="reqstCnView" name ="reqstCn"></textarea>
                                            </td>
                                        </tr>
						                </tbody>
						            </table>
                                    <!-- 동의하기 -->
                                    <div class="table-cell privacy-area">
                                        <span class="checkbox">
                                            <input type="checkbox" id="agreeInfoCompany" name="agreeInfoCompany" >
                                            <label for="agreeInfoCompany"><span>개인정보 수집‧이용에 동의합니다.</span></label>
                                        </span>
                                        <div class="tb-type_d mgt-xxs">
                                            <div class="wide-scroll">
                                                <table >
                                                    <caption>제 3자 제공에 동의</caption>
                                                    <colgroup>
                                                        <col style="width: 180px">
                                                        <col>
                                                    </colgroup>
                                                    <tbody>
                                                        <tr class="total3">
                                                            <th scope="row">수집하는 곳</th>
                                                            <td>사회복지공동모금회</td>
                                                        </tr>
                                                        <tr class="total3">
                                                            <th scope="row">항목</th>
                                                            <td>성명, 핸드폰번호</td>
                                                        </tr>
                                                        <tr class="total3">
                                                            <th scope="row">수집‧이용 목적</th>
                                                            <td>모금회에서 처리하는 상담관련 업무<br/>(기부신청, 기부내역확인, 확인서 발급, 기부자서비스)</td>
                                                        </tr>
                                                        <tr class="total3">
                                                            <th scope="row">보유기간</th>
                                                            <td>마지막 상담 시점 이후 1년</td>
                                                        </tr>
                                                      </tbody>
                                                  </table>
                                              </div>
                                         </div>
                                         <p class="txt-s mgt-xxs">☞  위의 개인정보 수집‧이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 기부상담관련 업무에 제한을 받을 수 있습니다.</p>
                                         <div class="btn-area-r">
                                                <button type="button" class="btn-base-bline small"><a href="javascript:goFootPrivacy();">개인정보처리방침</a></button>
                                         </div>
                                    </div>
                                    <!--// 동의하기 -->
						        </div>

						        <div class="btn-area">
						           <button type="button" class="btn-base-imp" id="btnCompanyInsert">상담신청</button>
						        </div>
						    </div>
						</div>
						</div>
						<!-- E : 기부상담신청 -->

						<div class="donation-guide">
							<dl>
								<dt class="donation-guide-tit">연말정산을 위한 기부금 영수증 발급이 가능한 시점이 결제수단마다 다르니 참고하세요!</dt>

								<dd class="donation-guide-item n3">
									<div>
										신용카드 기부<br>온라인계좌이체 기부
										<strong>12월 16일 이전</strong>
									</div>
								</dd>
								<dd class="donation-guide-item n4">
									<div>
										휴대폰 기부
										<strong>10월 이전</strong>
									</div>
								</dd>
								<dd class="donation-guide-item n5">
									<div>
										무통장입금 기부
										<strong>12월 31일 이전</strong>
									</div>
								</dd>
							</dl>
							<p class="donation-guide-txt">기부시 <b>후원금_KG 이니시스, KG 이니시스</b>로 표시되어 청구됩니다.</p>
						</div>

						<div class="donation-bn">
							<a href="#">
								<img src="/common/img/contents/bn_donation.png" srcset="/common/img/contents/bn_donation@2x.png 2x" alt="기부관련 상담을 원하시나요? 나눔콜센터 080-890-1212" >
							</a>
						</div>
						</form>
					</div>
				</div>
			</main>
		</div>

<script>
(function($, win, doc, undefined) {
	$(doc).ready(function(){
	//필수실행
	//메뉴는 00 부터 시작
//     $plugins.common.init({
// 		menuid: '01_00_02' //1depth_2depth_3depth
// 	});

	// 190920 스크립트 수정 -----------------
	$plugins.uiTab({
		id:'uiTabCCKFUNR_1',
		current: parseInt( _myscl ),
		unres : true,
		callback: function(v){
			_tabClickIdx = v.current;
			makeSelectBox();
			makeSelectBoxEventCode( $(':radio[name="metpaySe"]:checked').val() );
			switch(v.current) {
				case 0 :
					$('#cckfunr_bsn').hide();
					$('#cckfunr_per').show();
					break;
				case 1 :
					$('#cckfunr_bsn').show();
					$('#cckfunr_per').hide();
					break;
				case 2 :
					$('#cckfunr_bsn').show();
					$('#cckfunr_per').hide();
					break;
			}
		}
	});
	// 190920 스크립트 수정 ----------------------
    });
})(jQuery, window, document);

/*** 사인패드  ***/
var canvas = $("#signature-pad canvas")[0];
var sign = new SignaturePad(canvas, {
	minWidth: 1,
	maxWidth: 2,
	penColor: "rgb(66, 133, 244)"
});

$("[data-action]").on("click", function(){
	if ( $(this).data("action")=="clear" ){
		sign.clear();
	}
});

function radioEvent( name ){
	var value = $(':radio[name="' + name + '"]:checked').val();
	if( name == "metpaySe" ) {
		if( value == "01" ) {
			$(".cardLayoutDe").show();
			$(".cardLayout").show();
    		$(".onlineLayout").hide();
		} else if(value == "04" || value == "05" ) {
			$(".cardLayoutDe").show();
			$(".cardLayout").hide();
			$(".onlineLayout").hide();
		} else {
			$(".cardLayoutDe").hide();
			$(".cardLayout").hide();
    		$(".onlineLayout").show();
		}
		makeSelectBoxEventCode( value );
	}

	if( name == "certification" ) {
    	if( value == "pad" ) {
    		$("#signature-pad").show();
    		$("#ars").hide();
    		$("#agree").hide();
    	} else if ( value == "ars" ) {
    		$("#signature-pad").hide();
    		$("#ars").show();
    		$("#agree").hide();
    	} else {
    		$("#signature-pad").hide();
    		$("#ars").hide();
    		$("#agree").show();
    	}
	}

	if( name == "rciptReqstAt" ) {
		if( _tabClickIdx == 0 ) {
			if( value == "Y" ){
				$("#jumin1 ,#jumin2").removeAttr("readonly");
				$("#email1 ,#email2").removeAttr("readonly");
			} else {
				$("#jumin1 ,#jumin2").attr("readonly", true);
				$("#email1 ,#email2").attr("readonly", true);
				$("#jumin1 , #jumin2 , #email1 ,#email2").val("");
			}
		} else {
			if( value == "Y" ){
				$("#bizNo1 , #bizNo2 , #bizNo3").removeAttr("readonly");
				$("#email1 , #email2").removeAttr("readonly");
			} else {
				$("#bizNo1 , #bizNo2 , #bizNo3").attr("readonly", true);
				$("#email1 ,#email2").attr("readonly", true);
				$("#bizNo1, #bizNo2 , #bizNo3 , #email1 ,#email2").val("");
			}
		}
	}
}

function makeSelectBox() {
	var year = new Date();
	var el="";
	for( var i=1915; i<= year.getFullYear(); i++ ) {
		el += "<option value='"+i+"'>" + i + "</option>";
	}
	$("#yy").html(el);
	$("select[name='yy'] option[value='1980']").prop("selected",true);

	el = "";
	for( var i=1; i<=12; i++ ) {
		el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";
	}
	$("#mm").html(el);
	$("#cntrBgnmtM").html(el);	//기부시작월
	$("#cardExpdateM").html(el);	//카드유효기간 월

	el = "";
	for( var i=1; i<=31; i++ ) {
		el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";
	}
	$("#dd").html(el);

	el = "";
	for( var i=year.getFullYear(); i<=2050; i++ ) {
		el += "<option value='"+i+"'>" + i + "</option>";
	}+
	$("#cntrBgnmtY").html(el);
	$("#cardExpdateY").html(el);

}

function makeSelectBoxEventCode( setleMthd ) {
	var arr = new Array();
	for( var i=0; i<2; i++ ) {
		if( i==0 ) {
			if( _tabClickIdx == 0 ) {
				param = {"mysCl1":"03" , "mysCl2":"02", "setleMthd": setleMthd , "speclMysAt": _speclMysAt , "eventCode":_eventCode};
			} else if( _tabClickIdx == 1 ) {
				param = {"mysCl1":"04" , "mysCl2":"02", "setleMthd": setleMthd , "speclMysAt": _speclMysAt , "eventCode":_eventCode};
			} else if ( _tabClickIdx == 2 ) {
				param = {"mysCl1":"05" , "mysCl2":"02", "setleMthd": setleMthd , "speclMysAt": _speclMysAt , "eventCode":_eventCode};
			}
		}
		else param = {"mysCl1":"02" , "mysCl2":"04", "setleMthd":"" , "speclMysAt": "" , "eventCode":""};

		arr.push( param );
	}
	var parameter = {"arr":JSON.stringify(arr)};
	gf_send( url + "/selectSelList.do", parameter );
}

function selectSelListAfter(data) {
	var el = '';
	$(data.bankList).each( function( i,item ) {
		el += "<option value='" + item.cmmnCode + "'>" + item.cmmnCodeNm + "</option>";
	});
	$("#acnutBank").html(el);

	//착한가정 희망지역
	el = '';
	$(data.codeList0).each( function( i,item ) {
		el += "<option value='" + item.eventCode + "' bhfCode='"+item.bhfCode+"'>" + item.bhfCodeNm + "</option>";
	});
	$("#eventCode").html(el);
	$("select[name='eventCode'] option[bhfCode='"+ __branchCd +"']").prop("selected",true);

	//기부상담신청 상담지역
	el = '';
	$(data.codeList1).each( function( i,item ) {
		el += "<option value='"+item.bhfCode+"'>" + item.bhfCodeNm + "</option>";
	});
	$("#bhfCode").html(el);
	$("select[name='bhfCode'] option[value='"+ __branchCd +"']").prop("selected",true);

	//개인기부 상담지역은 초기화
// 	$("#eventCode option:eq(0)").prop("selected","selected");
	_common.makeSelectLayout();	//select box

	if( _speclMysAt == "Y" ) {
		$("#eventNm").text( data.codeList0[0].eventNm );
	}
}

function fileOnchangeEvent( obj ) {
	var id = $(obj)[0].getAttribute("id");
	var file = $("#"+id).val();
	var f = file.lastIndexOf("\\");
	var e = file.lastIndexOf("\.");
	var fileName = file.substring(f+1,e);

	if(!file.match(/\.(jpg)$/i)){
		alert("출금동의증빙자료는 jpg만 가능합니다.");
		$("#"+id).focus();
		return false;
	}

	$("#txt").val( fileName );

	el = '<li><span>' + fileName + '</span><button type="button" class="btn-del">삭제</button></li>';
	$(".list-fileupload").html(el);

	$(".btn-del").click( function() {
		$(".list-fileupload > li").remove();
		$("#file , #txt").val("");
	});
}

function setTestData() {
	$("#cntrAmount").val("1,100");
	$("#nm").val("김민수");
	$("#result").val("Y");
	$("#companyResult").val("Y");
	$("#accountResult").val("Y");
	$("#zip").val("11111");
	$("#adres1").val("상세주소1");
	$("#adres2").val("상세주소2");

	$("#companyPhone1").val("010");
	$("#companyPhone2").val("2020");
	$("#companyPhone3").val("4048");

	$("#phone1").val("010");
	$("#phone2").val("2020");
	$("#phone3").val("4048");
	$("#email1").val("goodday0701");
	$("#email2").val("gmail.com");
	
	var param = {
			"sName":"김민수"
				, "sMobileNo":"01020204048"
				, "sBirthDate":"19790701"
				, "result":"Y"
			}
			setTimeout( function() {
				success( param );
			},1000);
}
</script>
