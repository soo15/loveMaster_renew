<!-- 
	########################### 기부내역조회 ###########################
-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ include file="../../include/ghead.jsp"%>
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>
<%
DecimalFormat df = new DecimalFormat("00");
Calendar currentCalendar = Calendar.getInstance();
String strYear =  Integer.toString(currentCalendar.get(Calendar.YEAR));							//현재 날짜 구하기	
%>
<script type="text/javascript">
var url = "/fr/mycntr";
var myGrid = null;
var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";
var __branchCd = $.cookie('__branchCd');
var _path = "<%=path%>";

$(document).ready(function(){
	_common.selectTab( 'uiTabAPPL03_1' ,0 );	//tab
	keyEvent();	//숫자만 입력가능
	makeSelectBox();
	radioEvent('issuMth');
	radioEvent('singleAndBiz');
	
	//내 로컬에서만 기본데이터 세팅하게 수정
	if( _path.indexOf("localhost") > -1 ) {
		setTestData();
		$("#btnConfirm").trigger("click");
	}
});

$(document).on("click", "#checkPlus , #companyCheckPlus , #btnConfirm , #btnCompanyConfirm , #searchZipCode , #btnRciptInsert", function(e){
    e.preventDefault();
    var id = $(this).attr("id");
    if( id == "searchZipCode") {
    	openZipCode('zip','adres1');
    }
    
    if( id == "checkPlus") {
    	window.name='mainPopup';
    	fnPopup();
    }
    
    if( id == "btnRciptInsert") {
    	if( !validator() ) return;
    	if( confirm("신청 하시겠습니까?") ) {
    		makeFormData();
    		gf_sendForm("frm1" , url + "/insert.do");
    	}
    }
    
    if( id == "btnConfirm" ) {
    	
    	if( $.trim( $("#singleNm").val() ).length == 0 ) {
    		alert("기부자명을 입력해주세요");
    		$("#singleNm").focus();
    		return false;
    	}
    	
    	if( $("#result").val() != "N" ) {
    		$(".seo-box:eq(0)").hide();
    		$(".seo-box:eq(1)").show();
    		$("#frm > #nm").val( $("#singleNm").val() )
    		var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
    		$("#frm > #mbtlnum").val( phone );
    		
    		var birth = $("#yy").val().substring(2,4) + "" + $("#mm").val() + "" + $("#dd").val();
    		$("#frm > #yymmdd").val( birth );
    		
    		$plugins.uiTab({
    			id:'uiTabAPPL03_2',
    			current: 1,
    			unres : true,
    			callback: function(v){
    				switch(v.current) {
    					case 0 :
    						selectList();
    						$(".ui-tab-pnl:eq(1)").show();
    						$(".ui-tab-pnl:eq(2)").hide();
    						break;
    					case 1 :
    						selectCicsList();
    						$(".ui-tab-pnl:eq(1)").show();
    						$(".ui-tab-pnl:eq(2)").hide();
    						break;
    					case 2 : 
    						$(".ui-tab-pnl:eq(1)").hide();
    						$(".ui-tab-pnl:eq(2)").show();
    						break;
    				}
    			}
    		});
    	} else {
    		alert("본인인증을 해주세요");
    		return false;
    	}
    	
    }
});

function insertAfter( data ) {
	if( data.result > 0 ) {
		alert("기부금 영수증 신청이 완료 되었습니다");
		location.href = url + "/initCntrdtlsinqire.do";
		return false;
	}
}

function formatDate( str ) {
	var result = str;
	result = str.substring(0,4) + "." + str.substring(4,6) + "." + str.substring(6,8);
	return result
}

function selectList(pageNo){
    gf_send("<c:url value='" + url + "/selectList.do' />", gf_searchParam(pageNo ,"frm") );
}

function selectCicsList(pageNo){
    gf_send("<c:url value='" + url + "/selectCicsList.do' />", gf_searchParam(pageNo ,"frm") );
}

function selectListAfter(data) {
	var el="";
	if( data.listInfo == "" ) {
		$("#donation-text").text("");
		$("#totalPrice").text( "0원");
		el = "<tr><td colspan='6'>데이터가 없습니다.</td></tr>";
		$("#dataGridList tbody").html(el);
		$("#dataGridPageNavi").html("");
		return false;
	}
	myGrid = gf_initMyGrid();
	
	//기부기간 , 총액 
	var detail = data.detailInfo;
	$("#donation-text").text( detail.firstPeriod + " ~ " + detail.lastPeriod );
	$("#totalPrice").text(  detail.cntrAmount + "원");
	
	$(data.listInfo).each( function(i,item) {
		el += '<tr>';
		el += '<td>'+ item.gubun +'</td>';
		el += '<td align="right">'+ item.cntrAmount +'원</td>';
		el += '<td>'+ item.metpaySeNm +'</td>';
		el += '<td>'+ item.bhfCodeNm +'</td>';
		el += '<td>'+ item.cntrBgnmt +'</td>';
		el += '</tr>';
	});
	
	$("#dataGridList tbody").html(el);
	$("#dataGridPageNavi").html("");
	
	if( data.listInfo.length > 0 )
		myGrid.makePageNvai(data.pageInfo, "selectList");
}

function selectCicsListAfter(data) {
	console.log( data );
	myGrid = gf_initMyGrid();
	var el="";
	if( data.listInfo == "" ) {
		$("#donation-text").text("");
		$("#totalPrice").text( "0원");
		el = "<tr><td colspan='6'>데이터가 없습니다.</td></tr>";
		$("#dataGridList tbody").html(el);
		$("#dataGridPageNavi").html("");
		return false;
	}
	
	//기부기간 , 총액 
	$("#donation-text").text( formatDate ( data.listInfo[0].first ) + " ~ " + formatDate ( data.listInfo[0].last ) );
	$("#totalPrice").text( comma( data.listInfo[0].amount ) + "원");
		
	$(data.listInfo).each( function(i,item) {
		el += '<tr>';
		el += '<td>'+ item.구분 +'</td>';
		el += '<td align="right">'+ comma( item.금액) +'원</td>';
		el += '<td>'+ item.결제수단 +'</td>';
		el += '<td>'+ item.법인명 +'</td>';
        el += '<td style="text-align:left">'+ item.프로그램명 +'</td>';
		el += '<td>'+ formatDate ( item.기부일자  ) +'</td>';
		el += '</tr>';
	});
	$("#dataGridList tbody").html(el);
	$("#dataGridPageNavi").html("");
	
	if( data.listInfo.length > 0 )
		myGrid.makePageNvai(data.pageInfo, "selectCicsList");
}


function makeSelectBox() {
	var year = new Date();
	var el="";
	for( var i=1930; i<= year.getFullYear(); i++ ) {
		el += "<option value='"+i+"'>" + i + "</option>";    		
	}
	$("#yy").html(el);
	$("select[name='yy'] option[value='1980']").prop("selected",true);
	
	el = "";
	for( var i=1; i<=12; i++ ) {
		el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";    		
	}
	$("#mm").html(el);
	el = "";
	for( var i=1; i<=31; i++ ) {
		el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";    		
	}
	$("#dd").html(el);
	
	// 기부기간
	el='';
	for( var i=2010; i<= year.getFullYear(); i++ ) {
		el += "<option value='"+i+"'>" + i + "</option>";    		
	}
	$("#yys").html(el);	//시작년도
	
	el='';
	for( var i=1; i<=12; i++ ) {
		el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";    		
	}
	$("#mms").html(el);	//시작월
	
	el='';
	for( var i=2010; i<= year.getFullYear(); i++ ) {
		el += "<option value='"+i+"'>" + i + "</option>";    		
	}
	$("#yye").html(el);	//종료년도
	
	el='';
	for( var i=1; i<=12; i++ ) {
		el += "<option value='"+zeroSum(i)+"'>" + zeroSum(i) + "</option>";    		
	}
	$("#mme").html(el);	//종료월
	
	_common.makeSelectLayout();	//select box 
}

function keyEvent() {
	//숫자만 입력가능
	$("input:text[numberOnly]").on("keyup keydown", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
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
	
	//생년월일
	var birth = obj.sBirthDate;
	if( birth != "" && birth != null ) {
		$("#yy option[value='" + birth.substring(0,4) + "']").prop("selected","selected");
		$("#mm option[value='" + birth.substring(4,6) + "']").prop("selected","selected");
		$("#dd option[value='" + birth.substring(6,8) + "']").prop("selected","selected");		
	}
	_common.makeSelectLayout();
	
	$("#singleNm").val(sname);
   	$("#phone1").val(a);
   	$("#phone2").val(b);
   	$("#phone3").val(c);
   	
   	$("#nm1").val(sname);
   	$("#phone4").val(a);
   	$("#phone5").val(b);
   	$("#phone6").val(c);
   	$("#result").val(result);
   	
}

function fail() {
	_compayCheckFlag = false;
	alert("본인인증이 실패하였습니다.");
}

function validator() {
	var issuMth= $(':radio[name="issuMth"]:checked').val();
	var singleAndBiz = $(':radio[name="singleAndBiz"]:checked').val();
	if( $.trim( $("#bhfCode option:checked").val() ).length == 0 ) {
		alert("기부지역을 선택해주세요");
		$("#bhfCode").focus();
		return false;
	}
	if( $.trim( $("#yys option:checked").val() ).length == 0 ) {
		alert("기부시작 년도를 선택해주세요");
		$("#yys").focus();
		return false;
	}
	if( $.trim( $("#mms option:checked").val() ).length == 0 ) {
		alert("기부시작 월을 선택해주세요");
		$("#yys").focus();
		return false;
	}
	if( $.trim( $("#yye option:checked").val() ).length == 0 ) {
		alert("기부종료 년도를 선택해주세요");
		$("#yye").focus();
		return false;
	}
	if( $.trim( $("#mme option:checked").val() ).length == 0 ) {
		alert("기부종료 월을 선택해주세요");
		$("#mme").focus();
		return false;
	}
	var sdate = $("#yys option:checked").val() + "" + $("#mms option:checked").val();
	var edate = $("#yye option:checked").val() + "" + $("#mme option:checked").val();
	if( edate < sdate ) {
		$("#yys").focus();
		alert("기부기간을 확인해주세요");
		return false;
	}
	
	
	if( singleAndBiz == "jumin" ) {
	
		if( $.trim( $("#jumin1").val() ).length == 0 || $.trim( $("#jumin1").val() ).length < 6) {
			alert("주민번호를 입력해주세요");
			$("#jumin1").focus();
			return false;
		}
		if( $.trim( $("#jumin2").val() ).length == 0 || $.trim( $("#jumin2").val() ).length < 7) {
			alert("주민번호를 입력해주세요");
			$("#jumin2").focus();
			return false;
		}
	} else {
		
		if( $.trim( $("#bplcNm").val() ).length == 0 || $.trim( $("#bplcNm").val() ).length < 5) {
			alert("사업자명을 입력해주세요");
			$("#bplcNm").focus();
			return false;
		}
		
		
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
	
	//우편
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
	
	//메일
	if( issuMth == "01" ) {
		if( $.trim( $("#email1").val() ).length == 0 || $.trim( $("#email2").val() ).length == 0 ) {
    		alert("이메일을 입력해주세요");
    		$("#email1").focus();
    		return false;
    	}
    	var email = $("#email1").val() + "@" + $("#email2").val();				//이메일
    	if( isEmail( email ) == false ) {
    		alert("이메일 형식이 아닙니다.");
        	return false;
    	}
	}

	
	//팩스
	if( issuMth == "03" ) {
		if( $.trim( $("#fax1").val() ).length == 0 ) {
    		alert("팩스번호를 입력해주세요");
    		$("#fax1").focus();
    		return false;
    	}
		if( $.trim( $("#fax2").val() ).length == 0 ) {
    		alert("팩스번호를 입력해주세요");
    		$("#fax2").focus();
    		return false;
    	}
		if( $.trim( $("#fax3").val() ).length == 0 ) {
    		alert("팩스번호를 입력해주세요");
    		$("#fax3").focus();
    		return false;
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
	
</script>

<form name="form_chk" method="post">
	<input type="hidden" name="m" value="checkplusSerivce">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" name="EncodeData" value="<%= sEncData %>">				<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="result" id="result" value="N" />
</form>

<form name="frm" method="post" id="frm">
	<input type="hidden" name="nm" id="nm" />
	<input type="hidden" name="mbtlnum" id="mbtlnum" />
	<input type="hidden" name="yymmdd" id="yymmdd" />
</form>

<div class="sub-visual visual02_01">
	<div class="sub-title-area">
		<h2 class="heading-title-a">나의 기부</h2>
		<p class="title-sub-txt"></p>
	</div>
</div>
			
<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
	<div class="contents-area">
		<div class="contents-hd">
			<h3>
				<strong>기부내역 조회 및 영수증 신청</strong>
				<span>기부 내역을 확인하실 수 있습니다.</span>
			</h3>
			<div class="contents-menu-nav">
				<button type="button" class="next-menu">기부금영수증 신청</button>
			</div>
		</div>

		<div class="seo-box">

			<div class="ui-tab ui-tab-type2 col-3 contents-tab mgt-xxxl" id="uiTabAPPL03_1">
				<div class="ui-tab-btns" btn-id="uiTabAPPL03_1">
					<button type="button" class="ui-tab-btn" style="display:none;"><i>홈페이지 기부내역</i></button>
					<button type="button" class="ui-tab-btn" style="display:none;"><i>사랑의 열매 전체 기부내역</i></button>
					<button type="button" class="ui-tab-btn" style="display:none;"><i>기부금 영수증 신청</i></button>
				</div>
				<div class="ui-tab-pnls" pnl-id="uiTabAPPL03_1">
					<section class="ui-tab-pnl">
						<h1 class="hide">개인</h1>
						<div class="tab-contents">
							<div class="sb-box mgt-l">
								<div class="sb-box-inner">
									<p class="sb-contents-desc mg-n">기부자명(기업인 경우 기부 담당자명)과 기부시 입력했던 기부자의 휴대폰 본인인증을 통하여 <br>기부 (신청) 내역을 확인하실 수 있습니다.</p>
									<div class="sb-content">
										<div class="sb-content-tbl">
											<table id="singlArea">
												<caption>기부내역조회 정보입니다.</caption>
												<colgroup>
													<col class="col-l">
													<col class="col-auto">
												</colgroup>
												<tbody>
                                                <tr>
                                                    <td colspan=2 style="font-weight:bold; font-size:12px">
                                                        <font color="red">기부자명</font>과 <font color="red">휴대폰 번호</font>는 인증 버튼을 먼저 누르시고 본인인증을 완료하시면 자동으로 입력됩니다.
                                                    </td>
                                                </tr>
												<tr>
													<th scope="row">
														<label for="nm">기부자명</label>
													</th>
													<td>
														<input type="text" class="inp-base w-full" id="singleNm" title="기부자명" readonly="readonly">
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="yy">생년월일</label>
													</th>
													<td>
														<div class="day-form">
															<div class="day-form-row">
																<div class="ui-select sel_small">
																	<select class="sel_type" id="yy" name="yy" title="년 선택">	</select>
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
																	<select class="sel_type" id="dd" name="dd" title="일 선택">	</select>
																</div>
																<span class="day-txt">일</span>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="appl03_t3_2">기부자 휴대폰</label>
													</th>
													<td class="phone-area">
														<div class="table-cell ps-box">
															<span>
																<input type="text" class="inp-base" title="휴대폰 앞자리" id="phone1" readonly="readonly" numberOnly value="">
															</span>
															<span>
																<input type="text" class="inp-base" title="휴대폰 중간자리" id="phone2" readonly="readonly" numberOnly value="">
															</span>
															<span>
																<input type="text" class="inp-base" title="휴대폰 뒷자리" id="phone3" readonly="readonly" numberOnly value="">
															</span>
															<button type="button" class="btn-base-imp small" id="checkPlus" title="새 창 열림">인증</button>
														</div>
														<p class="table-cell">
                        	- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
                        	- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.
                        </p>
													</td>
												</tr>
												</tbody>
											</table>
										</div>

										<div class="btn-area">
											<button type="button" class="btn-base-imp" id="btnConfirm">확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>

				</div>
			</div>
		</div>	<!--  seo box end -->
		
		<div class="seo-box" style="display:none;">
			<div class="ui-tab ui-tab-type2 col-2 contents-tab mgt-xxxl" id="uiTabAPPL03_2">
				<div class="ui-tab-btns" btn-id="uiTabAPPL03_2">
					<button type="button" class="ui-tab-btn" style="display:none;"><i>홈페이지 기부내역</i></button>
					<button type="button" class="ui-tab-btn" style=""><i>사랑의 열매 전체 기부내역</i></button>
					<button type="button" class="ui-tab-btn" style=""><i>기부금 영수증 신청</i></button>
				</div>
				<div class="ui-tab-pnls" pnl-id="uiTabAPPL03_2">
				<section class="ui-tab-pnl">
					<p class="donation-guide-txt mgt-xs mgb-xs">
						기부자명(기업인 경우 기부 담당자명)과 기부시 입력했던 기부자의 휴대폰 번호가 변경된 경우 내역 조회가 안될 수 있습니다.  
						<br/>
						기부자분의 기부내역과 상이할 시 나눔콜센터(080-890-1212)로 연락주시면 확인해드리겠습니다.
					</p>
					<div class="donation-info">
						<dl class="donation-box donation-date">
							<dt class="donation-tit">기부 기간 (최초 기부일 ~ 최종 기부일)</dt>
							<dd class="donation-text" id="donation-text"></dd>
						</dl>
						<dl class="donation-box donation-price">
							<dt class="donation-tit">총액</dt>
							<dd class="donation-text color-type1" id="totalPrice"></dd>
						</dl>
					</div>
					
					<div class="tb-type_b not-head has-checkbox">
					<table id="dataGridList" summary="기부내역">
						<caption>기부내역 입니다.</caption>
						<colgroup>
							<col>
							<col>
							<col>
							<col>
							<col style="width:30%">
                            <col>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">금액</th>
								<th scope="col">결제수단</th>
								<th scope="col">지회</th>
                                <th scope="col">프로그램</th>
								<th scope="col">기부일</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<div id="dataGridPageNavi" class="paging-area"></div>
			</section>
			<section class="ui-tab-pnl">
			<form name="frm1" method="post" id="frm1">
			<input type="hidden" name="mbtlnum" id="mbtlnum" />
			<input type="hidden" name="cntrBgn" id="cntrBgn" />
			<input type="hidden" name="cntrEnd" id="cntrEnd" />
			<input type="hidden" name="ihidnumBizno" id="ihidnumBizno" />
			<input type="hidden" name="adres" id="adres" />
			<input type="hidden" name="email" id="email" />
			<input type="hidden" name="faxNo" id="faxNo" />
			
				<div class="tb-type_a mb-type">
					<table summary="기부금 영수증 신청 정보">
                        <caption>기부금 영수증 신청 정보입니다.</caption>
						<colgroup>
							<col class="col-xs">
							<col class="col-auto">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">
								<label for="nm">이름<span class="required" aria-label="필수">*</span></label>
							</th>
							<td>
								<input type="text" class="form-w01" name="nm" id="nm1" title="기부자 이름" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="phone1">휴대폰 번호<span class="required" aria-label="필수">*</span></label>
							</th>
							<td>
								<div class="phone-area">
									<input type="text" class="inp-base" title="휴대폰 앞자리" name="phone4" id="phone4" readonly value="">
									<span class="txt-mark">-</span>
									<input type="text" class="inp-base" title="휴대폰 중간자리" name="phone5" id="phone5" readonly value="">
									<span class="txt-mark">-</span>
									<input type="text" class="inp-base" title="휴대폰 뒷자리" name="phone6" id="phone6" readonly value="">
								</div>
								<p class="donation-guide-txt">
									- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
									- 기부자 본인을 확인하기 위해서 기부자님의 본인인증이 반드시 필요합니다.
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="bhfCode">기부지역<span class="required" aria-label="필수">*</span></label>
							</th>
							<td class="hope-area">
								<div class="ui-select form-w01">
									<select class="sel_type" id="bhfCode" name="bhfCode" title="기부지역 선택" >
										<c:out value="${bhfCodeList}" escapeXml="false" />
									</select>
								</div>
								<p class="donation-guide-txt">
								- 기부하신 지역(지회)를 선택하여 주세요.(기부하신 지역을 잘 모르실 경우는 일단 중앙회로 하시면 됩니다.)
								</p>
							</td>
						</tr>
							
						<tr>
							<th scope="row">
								<label for="yys">기부기간<span class="required" aria-label="필수">*</span></label>
							</th>
							<td class="hope-area">
								<div class="day-form">
									<div class="day-form-row">
										 <div class="ui-select sel_small">
											<select class="sel_type" id="yys" name="yys" title="년 선택"></select>
										</div>
										<span class="day-txt">년</span>
									</div>
									<div class="day-form-row">
										<div class="ui-select sel_small2">
											<select class="sel_type" id="mms" name="mms" title="월 선택"></select>
										</div>
										<span class="day-txt">~</span>
									</div>
									<div class="day-form-row">
										<div class="ui-select sel_small2">
											<select class="sel_type" id="yye" name="yye" title="년 선택"></select>
										</div>
										<span class="day-txt">년</span>
									</div>
									<div class="day-form-row">
										<div class="ui-select sel_small2">
											<select class="sel_type" id="mme" name="mme" title="월 선택"></select>
										</div>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row">
								<label for="cntrAmount">기부금액</label>
							</th>
							<td>
								<input type="text" class="form-w01" name="cntrAmount" id="cntrAmount" title="기부금액" numberOnly maxlength="10"/>
								<span class="txt-mark">원 ( 예:200000 )</span>
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
								<label for="bplcNm">사업자명<span class="required" aria-label="필수">*</span></label>
							</th>
							<td>
								<input type="text" class="form-w01" title="사업자명" name="bplcNm" id="bplcNm">
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
							<th scope="row">
								<label for="receiptYn1">발급방법<span class="required" aria-label="필수">*</span>
								</label>
							</th>
							<td>
								<div class="radio-group">
									<span class="radio">
										<input type="radio" name="issuMth" id="issuMth1" value="01" onclick="radioEvent('issuMth');" checked>
										<label for="issuMth1"><span>메일</span></label>
									</span>
									<span class="radio">
										<input type="radio" name="issuMth" id="issuMth2" value="02" onclick="radioEvent('issuMth');">
										<label for="issuMth2"><span>우편</span></label>
									</span>
									<span class="radio">
										<input type="radio" name="issuMth" id="issuMth3" value="03" onclick="radioEvent('issuMth');">
										<label for="issuMth3"><span>팩스(팩스번호입력)</span></label>
									</span>
								</div>
							</td>
						</tr>
						<tr class="issuMth_01">
							<th scope="row">
								<label for="email1">이메일<span class="required" aria-label="필수">*</span></label>
							</th>
							<td>
								<div class="email-area">
									<input type="text" class="in-w03" title="이메일 아이디" name="email1" id="email1" style="ime-mode:disable;" >
									<span class="txt-mark">@</span>
									<input type="text" class="in-w03" title="이메일 도메인주소" name="email2" id="email2" style="ime-mode:disable;">
								</div>
							</td>
						</tr>
						<tr class="issuMth_02">
							<th scope="row">우편번호<span class="required" aria-label="필수">*</span></th>
							<td>
								<div class="post-code">
									<input type="text" class="form-w02" name="zip" id="zip" readonly title="우편번호">
									<button type="button" class="btn-base-imp small" id="searchZipCode">우편번호 검색</button>
								</div>
							</td>
						</tr>
						<tr class="issuMth_02">
							<th scope="row">
								<label for="adres1">
								주소<span class="required" aria-label="필수">*</span>
								</label>
							</th>
							<td>
								<input type="text" class="form-w01" readonly title="주소" name="adres1" id="adres1">
							</td>
						</tr>
						<tr class="issuMth_02">
							<th scope="row">
								<label for="adres2">상세주소<span class="required" aria-label="필수">*</span></label>
							</th>
							<td>
								<input type="text" class="form-w01" title="상세주소" name="adres2" id="adres2">
							</td>
						</tr>
						<tr class="issuMth_03">
							<th scope="row">
								<label for="fax1">팩스 번호<span class="required" aria-label="필수">*</span></label>
							</th>
							<td>
								<div class="phone-area">
									<input type="text" class="inp-base" title="팩스 앞자리" name="fax1" id="fax1" value="" numberOnly maxlength="3">
									<span class="txt-mark">-</span>
									<input type="text" class="inp-base" title="팩스 중간자리" name="fax2" id="fax2" value="" numberOnly maxlength="4">
									<span class="txt-mark">-</span>
									<input type="text" class="inp-base" title="팩스 뒷자리" name="fax3" id="fax3" value="" numberOnly maxlength="4">
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 동의 -->
				<div class="terms-group">
					<span class="checkbox">
						<input type="checkbox" name="agreeInfo" id="agreeInfo">
						<label for="agreeInfo"><span>개인정보 수집 및 이용에 동의 합니다.</span></label>
					</span>
					<textarea class="inp-base" title="개인정보 수집 및 이용에 동의에 관한 정보입니다.">사회복지공동모금회(이하 “모금회”라 함)는 「개인정보 보호법」제15조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며, 고지 후 수집된 정보는 모금회의 개인정보 수집 및
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
					<textarea class="inp-base" title="개인정보 제 3자 제공에 동의에 관한 정보입니다.">본인은 모금회가 「개인정보 보호법」제17조제1항제1호에 의거, 다음과 같이 본인의 개인정보를 제3자에게 제공하는 것에 대하여 동의합니다.
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
			<div class="btn-area">
	           <button type="button" class="btn-base-imp" id="btnRciptInsert">신청하기</button>
	        </div>
	        </form>
		</section>
		
	</div>
	
	</div>
	</div>
	</div>
</main>

<script>
function radioEvent( name ) {
	var value = $(':radio[name="' + name + '"]:checked').val();
	if( name == "issuMth" ) {
		for( var i=1; i<=3; i++) {
			if( i!=2) {
				$(".issuMth_0" + i).hide();
				$(".issuMth_0" + i).find('input').val('');
			}
		}
		
		$(".issuMth_02").show();
		$(".issuMth_" + value).show();
	}
	if( name == "singleAndBiz" ) {
		if( value == "jumin" ) {
			$(".juminLayout").show();
			$(".bizLayout").hide();
			$(".bizLayout").find('input').val('');
		} else {
			$(".juminLayout").hide();
			$(".bizLayout").show();			
			$(".juminLayout").find('input').val('');
		}
	}
}

function makeFormData() {
	var issuMth= $(':radio[name="issuMth"]:checked').val();
	var singleAndBiz = $(':radio[name="singleAndBiz"]:checked').val();
	var mbtlnum = $("#phone4").val() + "-" +  $("#phone5").val() + "-" + $("#phone6").val();
	var adres = $("#adres1").val() + " " + $("#adres2").val();
	var email = $("#email1").val() + "@" + $("#email2").val();
	var faxno = $("#fax1").val() + "" + $("#fax2").val() + "" + $("#fax3").val();
	var ihidnumBizno = "";
	if( singleAndBiz == "jumin" )
		ihidnumBizno = $("#jumin1").val() + "" + $("#jumin2").val();
	else 
		ihidnumBizno = $("#biz1").val() + "-" + $("#biz2").val() + "-" + $("#biz3").val();
	
	$("#frm1 > #mbtlnum").val(mbtlnum);
	$("#frm1 > #cntrBgn").val( $("#yys option:checked").val() + "" + $("#mms option:checked").val() );
	$("#frm1 > #cntrEnd").val( $("#yye option:checked").val() + "" + $("#mme option:checked").val() );
	
	$("#frm1 > #ihidnumBizno").val( ihidnumBizno );
	$("#frm1 > #adres").val( adres );
	if( issuMth == "01" ) $("#frm1 > #email").val( email ); 
	if( issuMth == "03" ) $("#frm1 > #faxNo").val( faxno );
}


function setTestData() {
	$("#singleNm").val("이상아");
	$("#phone1").val("010");
	$("#phone2").val("9525");
	$("#phone3").val("5015");
	
	$("#nm1").val("이상아");
	$("#phone4").val("010");
	$("#phone5").val("9525");
	$("#phone6").val("5015");
	
	$("#result").val("Y");
	$("#yy").val("1980");
	$("#mm").val("11");
	$("#dd").val("05");
	
	var param = {
			"sName":"이상아"
				, "sMobileNo":"01095255015"
				, "sBirthDate":"19801105"
				, "result":"Y"
			}
			setTimeout( function() {
				success( param );
			},1000);
}
</script>