<!-- 
	########################### 기업 일시기부 상담 ###########################
-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>
<script type="text/javascript">
var url = "/ct/lmpscntr";
var __branchCd = $.cookie('__branchCd');
	
$(document).ready(function(){
	keyEvent();	//숫자만 입력가능
	makeSelectBoxEventCode();
	_common.makeSelectLayout();	//select box
// 	setTestData();
});

$(document).on("click", "#btnCompanyInsert ,#companyCheckPlus", function(e){
    e.preventDefault();
    var id = $(this).attr("id");
    //기업기부 본인인증
    if( id == "companyCheckPlus") {
    	_compayCheckFlag = true;
    	window.name='mainPopup';
    	fnPopup();
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
    		$("#companyFrm > input[name=eventCode]").val( $("#bhfCode option:checked").attr("eventCode") );
    		gf_sendForm("companyFrm" , url + "/insertCompany.do" );
    	}
    }
});

function keyEvent() {
	//숫자만 입력가능
	$("input:text[numberOnly]").on("keyup keydown", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });		
}

function insertCompanyAfter( data ) {
	if( data.result > 0 ) {
		alert("상담신청이 완료 되었습니다");
		location.href = url + "/initEntrprs.do";
		return false;
	} 
}

function companyValidator() {
	var chk = $("input:checkbox[name='agreeInfoCompany']").is(":checked");
		if( $("#bhfCode option:checked").val() == "01" ) {
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
			alert("제 3자 제공에 동의해주세요");
    		$("#agreeInfoCompany").focus();
    		return false;
		}
		if( $("#companyResult").val()  == "N" ) {
			alert("본인인증을 해주세요");
    		return false;
	}
	return true;
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
	$("#companyPhone1").val(a);
   	$("#companyPhone2").val(b);
   	$("#companyPhone3").val(c);
   	$("#companyResult").val(result);
}

function fail() {
	alert("본인인증이 실패하였습니다.");
}


</script>

<form name="form_chk" method="post">
	<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="<%= sEncData %>">				<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="companyResult" id="companyResult" value="N" />
	
</form>

<!-- 기업기부 폼 -->
<form id="companyFrm" name="companyFrm" method="post" >
	<input type="hidden" name="bhfCode" id="hidBhfCode" />
	<input type="hidden" name="nm" id="hidComNm" />
	<input type="hidden" name="telno" id="hidTelno" />
	<input type="hidden" name="agreAt" id="hidAgreAt" />	
	<input type="hidden" name="iemCode" value="02"/>
	<input type="hidden" name="reqstManageTy" value="${reqstManageTy }"/> <!-- HP0025 -->
	<input type="hidden" name="progrsSttus" value="01"/> 
</form>

			<div class="sub-visual visual02_01">
				<div class="sub-title-area">
					<h2 class="heading-title-a">일시기부</h2>
					<p class="title-sub-txt">2depth 설명글 수급 중입니다.</p>
				</div>
			</div>
			
			<%@ include file="../../layout/breadcrumbs.jsp"%>
			
			<main class="base-main" id="baseMain">
				<div class="contents-area">
					<div class="contents-hd line-type">
						<h3><strong id="eventNm">기업</strong><span>당신의 나눔이 모두의 행복입니다. 나눔의 힘을 믿어보세요.</span></h3>
						<div class="contents-menu-nav">
						</div>
					</div>

					<div class="seo-box">
						<p class="tab-desc">안녕하세요. 사랑의열매입니다. 기부신청 감사드립니다. 기업기부의 경우에는 담당자와 통화가 필요합니다.<br>아래의 내용을 모두 작성해주세요. 최대한 빨리 연락드리겠습니다.</p>
						<!-- S : 기부상담신청 -->
						<div id="" class="sb-box">
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
																<th>상담지역</th>
																<td>
																	<div class="ui-select w-full">
																		<select class="sel_type" id="bhfCode" name="bhfCode" title="상담지역 선택"></select>
																	</div>
																</td>
															</tr>
															<tr>
																<th>성명</th>
																<td>
																	<input type="text" class="inp-base w-full" id="companyNm" title="성명">
																</td>
															</tr>
															<tr>
																<th>휴대폰 번호<span class="required">*</span></th>
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
																	<p class="table-cell">
                        	- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
                        	- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.
                        </p>
																	<div class="table-cell privacy-area">
																		<div class="checkbox">
																			<input type="checkbox" id="agreeInfoCompany" name="agreeInfoCompany" >
																			<label for="agreeInfoCompany"><span>기부상담을 위해 개인정보 제 3자 제공에 동의합니다.</span></label>
																		</div>
																		<div class="privacy-box">
																			※개인정보 제3자 제공 이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 기부관련업무 및 콜센터 상담이용 등의 해당 업무가 제한을 받을 수 있습니다.
																		</div>
																		<div class="btn-area-r">
																			<button type="button" class="btn-base-bline small" onclick="javascript:goFootPrivacy();">개인정보처리방침</button>
																		</div>
																	</div>
																</td>
															</tr>
															</tbody>
														</table>
							        </div>
							
							        <div class="btn-area">
							            <button type="button" class="btn-base-imp" id="btnCompanyInsert">상담신청</button>
							        </div>
							    </div>
							</div>
						
						</div>
						<!-- E : 기부상담신청 -->
					</div>
				</div>
			</main>

<script>
(function($, win, doc, undefined) {
	$plugins.uiTab({
		id:'uiTabguide1',
		current:1
	});
})(jQuery, window, document);

function makeSelectBoxEventCode() {
	var arr = new Array();
	param = {"mysCl1":"10" , "mysCl2":"04" , "setleMthd":""};
	arr.push( param );
	var parameter = {"arr":JSON.stringify(arr)};
	gf_send( url + "/selectSelList.do", parameter );
}

function selectSelListAfter(data) {
	//기업기부 , 상담지역
	el = '';
	$(data.codeList0).each( function( i,item ) {
		el += "<option value='"+item.bhfCode+"'>" + item.bhfCodeNm + "</option>";
	});
	$("#bhfCode").html(el);
	$("select[name='bhfCode'] option[value='"+ __branchCd +"']").prop("selected",true);
}
function setTestData() {
	$("#companyResult").val("Y");
	$("#companyPhone1").val("010");
	$("#companyPhone2").val("2020");
	$("#companyPhone3").val("4048");
}
</script>
