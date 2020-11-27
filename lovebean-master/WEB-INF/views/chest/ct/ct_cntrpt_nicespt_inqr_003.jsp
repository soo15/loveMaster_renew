<!--
 ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 기부 > 기부참여방법 > 착한일터
 * Author      :
 * Description :
 *************************************************************************************************
-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>
<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>
<script type="text/javascript">

var url = "/ct/cntrpt";
var param={};
var _compayCheckFlag = false;

$(document).ready(function(){
    keyEvent();  // 숫자만 입력가능
    makeSelectBox();
// 	setTestData();
});
/*===========================================================
 * 신청하기 버튼 클릭시 Function !!
 *===========================================================*/
$(document).on("click", "#btnRegist", function(e){
    gf_submitMovePage("<c:url value='/ct/fdrmcntr/initNicespt.do' />", "" );

});

/*===========================================================
 * 기부상담하기 버튼 클릭시 Function !!
 *===========================================================*/
$(document).on("click", "#btnCounsel", function(e){
    e.preventDefault();
    var id = $(this).attr("id");
    if( id == "btnCounsel" ) $("#counselBox").toggle();
});
/*===========================================================
 * 상담신청버튼(btnCompanyInsert),  인증버튼(companyCheckPlus) 버튼 클릭시 Function !!
 *===========================================================*/
$(document).on("click", "#btnCompanyInsert, #companyCheckPlus, #checkPlus , #btnReceiptApply, #btnGwc , #btnReceipt", function(e){
    e.preventDefault();
    var id = $(this).attr("id");
    //본인인증
    if( id == "companyCheckPlus") {
        _compayCheckFlag = true;
        window.name='mainPopup';
        fnPopup();
    }
    if( id == "checkPlus") {
    	window.name='mainPopup';
        fnPopup();
    }
    //상담신청
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
            gf_sendForm("companyFrm" , url + "/insertCompany.do" );
        }
    }
    if( id=="btnReceipt" ) {
    	$("#gwcLayout").toggle();
    }

    if( id == "btnGwc" ) {
    	if( $.trim( $("#goodStorSn option:checked").val() ).length == 0 ) {
    		alert("참여기업명을 선택해주세요");
    		return false;
    	}
    	if( $.trim( $("#crtfcCode").val() ).length == 0 ) {
    		alert("인증코드를 입력해주세요");
    		return false;
    	}
    	if( confirm("인증 하시겠습니까?") ) {
    		var param = {
   				"goodStorSn": $('select[name="goodStorSn"]').val()
   				,"crtfcCode": $("#crtfcCode").val()
    		}
    		gf_send( url + "/goodStorCheck.do", param );
    	}
    }

    //임직원 영수증 신청
    if( id == "btnReceiptApply" ) {
    	if( !validator() ) return;
        if( confirm("신청 하시겠습니까?") ) {
            var telno = $("#phone1").val() + "" +  $("#phone2").val() + "" +  $("#phone3").val();
            var rciptReqstAt= $(':radio[name="rciptReqstAt"]:checked').val();
            var ihidnumBizno = 	$("#jumin1").val() + "-" + $("#jumin2").val();
//             console.log( "rciptReqstAt ===" + rciptReqstAt );
            $("#hidmbtlnum").val( telno );
            $("#hidrciptReqstAT").val( rciptReqstAt );
            if( rciptReqstAt == "Y" ) {
            	$("#hidihidnumBizno").val( ihidnumBizno );
        	}
            $("#hidempNm").val( $("#empNm").val() );
            $("#hidgoodStorSn").val( $('select[name="goodStorSn"]').val()  );
            $("#hidyy").val( $("#yy").val() );
            gf_sendForm("frm " , url + "/insert.do" );
        }
    }
});

function goodStorCheckAfter(data) {
	var result = data.detail;
	if( result == "success" ) {
		alert("인증 되었습니다");
		$("#applyLayout").show();
		return false;
	} else {
		alert("인증에 실패하였습니다");
		$("#applyLayout").hide();
		return false;
	}
}

function insertAfter( data ) {
	alert(data.result);
	location.href = url + "/initNicespt.do";
	return false;
}

/*===========================================================
 * 상담신청 완료 후 Function !!
 *===========================================================*/
function insertCompanyAfter( data ) {
    if( data.result > 0 ) {
        alert("상담신청이 완료 되었습니다");
        location.href = url + "/initNicespt.do";
        return false;
    }
}

function keyEvent() {
  //숫자만 입력가능
  $("input:text[numberOnly]").on("keyup keydown", function() {
     $(this).val($(this).val().replace(/[^0-9]/g,""));
  });

}

function validator() {
    var rciptReqstAt= $(':radio[name="rciptReqstAt"]:checked').val();		//영수증 신청 여부
	if( $("#result").val()  == "N" ) {
	    alert("본인인증을 해주세요");
	    return false;
	}
	if( $.trim( $("#empNm").val() ).length == 0 ) {
    	alert("이름을 입력해주세요");
       	$("#empNm").focus();
       	return false;
   	}
   	if( rciptReqstAt == "Y" ) {
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
	}

   	if( !$("#agreeInfo").is(':checked') ) {
       	alert("개인정보 수집 및 이용에 동의해주세요");
       	$("#agreeInfo").focus();
       	return false;
   	}
   	if( !$("#agreeInfo1").is(':checked') ) {
		alert("개인정보 개인정보 수집·이용에 동의해 주세요");
       	$("#agreeInfo1").focus();
       	return false;
   	}
    return true;
}

/*===========================================================
 * 상담신청시 조건 체크  Function !!
 *===========================================================*/
function companyValidator() {

    var chk = $("input:checkbox[name='agreeInfoCompany']").is(":checked");
        if( $.trim( $("#bhfCode option:checked").val() ).length == 0 ) {
            alert("상담지역을 선택해주세요");
            $("#bhfCode").focus();
            return false;
        }
        if( $.trim( $("#companyNm").val() ).length == 0 ) {
            alert("성명을 입력해주세요");
            $("#companyNm").focus();
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

function makeSelectBox() {
    // 상담지역 Combo 조회
    gf_send( url + "/selectSelList.do", param);

}

/*===========================================================
 * 상담지역 코드 조회
 *===========================================================*/

function selectSelListAfter(data) {
    var el = '';

    $(data.codeList.listInfo).each(function( i,item ) {
        el += "<option value='"+item.bhfCode+"'>" + item.bhfCodeNm + "</option>";
      });
    $("#bhfCode").html(el);

    el='';
    $(data.companyList.listInfo).each(function( i,item ) {
        el += "<option value='"+item.goodStorSn+"'>" + item.goodStorNm + "</option>";
    });
    $("#goodStorSn").html(el);

    el='';
    var date = new Date();
    var yy = date.getFullYear();
    for( var i=(yy-1); i<=yy; i++ ) {
    	el += '<option value="'+i+'" selected>' + i +'</option>';
    }
    $("#yy").html(el);
//     console.log( $("#yy").val() );
    if (!$plugins.browser.mobile) $plugins.uiSelect();
}

/*===========================================================
 * 인증 성공 할 경우
 *===========================================================*/

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
    	$("#phone1").val(a);
    	$("#phone2").val(b);
    	$("#phone3").val(c);
    	$("#result").val(result);
    	$("#empNm").val(sname);
	} else {
		$("#companyPhone1").val(a);
    	$("#companyPhone2").val(b);
    	$("#companyPhone3").val(c);
    	$("#companyResult").val(result);
	}
    _compayCheckFlag = false;
}
/*===========================================================
 * 인증 실패
 *===========================================================*/
function fail() {
    _compayCheckFlag = false;
    alert("본인인증이 실패하였습니다.");
}


</script>


<form name="form_chk" method="post">
    <input type="hidden" name="m" value="checkplusSerivce">                     <!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <input type="hidden" name="EncodeData" value="<%= sEncData %>">             <!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
    <input type="hidden" name="result" id="result" value="N" />
    <input type="hidden" name="companyResult" id="companyResult" value="N" />
</form>

<!-- 상담신청 폼 -->
<form id="companyFrm" name="companyFrm" method="post" >
    <input type="hidden" name="bhfCode" id="hidBhfCode" />
    <input type="hidden" name="nm" id="hidComNm" />
    <input type="hidden" name="telno" id="hidTelno" />
    <input type="hidden" name="agreAt" id="hidAgreAt" />
    <input type="hidden" name="reqstManageTy" id=""  value="${reqstManageTy}"/> <!-- HP0025 -->
    <input type="hidden" name="progrsSttus" id=""  value="01"/>
    <input type="hidden" name="reqstCn" id="reqstCn" />
    <input type="hidden" name="cn" id=""  value="기부_기부참여방법_착한일터_상담신청" />
</form>

<form id="frm" name="frm" method="post" >
	<input type="hidden" name="mbtlnum" 	id="hidmbtlnum" />
	<input type="hidden" name="rciptReqstAT" id="hidrciptReqstAT" value="N"/>
	<input type="hidden" name="ihidnumBizno" id="hidihidnumBizno" />
	<input type="hidden" name="goodStorSn" 	id="hidgoodStorSn" />
	<input type="hidden" name="empNm" 	id="hidempNm" />
	<input type="hidden" name="yy" 		id="hidyy" />
	<input type="hidden" name="outParam" id="outParam" value="0" />
</form>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">기부참여방법</h2>
        <p class="title-sub-txt">사랑을 나누는 다양한 방법을 소개합니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>착한일터</strong><span>사랑을 나누는 회사 착한일터입니다. 여러분의 많은 참여를 바랍니다.</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="area-type-a type2">
                <img src="/common/img/contents/donation-logo12.png" alt="착한일터" >
                <p class="area-type-tit color-type1 mgt-xxl mgb-n">착한일터는 매달 급여에서 약정한 기부금이 자동으로 이체되는 정기적인 기부참여 방법입니다.</p>
                <p>직장 내 전 직원의 참여부터 소모임별 참여까지다양한 형태로 나눔을 실천할 수 있습니다.</p>
            </div>

            <div class="donation-section">
                <h4 class="table-tit">가입혜택</h4>
                <div class="donation-article">
                    <ul class="donation-desc">
                        <li>따뜻한 나눔을 실천하는 착한 일터 현판 부착 및 가입식 진행</li>
                        <li>사회복지공동모금회 정기 간행물, SNS 등을 통한 지속적인 기업 홍보</li>
                        <li>우수 참여기업에 대한 나눔 유공자 포상 대상자 추천 및 선정</li>
                        <li>기부금 영수증 발행 및 세제혜택 : 소득세법에 의거 법정 기부금으로 인정되어 소득금액의 100% 한도 내 세액공제</li>
                    </ul>
                </div>

                <h4 class="table-tit">기부 신청하기</h4>
                <div class="donation-article">
                    <p class="donation-desc">단체 가입 : 참여방법 상담 → 직원과 의사공유 → 기부신청서 작성 및 전달식 진행 → 기부 → 기부금 집행 → 쓰임새 보고</p>
                </div>
                <div class="btn-area">
                    <button type="button" class="btn-base-line" id="btnRegist">신청하기</button>
                    <button type="button" class="btn-base-line" id="btnReceipt">착한일터 임직원 영수증신청</button>
                </div>

                <div>&nbsp;</div>
                <div>&nbsp;</div>

                <div id="gwcLayout" style="display:none;">
	                <div class="tb-type_a">
	                	<table summary="참여기업명 정보를 입력">
	                		<caption>참여기업명 정보를 입력폼입니다.</caption>
							<colgroup>
								<col class="col-xs">
								<col class="col-auto">
							</colgroup>
							<tbody>
							<tr>
								<th scope="row">
									<label for="">참여기업명</label>
								</th>
								<td class="hope-area">
									<div class="ui-select form-w01">
										<select class="sel_type" id="goodStorSn" name="goodStorSn" title="참여기업명 선택"></select>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="">인증코드</label>
								</th>
								<td>
									<input type="text" class="inp-base" name="crtfcCode" id="crtfcCode" title="인증코드">
									<button type="button" class="btn-base-imp small" id="btnGwc">착한일터 인증</button>
								</td>
							</tr>
							</tbody>
						</table>
	                </div>
                </div>

                <div>&nbsp;</div>

                <div id="applyLayout" style="display:none;">

                <div class="tb-type_a">
					<table summary="휴대폰 인증 입력">
						<caption>휴대폰 인증 입력폼입니다.</caption>
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
								<p class="donation-guide-txt">
									- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
									- 기부자 본인을 확인하기 위해서 기부자님의 본인인증이 반드시 필요합니다.<br>
									- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.
								</p>
							</td>
						</tr>

						<tr>
							<th scope="row">
								<label for="empNm">이름<span class="required" aria-label="필수">*</span></label>
							</th>
							<td><input type="text" class="form-w01" name="empNm" id="empNm" title="기부자 이름" readonly="readonly"></td>
						</tr>

						<tr>
							<th scope="row">
								<label for="yy">신청연도<span class="required" aria-label="필수">*</span></label>
							</th>
							<td>
								<div class="day-form">
									<div class="day-form-row">
										 <div class="ui-select sel_small">
											<select class="sel_type" id="yy" name="yy" title="년 선택"></select>
										</div>
										<span class="day-txt">년</span>
									</div>
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
						<tr>
							<th scope="row">
								<label for="jumin1">영수증 신청  <br>주민등록번호<span class="required" aria-label="필수">*</span></label>
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
						</tbody>
					</table>
				</div>

				<!-- 동의 -->
				<div class="terms-group">
						<span class="checkbox">
							<input type="checkbox" name="agreeInfo" id="agreeInfo">
							<label for="agreeInfo"><span>개인정보 수집 및 이용에 동의 합니다.</span></label>
						</span>
						<textarea id="agreeInfo" class="inp-base" title="개인정보 수집 및 이용에 동의에 관한 정보입니다.">사회복지공동모금회(이하 “모금회”라 함)는 「개인정보 보호법」제15조에 의거하여 개인정보수집 및 이용에 관한 정보주체의 동의절차를 준수하며, 고지 후 수집된 정보는 모금회의 개인정보 수집 및
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
												<textarea id="agreeInfo1" class="inp-base" title="개인정보 제 3자 제공에 동의에 관한 정보입니다.">본인은 모금회가 「개인정보 보호법」제17조제1항제1호에 의거, 다음과 같이 본인의 개인정보를 제3자에게 제공하는 것에 대하여 동의합니다.
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
                	<button type="button" class="btn-base-line" id="btnReceiptApply">개인정보제공동의 및 영수증 신청</button>
                </div>

				</div>
				<!--  착한일터 임직원 영수증신청 END -->


                <h4 class="table-tit">착한일터 사례</h4>
                <div class="donation-article">
                    <div class="gallery-list">
                        <ul>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex12_01.png" alt="" ></div>
                                    <p class="gallery-tit"><b>착한일터_<br>동두천 보산어린이집</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex12_02.png" alt="" ></div>
                                    <p class="gallery-tit"><b>착한일터_<br>동두천시청 가입식</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex12_03.png" alt="" ></div>
                                    <p class="gallery-tit"><b>착한일터_<br>인제대학교 해운대백병원</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex12_04.png" alt="" ></div>
                                    <p class="gallery-tit"><b>착한일터_<br>인천 부평구 시설관리공단 협약식</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex12_05.png" alt="" ></div>
                                    <p class="gallery-tit"><b>착한일터_<br>한국수력원자력 (주)한빛원자력본부</b></p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="donation-tit-area">
                    <h4 class="table-tit">지회별 담당자</h4>
<!--                     <div class="ui-select"> -->
<!--                         <select class="sel_type"> -->
<!--                             <option selected="selected">서울 사랑의열매</option> -->
<!--                             <option>중앙회</option> -->
<!--                             <option>강원 사랑의열매</option> -->
<!--                             <option>충북 사랑의열매</option> -->
<!--                             <option>부산 사랑의열매</option> -->
<!--                             <option>충남 사랑의열매</option> -->
<!--                         </select> -->
<!--                     </div> -->
                </div>
                <div class="donation-article type3">
                    <div class="fake-table-box">
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">중앙회</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>02-6262-3079</p>
                                <p><i class="sprite-group-tel"></i>02-6262-3157</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:969096@chest.or.kr" target="_blank" class="link-mail">969096@chest.or.kr</a></p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jhk@chest.or.kr" target="_blank" class="link-mail">jhk@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">강원 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-4323-6435</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jojuhye12@chest.or.kr" target="_blank" class="link-mail">jojuhye12@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">서울 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>02-6053-0391</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:lee@chest.or.kr" target="_blank" class="link-mail">lee@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">충북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>043-238-8025</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:ranger6@chest.or.kr" target="_blank" class="link-mail">ranger6@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">부산 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>051-790-1422</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:joday@chest.or.kr" target="_blank" class="link-mail">illina@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">충남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-8897-0510</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jschest@chest.or.kr" target="_blank" class="link-mail">jschest@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">대구 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>053-667-1006</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:hsj9585@chest.or.kr" target="_blank" class="link-mail">hsj9585@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">전북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>063-903-0635</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:sumisumi@chest.or.kr" target="_blank" class="link-mail">sumisumi@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">인천 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>032-456-3312</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:sik8007@chest.or.kr" target="_blank" class="link-mail">sik8007@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">전남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>061-902-6807</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:hsi2012@chest.or.kr" target="_blank" class="link-mail">hsi2012@chest.or.kr</a></p>
                            </dd>
                        </dl>

                        <dl class="fake-table-item">
                            <dt class="fake-table-th">광주 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>062-222-3567</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:kjh3526@chest.or.kr" target="_blank" class="link-mail">kjh3526@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">경북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>053-980-7816</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:mcpred@chest.or.kr" target="_blank" class="link-mail">mcpred@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">대전 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>042-347-5178</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:symental@chest.or.kr" target="_blank" class="link-mail">symental@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">경남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>055-270-6714</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:pkh@chest.or.kr" target="_blank" class="link-mail">pkh@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">울산 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>052-270-9013</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:rmadkrl2013@chest.or.kr" target="_blank" class="link-mail">rmadkrl2013@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">제주 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>064-759-9021</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:kdh@chest.or.kr" target="_blank" class="link-mail">kdh@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">경기 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>031-220-7934</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:yongseungko@chest.or.kr" target="_blank" class="link-mail">yongseungko@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">세종 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-4269-0571</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:lsdbabo12@chest.or.kr" target="_blank" class="link-mail">lsdbabo12@chest.or.kr</a></p>
                            </dd>
                        </dl>
                    </div>
                    <div class="btn-area">
                        <button type="button" class="btn-base-imp counsel-open" id="btnCounsel">기부상담하기</button>
                    </div>
                </div>
            </div>
            <!-- S : 기부상담신청 -->
            <div id="counselBox" class="sb-box dis-none">
                <div class="sb-box-inner">
                    <p class="sb-contents-tit">기부상담신청</p>
                    <p class="sb-contents-desc">기부상담을 위해 상담받으실 분 성함과 연락처를 남겨주시면 빠른시간안에 연락드리도록 하겠습니다.</p>
                    <div class="sb-content">
                        <div class="sb-content-tbl">
                            <table summary="기부상담 입력폼">
                            	<caption>기부상담을 위한 정보 입력폼입니다.</caption>
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
                                        <input type="text" class="inp-base w-full" id="companyNm" title="성명">
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
                                        <p class="table-cell">
                        	- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
                        	- 본인인증시 반복적으로 오류가 발생하면 NICE기술지원(1600-1522)로 전화부탁드립니다.
                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="reqstCnView">상담신청내용</label></th>
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
                                        <table summary="개인정보 수집‧이용 동의">
                                            <caption>개인정보 수집‧이용 동의에 관한 정보입니다.</caption>
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
        </div>
    </div>
</main>
<script>

function radioEvent( name ){
	var value = $(':radio[name="' + name + '"]:checked').val();
	if( name == "rciptReqstAt" ) {
		if( value == "Y" ){
			$("#jumin1").removeAttr("readonly");
			$("#jumin2").removeAttr("readonly");
		} else {
			$("#jumin1").attr("readonly", true);
			$("#jumin2").attr("readonly", true);
			$("#jumin1 , #jumin2").val("");
		}
	}
}

function setTestData() {
	$("#empNm").val("김민수");
	$("#result").val("Y");
	$("#jumin1").attr("790701");
	$("#jumin2").attr("1831212");
	$("#phone1").val("010");
	$("#phone2").val("2020");
	$("#phone3").val("4048");
// 	$("#applyLayout").show();

}

</script>
