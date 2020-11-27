<!-- 
	########################### 개인 일시기부 ###########################
-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>
<%@ include file="../../common/iniPay/INIStdPayRequest.jsp"%>

<%@ page import="com.common.util.*"%>

<!-- 네이버페이 -->
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>

<c:choose>
<c:when test="${fn:indexOf(pageContext.request.requestURL, 'https://') > -1}">
    <script language="javascript" type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
</c:when>
<c:otherwise>
    <script language="javascript" type="text/javascript" src="https://stgstdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script> 
</c:otherwise>
</c:choose>



<script type="text/javascript">

var url = "/ct/lmpscntr";
var param={};
//var _setleMthd = "01";
// var _speclMysAt = "Y";
// var _eventCode = "202000000003";
var _setleMthd = "${setleMthd}"; 
var _speclMysAt = "${speclMysAt}";	//이벤트 여부
var _eventCode = "${eventCode}";	//201900000342 : , 201900000343 : MYS_CL22
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
    	keyEvent();	//숫자만 입력가능
    	makeSelectBox();
    	
    	if( _speclMysAt == "Y" ) {
    		//$("input:radio[name='metpaySe'][value='" + _setleMthd + "' ]").prop("checked", true);    		
    		if(gf_isNull(_setleMthd)) {
    			_setleMthd = "01";
    		}
    		$("#metpaySe").val(_setleMthd);
    		$("[data-pay]").removeClass("active");
    		$("[data-pay][value='" + _setleMthd + "' ]").addClass("active");
    	} 
    	
		//radioEvent('metpaySe');
		metpaysEvent();
		$(".field-wrap ul li").hide();	
		$("[data-action]").trigger("click");
		radioEvent('singleAndBiz');
// 		_common.selectTab( 'uiTabguide1' , parseInt( "${tabIndex}" ) );	//tab
		if( _path.indexOf("localhost") > -1 ) {
			setTestData();
		}
		// 직접입력 감추기
    	//$('[data-action=direct]').hide();
    	//$("button[data-action]:first").trigger("click");
    });
    
    $(document).on("click", "#searchZipCode , #checkPlus , #btnInsert ", function(e){
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
        if( id == "btnInsert") {
        	if( !validator() ) return;
        	if( confirm("기부 하시겠습니까?") ) {
        		//var metpaySe= $(':radio[name="metpaySe"]:checked').val();
        		var metpaySe= $('#metpaySe').val();
        		
        		makeFormData();   
        		var data = $('form[name="frm"]').serialize();
        		
        		// 네이버페이
        		if( metpaySe == "04" ) {
        			gf_send("<c:url value='" + url + "/insertTHP_NaverpayLog.do' />", data , insertNpayLogCallback );
        		// 카카오페이
        		} else if( metpaySe == "05" ) {
            		gf_send("<c:url value='" + url + "/insertTHP_KakaopayLog.do' />", data , insertKpayLogCallback );
        		} else {
           			gf_send("<c:url value='" + url + "/insertTHP_InipayLog.do' />", data , insertCallback );
        		}
        	}
        }
    });
    
    function insertNpayLogCallback( data ) {
    	$("#timestamp").val( data.timestamp );
    	
    	var cntrAmount = uncomma ( $("#cntrAmount").val() );
		var oPay = Naver.Pay.create({
		    "payType" : "normal",
		    "mode" : "${_mode}", 		// development or production
		    "clientId": "${_clientId}", // clientId
		    "chainId": "${_chainId}", 	// chainId
		    "openType": "popup",		// popup, page 
		    "useNaverAppLogin": "false",
		    "onAuthorize" : function(oData) {        
		    	//console.log(oData);
		    	if(oData.resultCode === "Success") {
		        	$("#paymentId").val(oData.paymentId);		        	
		        	var data = $('form[name="frm"]').serialize();
		        	gf_send("<c:url value='" + url + "/insertNpay.do' />", data , insertNpayAfter );
		        	
		        } else {
		        	$("#paymentId").val("");
		        	$("#resultCode").val(oData.resultCode);
		        	$("#resultMessage").val(oData.resultMessage);
		        	
		        	var data = $('form[name="frm"]').serialize();
		        	gf_send("<c:url value='" + url + "/updateTHP_NaverpayLog.do' />", data , updateNpayLogCallback );
		        	
		        }		        
		    }
		});
		
		oPay.open({ // Pay Reserve Parameters를 참고 바랍니다.
	          "merchantPayKey" : data.timestamp,	// 가맹점 주문번호
	          "productCount" : 1,
	          "productName": "사랑의열매 일시기부",
	          "totalPayAmount": Number(cntrAmount),
	          "taxScopeAmount": 0,
	          "taxExScopeAmount": Number(cntrAmount),
	          "returnUrl": "<%=siteDomain%>/NaverPayAuthReturn.do?orderNo="+data.timestamp,
	          "productItems": [{
	        	    "categoryType": "PRODUCT",
	        	    "categoryId" : "SUPPORT",
	        	    "uid" : $("#eventCode option:checked").val(),
	        	    "name" : "사랑의열매 일시기부",
	        	    "count" : 1
	        	  }]
	        });
    }
    
    function updateNpayLogCallback( oData ) {
    	
    	$("#timestamp").val("");
    	var resultMsg = $.trim(oData.resultMessage);
    	
	    if(resultMsg == "userCancel") {
			alert("구매자취소 처리 되었습니다.");	
		} else if(resultMsg == "webhookFail") {
			alert("호출 응답 실패되었으니 다시 처리하세요.");
		} else if(resultMsg == "paymentTimeExpire") {
			alert("결제 시간 초과되었습니다.");
		} else if(resultMsg == "OwnerAuthFail") {
			alert("본인 카드 인증 오류 입니다.");
		} else {
			alert(resultMsg);
		}
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
    
    function insertCallback( data) {
    	// check validator
    	if(data.chk_result == "Fail") {
    		alert(data.chk_message);
    		return;
    	}
    	//여기서 필요한 정보들 받아와서 세팅 - 웹
    	$("#oid").val( data.oid );
    	$("#mid").val( data.mid );
    	$("#mKey").val( data.mKey );
    	$("#signKey").val( data.signKey );
    	
    	$("#returnUrl").val( "<%=siteDomain%>" + data.returnUrl);
    	$("#timestamp").val( data.timestamp );
    	
    	//여기서 필요한 정보들 받아와서 세팅 - 모바일
    	$("#P_OID").val( data.oid );
    	$("#P_MID").val( data.mid );
    	
    	
    	var param = {
			"oid": data.oid 
    		,"timestamp": data.timestamp
    		,"price": $("#cntrAmount").val()
    	};
   		gf_send("<c:url value='" + url + "/makeSignatureData.do' />", param );	 
    }
    
    function makeSignatureDataAfter( json ) {
    	if( json.result == "ok"  ) {
    		var buyertel = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
    		var email = $("#email1").val() + "@" + $("#email2").val();				//이메일
    		//var metpaySe= $(':radio[name="metpaySe"]:checked').val();					//기부방식
    		var metpaySe= $("#metpaySe").val();
    		
    		if( _mobileCheck == "PC" ) {
    			$("#signature").val( json.signature );
        		$("#price").val( json.price );
        		$("#buyername").val( $("#nm").val() );		//성명
        		$("#buyertel").val( buyertel );				//휴대폰 번호 
        		$("#buyeremail").val( email );				//이메일
        		
        		if( metpaySe == "01" ) { $("#gopaymethod").val("Card");
        		} else if( metpaySe == "02" ) { $("#gopaymethod").val("HPP");
    			} else if( metpaySe == "03" ) {	$("#gopaymethod").val("DirectBank");
    			} else if( metpaySe == "05" ) {	
    				$("#gopaymethod").val("onlykakaopay");	//카카오페이
    				$("#acceptmethod").val("cardonly");
    			} else if( metpaySe == "06" ) {	// PAYCO 
    				$("#gopaymethod").val("onlypayco");
    				$("#acceptmethod").val("cardonly");	
        		} else if( metpaySe == "07" ) {	// Samsung PAY 
    				$("#gopaymethod").val("onlyssp");
    				$("#acceptmethod").val("cardonly");	
        		} else if( metpaySe == "08" ) {	// Lpay 
    				$("#gopaymethod").val("onlylpay");
    				$("#acceptmethod").val("cardonly");	
        		} else if( metpaySe == "09" ) {	// SSG pay 
    				$("#gopaymethod").val("onlyssgcard");
    				$("#acceptmethod").val("cardonly");	
        		} else if( metpaySe == "10" ) {	// 토스페이 
    				$("#gopaymethod").val("onlytosspay");
    				$("#acceptmethod").val("cardonly");	
        		}
        		
            	setTimeout( function() {
            		INIStdPay.pay('frm');
            	},2000);
    		} else {
    			var paymethod = "";
    			$("#P_AMT").val( json.price );
    			$("#P_UNAME").val( $("#nm").val() );
    			$("#P_MOBILE").val( buyertel );
    			$("#P_EMAIL").val( email );
    				   
    			if( metpaySe == "01" ) 	{
    				//신용카드 
    				paymethod = "wcard";
    				$("#P_RESERVED").val("twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N");
    			} else if( metpaySe == "02" ) {
    				//휴대폰 결제
    				paymethod = "mobile";
    			} else if( metpaySe == "03" ) {
    				//계좌이체
    				paymethod = "bank";
    				$("#P_RESERVED").val("twotrs_bank=Y&apprun_check=Y");
    			} else if( metpaySe == "05" ) {
    				//카카오페이
    				paymethod = "wcard";
    				$("#P_RESERVED").val("twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N&d_kakaopay=Y");
    			} else if( metpaySe == "06" ) {
    				//PAYCO
    				paymethod = "wcard";
    				$("#P_RESERVED").val("twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N&d_payco=Y");
    			} else if( metpaySe == "07" ) {
    				//Samsung PAY
    				paymethod = "wcard";
    				$("#P_RESERVED").val("twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N&d_samsungpay=Y");
    			} else if( metpaySe == "08" ) {
    				//Lpay
    				paymethod = "wcard";
    				$("#P_RESERVED").val("twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N&d_lpay=Y");
    			} else if( metpaySe == "09" ) {
    				//SSG pay
    				paymethod = "wcard";
    				$("#P_RESERVED").val("twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N&d_ssgpay=Y");
    			} else if( metpaySe == "10" ) {
    				//토스페이
    				paymethod = "wcard";
    				$("#P_RESERVED").val("twotrs_isp=Y&block_isp=Y&twotrs_isp_noti=N&d_tosspay=Y");
    			}
    			
    			mobilePopup( paymethod );
    		}	
    	}
    }
    
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
    
    $(document).on("click", "[data-pay]", function(e){
        e.preventDefault();
        var action = $(this).data("pay");
        var value = gf_lpad($(this).attr("value"), 2, "0");
        $("#metpaySe").val(value);
        
        $("[data-pay]").removeClass("active");
        $(this).addClass("active");
        
        metpaysEvent();        
    });
    
    $(document).on("change", "#intrstRealm", function(e){
    	var idx = $("#intrstRealm option").index( $("#intrstRealm option:selected") );
    	$(".field-wrap ul li").hide();
    	if( idx == 0 ) return;    	
    	$(".field-wrap ul li:eq('" + ( idx -1 ) + "')").show();
    });
    
    function insertAfter(data) {
    	if( data.result > 0 ) {
    		alert("<spring:message code="result.save.success"></spring:message>");	// 저장되었습니다.
    		location.href = url + "/initIndvdl.do";
	    	return;
    	} else {
    		alert("<spring:message code="result.save.fail"></spring:message>");     // 저장에 실패하였습니다.
    	}
    }
    
    function insertNpayAfter(data) {
    	var result = data.result;
    	if( result.indexOf("Success_") == 0 ) {
    		var a = result.lastIndexOf("_");
    		var orderNo = result.substring( a + 1  , result.length );    		
    		var param = "orderNo=" + orderNo + "&speclMysAt=" + _speclMysAt + "&eventCode=" + _eventCode;
    		gf_submitMovePage(url+ "/NaverPayReturn.do", param);
    	} else {
    		$("#paymentId").val("");
    		alert( result.substring(0, result.lastIndexOf("_") ) );    		
    		return;
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
    }
    
    function fail() {
    	alert("본인인증이 실패하였습니다.");
    }
    
	function makeFormData() {
		//var metpaySe= $(':radio[name="metpaySe"]:checked').val();					//기부방식
		var metpaySe= $("#metpaySe").val();
	    var singleAndBiz = $(':radio[name="singleAndBiz"]:checked').val();			//개인/사업자 여부
	    var rciptReqstAt= $(':radio[name="rciptReqstAt"]:checked').val();			//영수증 신청 여부
	    var yy= $('select[name="yy"]').val();							//생년월일 년
	    var mm= $('select[name="mm"]').val();							//생년월일 월    	
	    var dd= $('select[name="dd"]').val();							//생년월일 일
	    var brthdy = yy + "" + mm + "" + dd;
	    $("#brthdy").val( brthdy );
	    
	    var adres = $("#adres1").val() + " " + $("#adres2").val();						//주소 + 상세주소
	    $("#adres").val( adres );
	    
	    var mbtlnum = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
	    $("#mbtlnum").val( mbtlnum );
	    
	    if( singleAndBiz == "jumin" ) {
	    	//개인
	    	if( rciptReqstAt == "Y" ) {
				var ihidnumBizno = $("#jumin1").val() + "" + $("#jumin2").val();
				var email = $("#email1").val() + "@" + $("#email2").val();				//이메일
				$("#ihidnumBizno").val( ihidnumBizno );
				$("#email").val( email );
			}	
	    } else {
	    	//사업자
	    	if( rciptReqstAt == "Y" ) {
		    	var ihidnumBizno = $("#biz1").val() + "" + $("#biz2").val() + "" + $("#biz3").val();
				var email = $("#email1").val() + "@" + $("#email2").val();				//이메일
				$("#ihidnumBizno").val( ihidnumBizno );
				$("#email").val( email );
	    	}
	    }
    	
	    //개인정보 수집
	    var arr=[];
		$('input[name="agreeInfo"]').each(function(i) {
			var chk = $("input:checkbox[name='agreeInfo']").eq(i).is(":checked");
			if( i==0 ) arr = ( chk == true ? "Y" : "N" );
			else arr = arr + "-" + ( chk == true ? "Y" : "N" );
		});
		$("#agree_arr").val( arr );
		
		//지회코드
		$("#jihoe").val( $("#eventCode option:checked").attr("bhfcode")  );
	}
    
	function validator() {
		var singleAndBiz = $(':radio[name="singleAndBiz"]:checked').val();
    	//var metpaySe= $(':radio[name="metpaySe"]:checked').val();				//기부방식
    	var metpaySe= $("#metpaySe").val();
    	var rciptReqstAt= $(':radio[name="rciptReqstAt"]:checked').val();		//영수증 신청 여부
    	var cntrAmount = uncomma ( $("#cntrAmount").val() );
    	var moneyOnlyNumeric = cntrAmount;
    	
    	if( metpaySe == "01" ) {
    		if( moneyOnlyNumeric < 3000 ){
    			alert("수수료 문제로 인해 3,000이하 기부금은 처리할 수 없습니다.\n\n3,000원 이상 기부를 부탁드립니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    		if( moneyOnlyNumeric > 10000000 ){
    			alert("신용카드 기부가능액은 최대 1000만원입니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    	}
    	if( metpaySe == "02" ) {
    		if( moneyOnlyNumeric < 3000 ){
        		alert("수수료 문제로 인해 3,000원 이하 기부금은 처리할 수 없습니다.\n\n3,000원 이상 기부를 부탁드립니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
        	if( moneyOnlyNumeric > 1000000 ){
        		alert("휴대폰 기부가능액은 최대 100만원입니다.");
        		$("#cntrAmount").focus();
        		return false;
        	}
    	}
    	if( metpaySe == "03" ) {
    		if( moneyOnlyNumeric < 3000 ){
        		alert("수수료 문제로 인해 3,000원 이하 기부금은 처리할 수 없습니다.\n\n3,000원 이상 기부를 부탁드립니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    		if(moneyOnlyNumeric > 10000000){
    			alert("계좌이체 기부가능액은 최대 1000만원입니다.");
    			$("#cntrAmount").focus();
    			return false;
   			}
    		
    	}
    	// 20200901 이희서 주임에게 금액제한 확인 (네이버페이/카카오페이) 
    	if( metpaySe == "04" || metpaySe == "05" ) {
    		if( moneyOnlyNumeric < 3000 ){
    			alert("수수료 문제로 인해 3,000이하 기부금은 처리할 수 없습니다.\n\n3,000원 이상 기부를 부탁드립니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    		if( moneyOnlyNumeric > 10000000 ){
    			alert("기부가능액은 최대 1000만원입니다.");
    			$("#cntrAmount").focus();
    			return false;
    		}
    	}
    	
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
    	
    	if( singleAndBiz == "jumin" ) {
    		if( rciptReqstAt == "Y" ) {
	    		if( $.trim( $("#jumin1").val() ).length == 0 || $.trim( $("#jumin1").val() ).length != 6 ) {
	    			alert("주민번호를 입력해주세요");
	    			$("#jumin1").focus();
	    			return false;
	    		}
	    		if( $.trim( $("#jumin2").val() ).length == 0 || $.trim( $("#jumin2").val() ).length != 7 ) {
	    			alert("주민번호를 입력해주세요");
	    			$("#jumin2").focus();
	    			return false;
	    		}
    		}
		} else {
			if( $.trim( $("#bplcNm").val() ).length == 0 ) {
				alert("사업자명을 입력해주세요");
				$("#bplcNm").focus();
				return false;
			}
			
			if( rciptReqstAt == "Y" ) {
    			if( $.trim( $("#biz1").val() ).length == 0 || $.trim( $("#biz1").val() ).length < 3) {
    				alert("사업자번호를 입력해주세요");
    				$("#biz1").focus();
    				return false;
    			}
    			if( $.trim( $("#biz2").val() ).length == 0 || $.trim( $("#biz2").val() ).length < 2) {
    				alert("사업자번호를 입력해주세요");
    				$("#biz2").focus();
    				return false;
    			}
    			if( $.trim( $("#biz3").val() ).length == 0 || $.trim( $("#biz3").val() ).length < 5) {
    				alert("사업자번호를 입력해주세요");
    				$("#biz3").focus();
    				return false;
    			}
			}
		}
    	
    	if(!$("#agreeInfo").is(':checked')){
    		alert("개인정보 수집 및 이용에 동의해 주시길 바랍니다.");
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
	
	/********** 모바일 결제 모듈 **********/    
	function mobilePopup( paymethod ){
		window.name = "BTPG_CLIENT";
		var width = 330;
		var height = 480;
		var xpos = (screen.width - width) / 2;
		var ypos = (screen.width - height) / 2;
		var position = "top=" + ypos + ",left=" + xpos;
		var features = position + ", width=320, height=440";
		var order_form = document.ini3;
		
		var param = "?jihoe=" + $("#eventCode option:checked").attr("bhfcode") + "&eventCode=" + "${eventCode}" + "&speclMysAt=" + "${speclMysAt}";
		var paramter = "<%=siteDomain%>/mobileResult.do" + param;
		$("#P_NEXT_URL").val ( paramter );
		console.log( paramter );
				
		order_form.action = "https://mobile.inicis.com/smart/" + paymethod + "/";
		order_form.target = "BTPG_WALLET";
		order_form.submit();
	}
	
	function goPayResult(resParam)
	{
		var param = "orderNo="+resParam[0]+"&speclMysAt="+resParam[1]+"&eventCode="+resParam[2]+"&payType="+resParam[3];
		gf_submitMovePage("<c:url value='/ct/lmpscntr/NaverPayReturn.do' />", param);
	}
	
</script>

<form name="form_chk" method="post">
	<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="<%= sEncData %>">				<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="result" id="result" value="N" />
</form>
<form id="form3" name="ini3" method="post" accept-charset="euc-kr">
	<input type="hidden" name="P_MID" 			id="P_MID" 		value="" />
	<input type="hidden" name="P_OID" 			id="P_OID"		value="" />
	<input type="hidden" name="P_GOODS" 		id="P_GOODS" 	value=""  />
	<input type="hidden" name="P_AMT" 			id="P_AMT" />
	<input type="hidden" name="P_UNAME" 		id="P_UNAME" />
	<input type="hidden" name="P_MNAME" 		id="P_MNAME" 	value="사랑의열매"/>
	<input type="hidden" name="P_MOBILE" 		id="P_MOBILE" />
	<input type="hidden" name="P_EMAIL" 		id="P_EMAIL" />
	<input type="hidden" name="P_HPP_METHOD" 	id="" 			value="1">
	<input type="hidden" name="P_NEXT_URL" 		id="P_NEXT_URL"			value="" />	
	<input type="hidden" name="P_RESERVED" 		id="P_RESERVED" />
	<input type="hidden" name="P_CHARSET" value="utf8">
</form>

	<div class="sub-visual visual02_01">
		<div class="sub-title-area">
			<h2 class="heading-title-a">일시기부</h2>
			<p class="title-sub-txt">당신의 나눔이 세상을 더욱 밝게 합니다.</p>
		</div>
	</div>
	
	<%@ include file="../../layout/breadcrumbs.jsp"%>

	<main class="base-main" id="baseMain">
		<div class="contents-area">
			<div class="contents-hd">
				<h3><strong id="eventNm">카드/계좌이체/포인트</strong><span>당신의 나눔이 모두의 행복입니다. 나눔의 힘을 믿어보세요.</span></h3>
				<div class="contents-menu-nav"></div>
			</div>

			<div class="seo-box">
			
				<form id="frm" name="frm" method="post"  enctype="multipart/form-data" action="<c:url value='/ct/lmpscntr/insert.do' />" >
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
				<input type=hidden name="jihoe" 			id="jihoe" />
				<input type=hidden name="speclMysAt" 		id="speclMysAt" value="${speclMysAt }" />
				<input type=hidden name="metpaySe"			id="metpaySe"	value="01" />
				
				<input type=hidden name="paymentId" 		id="paymentId" />						<!-- 네이버페이 결제번호 -->
				<input type=hidden name="resultCode" 		id="resultCode" />
				<input type=hidden name="resultMessage" 	id="resultMessage" />
				<input type=hidden name="payType"			id="payType"	value="normal" />
				
				<!-- ########### 이니시스 필수 값 시작 ########## -->
				<input type=hidden name="timestamp" id="timestamp" value="" >
				<input type=hidden name="version" value="1.0" >
				<input type=hidden name="mid" 	id="mid" value="" >
				<input type=hidden name="oid" 	id="oid" value="" >
				<input type=hidden name="price" id="price" value="" >
				<input type=hidden name="goodname" value=기부참여 >
				<input type=hidden name="currency" value="WON" >
				<input type=hidden name="buyername" id="buyername" value="" >	<!-- 성명 -->
				<input type=hidden name="buyertel" id="buyertel" value="" >	<!-- 휴대폰 번호 -->
				<input type=hidden name="buyeremail" id="buyeremail" value="" >	<!-- 이메일 -->
				<input type=hidden name="signature" id="signature" value="" >
				<input type=hidden name="returnUrl" id="returnUrl" value="" >
				<input type=hidden name="mKey" 		id="mKey" value="" >
				<input type=hidden name="gopaymethod" id="gopaymethod" value="">				
				<!-- ########### 이니시스 필수 값 끝 ########## -->
				<!-- 				<input type=text name="quotabase" value="일시불" > -->
				<input type=hidden name="acceptmethod" id="acceptmethod" value="SKIN(ORIGINAL):HPP(1)" >
				<input type=hidden name="closeUrl" value="<%=siteDomain%>/close.do" >
				
				<div class="ui-tab ui-tab-type2 contents-tab" id="uiTabguide1">
					<div class="ui-tab-btns" btn-id="uiTabguide1">
						<button type="button" class="ui-tab-btn"><i>개인</i></button>
						<button type="button" class="ui-tab-btn"><i>법인</i></button>
					</div>
					
				
					<div class="ui-tab-pnls" pnl-id="uiTabguide1">
						<section class="ui-tab-pnl">
							<div class="tab-contents">
								<p class="tab-desc">사랑의열매는 기부내역확인서비스로 성금사용내역을 공개하고 있습니다. 여러분의 사랑을 보여주세요.<br>
                                                        기부금 정산은 온라인 결제시스템을 경유, 사랑의 열매 계좌로 입금되는 시점을 기준으로 합니다. 결제방법에 따라 소요기간이 다르니 참고해주세요.<br>
                                                        아이폰 사용자의 경우 설정 > Safari > 팝업차단을 해제하셔야 기부 결제가 가능합니다.</p>
								<div class="donate-list">
									<p class="donate-tit">기부정보확인 서비스가 완료되는데 소요되는 기간</p>
									<div class="donate-list-area">
										<div class="donate-list-item">
											<i class="ico-credit"></i>
											<div class="item-txt">
												<p>신용카드 기부<br>온라인계좌이체 기부</p>
												<strong>15일 이후</strong>
											</div>
										</div>
										<div class="donate-list-item">
											<i class="ico-phone"></i>
											<div class="item-txt">
												<p>휴대폰 기부</p>
												<strong>90일 이후</strong>
											</div>
										</div>
										<div class="donate-list-item">
											<i class="ico-passbook"></i>
											<div class="item-txt">
												<p>무통장입금 기부</p>
												<strong>3일 이후</strong>
											</div>
										</div>
									</div>
									<p class="donate-desc">홈페이지 상에서 기부정보내역을 3일 안에 확인하고 싶으신 분은 <span>무통장 입금</span>을 선택해 주세요.<br>단, 무통장 입금 후 해당 지회로 전화하여 기부자정보 를 알려주셔야 합니다.</p>
								</div>
								
									<!-- 결재방식추가_200909 -->
								<div class="donate-select-area">
									<div class="donate-select">
										<p class="select-tit">기부방식 선택</p>
										<!-- btn -->
										<div class="pay__wrap">
											<ul class="boxs">
												<li class="box active" id="radiopay01" data-pay="" value="01">
													신용카드
												</li>
												<li class="box" id="radiopay02" data-pay="" value="02">
													휴대폰
												</li>
												<li class="box" id="radiopay03" data-pay="" value="03">
													계좌이체
												</li>
												<li class="box" id="radiopay90" data-pay="" value="90">
													포인트
												</li>
											</ul>
											<ul class="boxs">
												<li class="box icon n_pay" id="radiopay04" data-pay="" value="04">
												</li>
												<li class="box icon k_pay" id="radiopay05" data-pay="" value="05">
												</li>
												<li class="box icon payco" id="radiopay06" data-pay="" value="06">
												</li>
												<li class="box icon toss" id="radiopay10" data-pay="" value="10">
												</li>
												<li class="box icon samsungpay" id="radiopay07" data-pay="" value="07">
												</li>
												<li class="box icon ssg_pay" id="radiopay09" data-pay="" value="09">
												</li>
												<li class="box icon L_pay" id="radiopay08" data-pay="" value="08">
												</li>
											</ul>
											<p class="select-desc" id="pay01_desc">기부시 <span>후원금_KG 이니시스, KG 이니시스</span>로 표시되어
												청구됩니다.</p>
											<p class="select-desc" id="pay04_desc">기부시 <span>네이버페이</span>로 표시되어 청구됩니다.</p>
										</div>
										<!-- btn_end -->
									</div>
									<!-- //결재방식추가end -->

									<div class="select-contents">
										<div class="select-contents-group">
											<div id="credit" class="none">
												<div class="select-contents-info">
													<!-- 01. 희망지역/기부금액 -->
													<h2 class="table-tit">01. 희망지역/기부금액</h2>
													<div class="tb-type_a">
														<table summary="희망지역 및 기부금액 선택 정보">
														    <caption>희망지역 및 기부금액 선택 정보입니다.</caption>
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
																		<button type="button" class="btn-base small" data-action="" price="10,000">1만원</button>
																		<button type="button" class="btn-base small" data-action="" price="20,000">2만원</button>
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
													<div class="tb-type_a">
														<table summary="기부자 정보 입력">
												 		   <caption>기부자 정보 입력 부분입니다.</caption>
															<colgroup>
																<col class="col-xs">
																<col class="col-auto">
															</colgroup>
															<tbody>
                                                            <tr>
                                                                <th scope="row">
                                                                    <label for="phone1">휴대폰 번호<span class="required" aria-label="필수">*</span></label>
                                                                </th>
                                                                <td>
                                                                    <div class="phone-area">
                                                                        <input type="text" class="inp-base" title="휴대폰 앞자리" name="phone1" id="phone1" readonly value="">
                                                                        <span class="txt-mark">-</span>
                                                                        <input type="text" class="inp-base" title="휴대폰 중간자리" name="phone2" id="phone2" readonly value="">
                                                                        <span class="txt-mark">-</span>
                                                                        <input type="text" class="inp-base" title="휴대폰 뒷자리" name="phone3" id="phone3" readonly value="">
                                                                        <button type="button" class="btn-base-imp small" id="checkPlus" title="새 창 열림">인증</button>
                                                                    </div>
                                                                    <p class="donation-guide-txt">
                                                            - NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
                                                            - 기부자 본인을 확인하기 위해서 기부자님의 본인인증이 반드시 필요합니다.<br>
                                                            - 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.  
                                                        </p>
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
																	<label for="singleAndBiz1">개인/사업자선택<span class="required" aria-label="필수">*</span></label>
																</th>
																<td>
																	<div class="radio-group">
																		<span class="radio">
																			<input type="radio" name="singleAndBiz" id="singleAndBiz1" value="jumin" onclick="radioEvent('singleAndBiz');" checked>
																			<label for="singleAndBiz1"><span>개인</span></label>
																		</span>
																		<span class="radio">
																			<input type="radio" name="singleAndBiz" id="singleAndBiz2" value="biz" onclick="radioEvent('singleAndBiz');">
																			<label for="singleAndBiz2"><span>사업자</span></label>
																		</span>
																	</div>
																</td>
															</tr>
															
															<tr class="bizNmLayout">
																<th scope="row">
																	<label for="bplcNm">사업자명<span class="required" aria-label="필수">*</span></label>
																</th>
																<td>
																	<input type="text" class="form-w01" title="사업자명" name="bplcNm" id="bplcNm">
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
																			<input type="radio" name="rciptReqstAt" id="receiptYn1" value="Y" onclick="bizOrSinRaradioEvent('rciptReqstAt');" >
																			<label for="receiptYn1"><span>신청</span></label>
																		</span>
																		<span class="radio">
																			<input type="radio" name="rciptReqstAt" id="receiptYn2" value="N" onclick="bizOrSinRaradioEvent('rciptReqstAt');" checked>
																			<label for="receiptYn2"><span>미신청</span></label>
																		</span>
																	</div>
																</td>
															</tr>
															
															<tr class="juminLayout">
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
															
															<tr class="bizLayout">
																<th scope="row">
																	<label for="biz1">영수증 신청  <br>사업자번호<span class="required" aria-label="필수">*</span>
																	</label>
																</th>
																<td>
																	<div class="jumin-area">
																		<input type="text" class="inp-base" title="사업자번호 앞자리" id="biz1" numberOnly maxlength="3">
																		<span class="txt-mark">-</span>
																		<input type="text" class="inp-base" title="사업자번호 가운데자리" id="biz2" numberOnly maxlength="2">
																		<span class="txt-mark">-</span>
																		<input type="text" class="inp-base" title="사업자번호 뒷자리" id="biz3" numberOnly maxlength="5">
																	</div>
																</td>
															</tr>
						
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
															<tr class="mailLayout">
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
													<!-- //02. 기부자 정보 -->

													<!-- 추가정보 -->
													<h2 class="table-tit">추가정보</h2>
													<div class="tb-type_a">
														<table summary="추가정보설정">
															<caption>추가정보 입력 부분입니다.</caption>
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
												<textarea id="agreeInfo" class="inp-base" readonly="readonly" title="개인정보 수집 및 이용에 동의에 관한 정보입니다.">사회복지공동모금회(이하 “모금회”라 함)는 「개인정보 보호법」제15조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며, 고지 후 수집된 정보는 모금회의 개인정보 수집 및 
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
													<label for="agreeInfo1"><span>개인정보 제 3자 제공에 동의 합니다.</span></label>
												</span>
												<textarea id="agreeInfo1" class="inp-base" readonly="readonly" title="개인정보 제 3자 제공에 동의에 관한 정보입니다.">본인은 모금회가 「개인정보 보호법」제17조제1항제1호에 의거, 다음과 같이 본인의 개인정보를 제3자에게 제공하는 것에 대하여 동의합니다.         
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
														<button type="button" class="btn-base-imp" id="btnInsert">기부하기</button>
													</div>
													<!-- 기부하기 -->

													<!-- <div class="donation-guide">
														<dl>
															<dt class="donation-guide-tit">연말정산을 위한 기부금 영수증 발급이 가능한 시점이 결제수단마다 다르니 참고하세요!</dt>

															<dd class="donation-guide-item n3">
																<div>
																	신용카드 기부<br>온라인계좌이체 기부
																	<strong>12월 15일 이후</strong>
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
													</div> -->

<!-- 													<div class="donation-bn"> -->
<!-- 														<a href="#"> -->
<!-- 															<img src="/common/img/contents/bn_donation.png" srcset="/common/img/contents/bn_donation@2x.png 2x" alt="기부관련 상담을 원하시나요? 나눔콜센터 080-890-1212" > -->
<!-- 														</a> -->
<!-- 													</div> -->
												</div>
											</div>

											<div id="point" class="active">
												<p class="select-sub-tit">포인트 기부</p>
												<div class="select-contents-info">
													<ul class="point-card-list">
														<li>
															<p class="point-card-tit">KB국민 포인트 체리카드</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">KB포인트리 체리카드는 고객님이 카드를 이용하시면, KB국민은행 부담으로 매년 연말에 카드 1장당 1천원씩 사랑의열매에 기부되어 따뜻한 마음을 전할 수 있는 사업에 사용됩니다.</p>
															<button type="button" class="btn-base-imp small" onclick="https://card.kbcard.com/CXPPPCAC0080.cms?mainCC=a&cooperationcode=01612">참여하기	</button>
														</li>
														<li>
															<p class="point-card-tit">KB국민 포인트리</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">KB포인트리 체리카드는 고객님이 카드를 이용하시면, KB국민은행 부담으로 매년 연말에 카드 1장당 1천원씩 사랑의열매에 기부되어 따뜻한 마음을 전할 수 있는 사업에 사용됩니다.</p>
															<button type="button" class="btn-base-imp small" onclick="https://card.kbcard.com/CXPPPSVC5200.cms">참여하기</button>
														</li>
														<li>
															<p class="point-card-tit">S-OIL 사랑의열매 보너스카드</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">주유량 기준 8원/ℓ 를 포인트로 적립해드리며, 이 중 절반인 4원/ℓ 가 사랑의열매에 자동 기부됩니다.</p>
															<button type="button" class="btn-base-imp small" onclick="http://www.s-oilbonus.com/2013/point/use/donation/index.jsp">참여하기</button>
														</li>
														<li>
															<p class="point-card-tit">신한카드 아름인</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">기부전용 아름인포인트 및 일시불/할부 결제액의 0.5~0.8%가 포인트로 적립됩니다. 포인트기부캠페인으로 행복한 세상을 만들어가요~</p>
															<button type="button" class="btn-base-imp small" onclick="https://arumin.shinhancard.com/cul/INTROCULN/culGetListIntro.shc">참여하기</button>
														</li>
														<li>
															<p class="point-card-tit">롯테카드 포인트</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">롯데카드를 사용하면 적립되는 포인트를 홈페이지 또는 고객센터를 통해 사랑의열매로 기부가 가능합니다.</p>
															<button type="button" class="btn-base-imp small" onclick="http://www.lottecard.co.kr/app/IHLFTBB_V400.do">참여하기</button>
														</li>
														<li>
															<p class="point-card-tit">하나SK카드 하나포인트</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">하나포인트 기부하기 신청을 통해 나눔에 동참하실 수 있습니다.</p>
															<button type="button" class="btn-base-imp small" onclick="http://www.hanaskcard.com/wizvera/veraport/install.html?url=http://www.hanaskcard.com/PH00000000N.web?_frame=no&schID=pcd&mID=PH00000000N">참여하기</button>
														</li>
														
														<li>
															<p class="point-card-tit">외환카드 예스포인트</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">적립한 포인트로 따뜻한 마음을 전해주세요~</p>
															<button type="button" class="btn-base-imp small" onclick="http://www.hanacard.co.kr/">참여하기</button>
														</li>
														
														<li>
															<p class="point-card-tit">광주은행 카드 - 광주지회</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">적립한 포인트로 따뜻한 마음을 전해주세요~</p>
															<button type="button" class="btn-base-imp small" onclick="http://www.kjbank.com/banking/index.jsp?type=per&code=cdr1_110">참여하기</button>
														</li>
														
														<li>
															<p class="point-card-tit">광주은행 카드 - 광주지회</p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">사이버지점의 포인트/마일리지에서 포인트 조회 후 <br/>기부 버튼을 눌러주세요~</p>
															<button type="button" class="btn-base-imp small" onclick="http://www.kjbank.com/banking/index.jsp?type=per&code=cdr1_110">참여하기</button>
														</li>
														
														<li>
															<p class="point-card-tit">BC카드 TOP포인트 기부캠페인 - 서울지회 </p>
															<div class="card-img"><img src="/common/img/temp/@card.png" alt=""></div>
															<p class="point-card-desc">사랑의열매와 BC카드가 어려운 이웃에게 희망을 전하기 위해 월별 다양한 테마를 지정해 포인트기부 캠페인을 펼칩니다. 지원의 사각지대에 놓인 어려운 이웃들에게 여러분의 포인트를 나누어 주세요.</p>
															<button type="button" class="btn-base-imp small" onclick="https://www.bccard.com/card/html/company/ethics/divide/divide1/divide.jsp">참여하기</button>
														</li>
														
													</ul>
												</div>
											</div>
											</div>
										</div>
										</div>
									</div>
								</div>

								<div class="donate-list">
									<p class="donate-tit">연말정산을 위한 기부금 영수증 발급이 가능한 시점이 결제수단마다 다르니 참고하세요!</p>
									<div class="donate-list-area">
										<div class="donate-list-item">
											<i class="ico-credit"></i>
											<div class="item-txt">
												<p>신용카드 기부<br>온라인계좌이체 기부</p>
												<strong>15일 이후</strong>
											</div>
										</div>
										<div class="donate-list-item">
											<i class="ico-phone"></i>
											<div class="item-txt">
												<p>휴대폰 기부</p>
												<strong>90일 이후</strong>
											</div>
										</div>
										<div class="donate-list-item">
											<i class="ico-passbook"></i>
											<div class="item-txt">
												<p>무통장입금 기부</p>
												<strong>3일 이후</strong>
											</div>
										</div>
									</div>
									<p class="donate-desc">기부시 <span>후원금_KG 이니시스, KG 이니시스</span>로 표시되어 청구됩니다.
									<br/>
									기부하신 후 입금정보(입금자명, 기부금액, 입금날자, 입금은행, 입금계좌 등)를 확인해주셔야만 기부금 영수증 발급이 가능합니다
									</p>
									<div id="passbook" class="active" style="display:none;">
													<p class="select-sub-tit type2">무통장 입금 기부</p>
													<div class="fake-table-box type2">
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">중앙회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>02-6262-3000</p>
																<p class="account-holder"><span>예금주 :</span>사회복지공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협중앙회 : 083-01-263423</p>
																<p>외환은행 : 068-13-21094-9</p>
																<p>신한은행 : 100-013-446845</p>
																<p>국민은행 : 099-01-0339-091</p>
																<p>신한은행(구 조흥은행) : 140-003-224895</p>
																<p>SC제일은행 : 357-10-013340</p>
																<p>하나은행 : 140-224581-00105</p>
																<p>우리은행 : 323-095103-01-001</p>
																<p>시티은행 : 157-50149-256</p>
																<p>우체국 : 012591-01-006655</p>
																<p>기업은행 : 082-033121-04-016</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">강원 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>033-244-1661~2</p>
																<p class="account-holder"><span>예금주 :</span>강원도사회복지공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 203-01-448497</p>
																<p>외환은행 : 098-13-06557-3</p>
																<p>국민은행 : 301-01-0614-463</p>
																<p>우체국 : 200022-01-003311</p>
																<p>우리은행 : 027-156845-01-101</p>
																<p>SC제일은행 : 625-10-013042</p>
																<p>하나은행 : 792-810011-57105</p>
																<p>신한은행(구 조흥은행) : 100-013-455552</p>
																<p>기업은행 : 126-029311-01-010</p>
															</dd>
														</dl>
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">서울 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>02-3144-7700</p>
																<p class="account-holder"><span>예금주 :</span>사회복지공동모금회<br>서울특별시지회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 056-01-103831</p>
																<p>우리은행 : 015-176590-13-503</p>
																<p>국민은행 : 009-01-1306-221</p>
																<p>기업은행 : 035-038974-01-011</p>
																<p>수협 : 070-01-043011</p>
																<p>시티은행 : 100-59719-255</p>
																<p>신한은행(구 조흥은행) : 100-013-523932</p>
																<p>외환은행 : 118-22-02430-2</p>
																<p>우체국 : 010041-01-015621</p>
																<p>SC제일은행 : 130-10-012398</p>
																<p>하나은행(구 서울은행) : 137-337891-00104</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">충북 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>043-238-9100</p>
																<p class="account-holder"><span>예금주 :</span>충청북도공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 :  313-01-122113</p>
																<p>신한은행 : 100-013-376628</p>
																<p>국민은행 : 704301-01-002070</p>
																<p>우체국 :  300038-01-004702</p>
																<p>기업은행 :  293-056997-01-014</p>
																<p>하나은행 : 603-910013-06904</p>
															</dd>
														</dl>
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">부산 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>051-790-1400</p>
																<p class="account-holder"><span>예금주 :</span>부산공동모금회부산지회</p>
															</dt>
															<dd class="fake-table-td">
																<p>경남은행 : 515-07-0202929</p>
																<p>농협 : 919-01-209381</p>
																<p>부산은행 : 027-01-052227-3</p>
																<p>국민은행 : 107-25-0006-361</p>
																<p>우체국 : 600270-01-002081</p>
																<p>수협 : 707-01-047437</p>
																<p>외환은행 : 020-33-01480-8</p>
																<p>한국씨티은행 : 211-53920-250</p>
																<p>신한은행 : 140-005-691292</p>
																<p>우리은행 : 1006-000-034245</p>
																<p>SC제일은행 : 500-10-021474</p>
																<p>하나은행 : 303-910006-10005</p>
																<p>신한은행(구 조흥은행) : 100-018-635629</p>
																<p>중소기업은행 : 092-051315-01-010</p>
																<p>하나은행 : 315-910072-31305</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">충남 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>041-653-0340</p>
																<p class="account-holder"><span>예금주 :</span>충남공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 408-01-061862</p>
																<p>우체국 : 310037-01-004363</p>
																<p>SC제일은행 : 675-20-524825</p>
																<p>기업은행 : 413-000827-04-014</p>
																<p>KEB하나은행 : 621-740230-00105</p>
																<p>우리은행 : 559-070706-01-001</p>
																<p>국민은행 : 451-01-1003-737</p>
																<p>신한은행 : 100-013-457343</p>
															</dd>
														</dl>
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">대구 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>053-667-1000</p>
																<p class="account-holder"><span>예금주 :</span>사회복지공동모금회대구</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 703-01-343223</p>
																<p>대구은행 : 002-05-098038-502</p>
																<p>SC제일은행 : 557-10-012902</p>
																<p>국민은행 : 633-01-0038-153</p>
																<p>우체국 : 703975-01-000346</p>
																<p>기업은행 : 151-048907-04-018</p>
																<p>우리은행 : 034-341037-01-001</p>
																<p>외환은행 : 021-22-00814-5</p>
																<p>신한은행 : 100-013-446464</p>
																<p>하나은행 : 878-910001-27005</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">전북 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>063-282-0606</p>
																<p class="account-holder"><span>예금주 :</span>전북공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 508-01-042675</p>
																<p>전북은행 : 505-13-0311109</p>
																<p>우체국 : 400010-01-017741</p>
															</dd>
														</dl>
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">인천 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>032-456-3333</p>
																<p class="account-holder"><span>예금주 :</span>인천광역시공동모금회</p>
															</dt>
															<dd class="fake-table-td">
															   	<p>농협 : 147-01-182301</p>
																<p>국민은행 : 208-01-0505-298</p>
															   	<p>우체국 : 101659-01-000919</p>
															   	<p>SC제일은행 : 603-10-011709</p>
															   	<p>수협 : 273-61-008603</p>
															   	<p>신한은행(구 조흥은행) : 100-013-448757</p>
															   	<p>신한은행 : 100-013-448757</p>
															   	<p>기업은행 : 116-046210-01-015</p>
															   	<p>외환은행 : 023-13-40565-9</p>
															   	<p>하나은행 : 403-298260-00104</p>
															   	<p>우리은행 : 106-155901-13-101</p>
															   	<p>시티은행 : 301-52838-257</p>
															   	<p>하나은행 : 878-910001-27005</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">전남 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>061-902-6800</p>
																<p class="account-holder"><span>예금주 :</span>전라남도공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 301-4000-3000-01</p>
																<p>광주은행 : 650-107-008000</p>
																<p>국민은행 : 688801-00-048029</p>
																<p>신한은행 : 100-028-581833</p>
																<p>우체국 : 503441-01-003542</p>
																<p>우리은행 : 651-04-115702</p>
															</dd>
														</dl>
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">광주 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>062-222-3566</p>
																<p class="account-holder"><span>예금주 :</span>광주지역 공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 609-01-088271</p>
																<p>광주은행 : 053-107-999990</p>
																<p>국민은행 : 771301-01-005806</p>
																<p>기업은행 : 189-058554-01-015</p>
																<p>우체국 : 503474-01-002410</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">경북 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>053-980-7800</p>
																<p class="account-holder"><span>예금주 :</span>경북공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 731-01-002268</p>
																<p>대구은행 : 021-05-780444-001</p>
																<p>새마을금고 : 9002-09-951066-1</p>
																<p>국민은행 : 624-01-0129-338</p>
																<p>기업은행 : 161-019757-01-035</p>
																<p>하나은행(구 서울은행) : 515-810035-12705</p>
																<p>수협 : 601-01-069901</p>
																<p>우체국 : 700674-01-001682</p>
																<p>SC제일은행 : 760-10-011301</p>
																<p>신한은행(구 조흥은행) : 100-013-446457</p>
																<p>우리은행 : 034-413547-13-001</p>
															</dd>
														</dl>
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">대전 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>042-347-5171</p>
																<p class="account-holder"><span>예금주 :</span>사회복지공동모금회 대전지회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 477-01-004674</p>
																<p>하나은행 : 625-363399-00104</p>
																<p>국민은행 : 474-01-0031-926</p>
																<p>기업은행 : 145-030881-01-013</p>
																<p>신한은행 : 140-003-235589</p>
																<p>우리은행 : 562-05-000457</p>
																<p>SC제일은행 : 717-10-010490</p>
																<p>외환은행 : 274-22-00505-1</p>
																<p>우체국 : 312710-01-000723</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">경남 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>055-270-6700</p>
																<p class="account-holder"><span>예금주 :</span>경남공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>경남은행 : 511-32-0000343</p>
																<p>농협 : 301-0032-9329-11</p>
																<p>우리은행 : 751-04-108497</p>
																<p>SC제일은행 : 775-20-251052</p>
																<p>국민은행 : 841101-01-003253</p>
																<p>우체국 : 612499-01-000973</p>
																<p>외환은행 : 074-22-00547-6</p>
																<p>신한은행 : 140-003-235112</p>
																<p>기업은행 : 171-033886-01-023</p>
															</dd>
														</dl>
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">울산 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>052-270-9000</p>
																<p class="account-holder"><span>예금주 :</span>울산공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>경남은행 : 540-07-0163847</p>
																<p>농협 : 240-01-002298</p>
																<p>SC제일은행 : 780-10-011488</p>
																<p>국민은행 : 598-01-0075-322</p>
																<p>신한은행(구 조흥은행) : 811-01-114189</p>
																<p>시티은행 : 250-51378-256</p>
																<p>우체국 : 614024-01-000350</p>
																<p>우리은행 : 184-083479-01-301</p>
																<p>부산은행 : 111-01-007860-1</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">제주 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>064-755-9810</p>
																<p class="account-holder"><span>예금주 :</span>제주도사회복지공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 963-17-003420</p>
																<p>국민은행 : 703-01-0380-739</p>
																<p>제주은행 : 03-13-004820</p>
																<p>기업은행: 315-008742-01-011</p>
																<p>수협 : 801-01-136811</p>
																<p>우리은행 : 242-003221-13-201</p>
																<p>신한은행 : 100-013-454780</p>
																<p>KEB하나은행 : 782-810002-75004</p>
																<p>외환은행 : 194-22-00661-6</p>
																<p>우체국 : 510016-01-003440</p>
																<p>제일은행 : 800-10-014029</p>
															</dd>
														</dl>
														<dl class="fake-table-item">
															<dt class="fake-table-th">
																<p class="fake-tit">경기 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>031-220-7900</p>
																<p class="account-holder"><span>예금주 :</span>경기 공동모금회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 143-01-092152</p>
																<p>시티은행 : 321-51001-249</p>
																<p>SC제일은행 : 600-10-012652</p>
																<p>국민은행 : 242-25-0017-888</p>
																<p>신한은행(구 조흥은행) : 100-013-447330</p>
																<p>기업은행 : 287-064960-01-017</p>
																<p>하나은행 : 416-133130-00104</p>
																<p>우체국 : 104604-01-001402</p>
																<p>외환은행 : 254-22-02373-1</p>
																<p>우리은행 : 262-04-102516</p>
															</dd>
															<dt class="fake-table-th">
																<p class="fake-tit">세종 모금회</p>
																<p class="account-num"><i class="sprite-group-tel"></i>044-863-5400</p>
																<p class="account-holder"><span>예금주 :</span>사회복지공동모금회<br>세종특별자치시지회</p>
															</dt>
															<dd class="fake-table-td">
																<p>농협 : 301-0127-0335-01</p>
																<p>신한은행 : 140-010-008149</p>
																<p>국민은행 : 455801-04-302695</p>
																<p>우리은행 : 1005-802-233779</p>
																<p>기업은행 : 396-383838-01-013</p>
																<p>하나은행 : 670-910008-41404</p>
															</dd>
														</dl>
													</div>
												</div>
								</div>
							</div>
						</section>

<!-- 						<section class="ui-tab-pnl"> -->
<!-- 							<div class="tab-contents"> -->
<!-- 								<div style="height:300px;background-color:#fef2f2">1111111111111111111111111111</div> -->
<!-- 							</div> -->
<!-- 						</section> -->
					</div>
					</form>
				</div>
<!-- 				<div class="banner-img"> -->
<!-- 					<img src="/common/img/contents/banner_img.jpg" alt="기부관련 상담을 원하시나요? 나눔콜센터 080-890-1212"> -->
<!-- 				</div> -->
			</div>			
		</div>
	</main>

<script>

(function($, win, doc, undefined) {
	$(doc).ready(function(){
	$plugins.uiTab({
		id:'uiTabguide1',
		current: 0,
		unres : true,
		callback: function(v){
			$(".ui-tab-btns > button").removeAttr("tabindex");
			switch(v.current) {
				case 0 :
					$('.ui-tab-pnl:eq(0)').show();
// 					$('.ui-tab-pnl:eq(1)').hide();
					$("#passbook").hide();
					break;
				case 1 :
					$('.ui-tab-pnl:eq(0)').hide();
// 					$('.ui-tab-pnl:eq(1)').show();
					$("#passbook").show();
					break;
			}
		}
	});
    });
})(jQuery, window, document);

function radioEvent( name ){
	var value = $(':radio[name="' + name + '"]:checked').val(); 
	
	if( name == "singleAndBiz" ) {
		if( value == "jumin" ) {
			$(".juminLayout , .mailLayout").show();
			$(".bizNmLayout").hide();
			$(".bizNm , .mailLayout").find('input').val('');
		} else {
			$(".bizNmLayout , .mailLayout").show();
			$(".juminLayout").hide();
			$(".juminLayout , .mailLayout").find('input').val('');
		}
		bizOrSinRaradioEvent('rciptReqstAt');
	}
}

function metpaysEvent(){	
	var value = $("#metpaySe").val();	
	if( value == "90" ) {	//포인트
		$("#point").show();
		$("#credit").hide();
	} else {
		$("#credit").show();
		$("#point").hide();
	}
	
	if( value == "04" ){			// 네이버
		$("#pay04_desc").show();
		$("#pay01_desc").hide();
	} else if( value == "05" ) {	// 카카오 
		$("#pay04_desc").hide();
		$("#pay01_desc").hide();
	} else {						// 이니페이
		$("#pay01_desc").show();
		$("#pay04_desc").hide();
	}
	
	makeSelectBoxEventCode( value );	
}

function bizOrSinRaradioEvent( name ) {
	var bizSigvalue = $(':radio[name="singleAndBiz"]:checked').val(); 
	var value = $(':radio[name="' + name + '"]:checked').val();
	if( bizSigvalue == "jumin" ) {
		//개인
		if( value == "Y" ){
			$(".juminLayout , .mailLayout").show();
			$(".bizLayout").hide();
		} else {
			$(".mailLayout , .bizLayout , .juminLayout").hide();
		}
	} else {
		//사업자
		if( value == "Y" ){
			$(".mailLayout , .bizLayout").show();
			$(".juminLayout").hide(); 
		} else {
			$(".bizLayout , .mailLayout , .juminLayout").hide();
		}
	}
	$(".juminLayout , .mailLayout , .bizLayout").find('input').val('');
	
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
	
	//약정그룹 이벤트코드  
// 	makeSelectBoxEventCode('01');
}

function makeSelectBoxEventCode( setleMthd ) {
	var arr = new Array();
	param = {"mysCl1":"01" , "mysCl2":"01" , "setleMthd": setleMthd , "speclMysAt": _speclMysAt , "eventCode":_eventCode };
	arr.push( param );
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
	
	if( _speclMysAt == "Y" ) {
		//if( $(':radio[name="metpaySe"]:checked').val() != '90' ) {
		if( $("#metpaySe").val() != '90' ) {
			
			// 결제방법 보여주기	 
			$("[data-pay]").each( function( i, item) {
				$(this).hide();
			});	
			$("#radiopay90").show();	// 포인트
			$(data.setleMthdList).each( function( i,item ) {
				$("#radiopay"+item.setleMthd).show();
			});
			
			/* if( data.codeList0.length == 0 ) {
				alert("선택할 수 없는 기부방식 입니다.");
				$("[data-pay]").removeClass("active");
    			$("[data-pay][value='" + _setleMthd + "' ]").addClass("active");
    			metpaysEvent(_setleMthd);
				return false;
			} */
		}
		
		//'재난기본소득 나눔캠페인' (경기지회)의 일시기부 관심분야를 '경제적 빈곤퇴치'로 고정 
		if( _eventCode == '202000000003' ) {
			$('#intrstRealm option[value="01"]').prop('selected','selected');
			$('#intrstRealm option').each(function(){
				var val = $(this).val();
				if( val != '01') {
					$(this).remove();
				} 
			});
		}
	} else {	//미사용버튼 처리
		//$("#radiopay04").hide();	//네이버
		//$("#radiopay05").hide();	//카카오
		$("#radiopay06").hide();	//페이코
		$("#radiopay07").hide();	//삼성페이
		$("#radiopay08").hide();	//L페이
		$("#radiopay09").hide();	//SSG페이
		$("#radiopay10").hide();	//토스
	}

	$(data.codeList0).each( function( i,item ) {
		el += "<option value='" + item.eventCode + "' bhfCode='"+item.bhfCode+"'>" + item.bhfCodeNm + "</option>";
	});
	$("#eventCode").html(el);	
	$("select[name='eventCode'] option[bhfCode='"+ __branchCd +"']").prop("selected",true);
	_common.makeSelectLayout();	//select box 
	
	//특별모금에서 클릭하고 들어왔을 경우
	if( _speclMysAt == "Y" && $("#metpaySe").val() != '90' ) {
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
	$("#cntrAmount").val("3,000");
	$("#nm").val("김민수");
	$("#result").val("Y");
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
	
	$('#eventCode option[value="201900000016"]').prop('selected','selected');
	$('#intrstRealm option[value="07"]').prop('selected','selected');
	$("input:checkbox[id='agreeInfo']").prop("checked", true);
	$("input:checkbox[id='agreeInfo1']").prop("checked", true);
	$("input:radio[id='receiptYn2']").prop("checked", true);
	
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
