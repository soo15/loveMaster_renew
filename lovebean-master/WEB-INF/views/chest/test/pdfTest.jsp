<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	var url = "/test";
    $(document).ready(function(){
    });
    
    $(document).on("click", "#checkPlus", function(e){
        window.name='mainPopup';
        window.open('/common/nicePopupTest.do', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
    });
    
    
	function success( obj ) {
		console.log( obj );
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
    }
		
    
</script>

<input type="text" class="form-w01" name="nm" id="nm" title="기부자 이름" readonly="readonly">

<div class="phone-area">
    <input type="text" class="inp-base" title="휴대폰 앞자리" name="phone1" id="phone1" readonly value="">
    <span class="txt-mark">-</span>
    <input type="text" class="inp-base" title="휴대폰 중간자리" name="phone2" id="phone2" readonly value="">
    <span class="txt-mark">-</span>
    <input type="text" class="inp-base" title="휴대폰 뒷자리" name="phone3" id="phone3" readonly value="">
    <button type="button" class="btn-base-imp small" id="checkPlus">인증</button>
</div>
<form>
<input type=hidden name="result" id="result" />
</form>

