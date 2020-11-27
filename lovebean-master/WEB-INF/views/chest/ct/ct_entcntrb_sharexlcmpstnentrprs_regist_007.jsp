<!--
 ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴]  기부 > 기업사회공헌 > 나눔명문기업
 * Author      :
 * Description :
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<%@ include file="../../common/checkPlus/checkplus_main.jsp"%>
<script type="text/javascript">

var url = "/ct/entcntrb";
var param={};
var _compayCheckFlag = false;

$(document).ready(function(){
    keyEvent();  // 숫자만 입력가능
    makeSelectBox();
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
$(document).on("click", "#btnCompanyInsert, #companyCheckPlus", function(e){

    e.preventDefault();
    var id = $(this).attr("id");


    //본인인증
    if( id == "companyCheckPlus") {
        _compayCheckFlag = true;
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
});

/*===========================================================
 * 상담신청 완료 후 Function !!
 *===========================================================*/
function insertCompanyAfter( data ) {
    if( data.result > 0 ) {
        alert("상담신청이 완료 되었습니다");
        location.href = url + "/initSharexlcmpstnentrprs.do";

        return false;
    }
}

function keyEvent() {
  //숫자만 입력가능
  $("input:text[numberOnly]").on("keyup keydown", function() {
     $(this).val($(this).val().replace(/[^0-9]/g,""));
  });

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
     if( _compayCheckFlag ) {
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
    <input type="hidden" name="cn" id=""  value="기부_기업사회공헌_나눔명문기업_상담신청" />
</form>


<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">기업사회공헌</h2>
        <p class="title-sub-txt">사랑을 나누는 다양한 방법을 소개합니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>나눔명문기업</strong><span>대한민국의 나눔문화를 이끌고, 기업사회공헌의 바람직한 롤모델을 제시하는 대한민국 대표 고액 기업 기부자 모임</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="area-type-a">
                <img src="/common/img/contents/cpl_logo.png" alt="나눔명문기업" >
                <p class="area-type-tit area-type-tit2">대한민국의 나눔을 이끄는, 나눔명문기업</p>
                <p>나눔명문기업은 1억 원 이상을 기부하였거나 3년 이내 기부를 약정한 고액 기업 기부 프로그램입니다.</p>
                <p>사회문제에 대한 관심을 바탕으로 지속가능한 경영을 통해 사회적 책임을 다하며,<br>사회를 이루는 구성원으로서 사회가치 창출과 공익에 기여함으로더 나은 세상을 만들고자 하는 기업들이 참여합니다.</p>
                <p>대한민국의 나눔문화를 이끌고, 기업사회공헌의 바람직한 롤 모델을 제시하는 대한민국 대표 고액 기업 기부자 모임입니다.</p>
            </div>

            <div class="donation-section">
                <h4 class="table-tit">회원설명</h4>
                <ul class="donation-desc">
                    <li>정회원 : 누적기부금(현물 제외)이 1억 원 이상인 법인 기부자<span>(누적기부금에 따라 그린, 실버, 골드회원으로 구분)</span></li>
                    <li>약정회원 : 1억 원 이상의 기부금을 3년 이내에 납부하기로 약정하고 가입 시에 2천만 원 이상의 기부금을 일시납부한 법인기부자</li>
                </ul>
                <div class="tb-type_b not-head">
                    <table summary="회원설명">
                        <caption>회원설명 입니다.</caption>
                        <colgroup>
                            <col class="col-w01 only-pc">
                            <col class="col-w03">
                            <col class="col-auto">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col" class="only-pc">구분</th>
                            <th scope="col">약정회원</th>
                            <th scope="col">정회원</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="only-pc"><strong>기준금액</strong></td>
                            <td class="th-member1">1억 원<br>(가입시: 2천만 원)</td>
                            <td class="th-member2">
                                <ul class="donation-member-list">
                                    <li class="green">1억 원 이상<br>(그린)</li>
                                    <li class="silver">3억 원 이상<br>(실버)</li>
                                    <li class="gold">5억 원 이상<br>(골드)</li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>


                <h4 class="table-tit">예우방법</h4>
                <div class="donation-article type2">
                    <ul class="donation-desc type2">
                        <li>
                            <p>회원 가입식 및 기부금 전달식 진행</p>
                            <p>맞춤형 사회공헌사업 진행 및 결과보고</p>
                        </li>
                        <li>
                            <p>현판 및 인증패 전달</p>
                            <p>정부 유공자 훈/포장 및 대내외 사회봉사상 추천</p>
                        </li>
                        <li>
                            <p>사랑의열매 홈페이지 참여기업 명단 게재</p>
                            <p>회보, 연간보고서 등 주요 간행물 등재</p>
                        </li>
                        <li>
                            <p>참여기업 네트워크 모임 참석</p>
                            <p>기타 회원의 명예를 높이기 위한 홍보활동 등</p>
                        </li>
                    </ul>
                    <div class="btn-area donation-btn-type2">
                        <button type="button" class="btn-base-imp counsel-open" id="btnCounsel">기부상담하기</button>
                        <button type="button" class="btn-base-line">나눔명문기업 자세히 보기</button>
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
        </div>
    </div>
</main>

