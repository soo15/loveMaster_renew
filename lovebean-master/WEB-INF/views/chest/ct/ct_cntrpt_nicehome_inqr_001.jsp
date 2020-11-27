<!--
 ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 기부 > 기부참여방법 > 착한가정
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

});

/*===========================================================
 * 신청하기 버튼 클릭시 Function !!
 *===========================================================*/
$(document).on("click", "#btnRegist", function(e){

    gf_submitMovePage("<c:url value='/ct/fdrmcntr/initNicehome.do' />", "" );

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
        location.href = url + "/initNicehome.do";

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
    <input type="hidden" name="cn" id=""  value="기부_기부참여방법_착한가정_상담신청" />
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
            <h3><strong>착한가정</strong><span>사랑을 나누는 가정 착한가정입니다. 여러분의 많은 참여를 바랍니다.</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="area-type-a type2">
                <img src="/common/img/contents/donation-logo10.png" alt="착한가정" >
                <p class="area-type-tit color-type1 mgt-xxl mgb-n">“함께 나누니 더 행복해요”</p>
                <p>착한가정은 가족 구성원의 이름으로 매월 2만원 이상을 어려운 이웃들에게 나누는 가정으로서,<br>가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>

                <div class="video-area donation-video-area">
                    <div class="video-box"><iframe src="https://www.youtube.com/embed/YA07EAkfCPc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen title="동영상"></iframe></div>
                </div>
            </div>

            <div class="donation-section">
                <h4 class="table-tit">가입혜택</h4>
                <div class="donation-article">
                    <ol class="join-benefit-list">
                        <li>
                            <p class="text-benefit-group">
                                <span class="list-benefit-num">혜택하나.</span>
                                <span class="text-benefit"><strong>가훈이 새겨진 인증패 발송</strong> : 가정 비치용 착한가정 인증 현판 발송</span>
                            </p>
                            <div class="join-benefit-plate">
                                <img src="/common/img/contents/donation-plate01.png" alt="아크릴현판 썸네일이미지" >
                                <img src="/common/img/contents/donation-plate02.png" alt="아크릴현판 썸네일이미지" >
                            </div>
                        </li>
                        <li>
                            <p class="text-benefit-group">
                                <span class="list-benefit-num">혜택둘.</span>
                                <span class="text-benefit"><strong>기부금 영수증 발행 및 세제혜택</strong> : 소득세법에 의거 법정 기부금으로 인정되어 소득금액의 100% 한도 내 세액공제</span>
                            </p>
                            <a href="" class="btn-base-bline small">기부금 세금공제 안내 자세히 보기</a>
                        </li>
                    </ol>
                </div>
                <div class="btn-area">
                    <button type="button" class="btn-base-line" id="btnRegist">신청하기</button>
                </div>

                <h4 class="table-tit">착한가정 사례</h4>
                <div class="donation-article">
                    <div class="gallery-list">
                        <ul>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex10_01.png" alt="착한가정_박수홍 지인숙 여사" ></div>
                                    <p class="gallery-tit"><b>착한가정_<br>박수홍 지인숙 여사</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex10_02.JPG" alt="착한가정_조빈 반려견 다온이" ></div>
                                    <p class="gallery-tit"><b>착한가정_<br>조빈 반려견 다온이</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex10_03.png" alt="착한가정_충북 100호 착한가정 재윤이네" ></div>
                                    <p class="gallery-tit"><b>착한가정_<br>충북 100호 착한가정 재윤이네</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex10_04.png" alt="착한가정_현영" ></div>
                                    <p class="gallery-tit"><b>착한가정_<br>현영</b></p>
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
                                <p><i class="sprite-group-tel"></i>02-6262-3083</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:ydh144@chest.or.kr" target="_blank" class="link-mail">ydh144@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">강원 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>033-244-1662</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jinsol93@chest.or.kr" target="_blank" class="link-mail">jinsol93@chest.or.kr</a></p>
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
                                <p><i class="sprite-group-tel"></i>043-238-8027</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:song4063@chest.or.kr" target="_blank" class="link-mail">song4063@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">부산 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>051-790-1430</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:sooj632@chest.or.kr" target="_blank" class="link-mail">sooj632@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">충남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-4172-7073</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jnjn@chest.or.kr" target="_blank" class="link-mail">jnjn@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">대구 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>053-667-1052</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:hyein.lee@chest.or.kr" target="_blank" class="link-mail">hyein.lee@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">전북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>063-903-0638</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jsy0606@chest.or.kr" target="_blank" class="link-mail">jsy0606@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">인천 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>032-456-3313</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:skekt101@chest.or.kr" target="_blank" class="link-mail">skekt101@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">전남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>061-902-6808</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:pyj@chest.or.kr" target="_blank" class="link-mail">pyj@chest.or.kr</a></p>
                            </dd>
                        </dl>

                        <dl class="fake-table-item">
                            <dt class="fake-table-th">광주 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>062-222-3567</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:onlysun@chest.or.kr" target="_blank" class="link-mail">onlysun@chest.or.kr</a></p>
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
                                <p><i class="sprite-group-tel"></i>042-347-5176</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:sun0518@chest.or.kr" target="_blank" class="link-mail">sun0518@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">경남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>055-270-6712</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:sin6107@chest.or.kr" target="_blank" class="link-mail">sin6107@chest.or.kr</a></p>
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
                                <p><i class="sprite-group-tel"></i>064-759-9024</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:eun@chest.or.kr" target="_blank" class="link-mail">eun@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">경기 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>031-220-7933</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:me0321@chest.or.kr" target="_blank" class="link-mail">me0321@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">세종 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-4269-0572</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:auddms0317@chest.or.kr" target="_blank" class="link-mail">auddms0317@chest.or.kr</a></p>
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
                            <table summary="기부상담 신청 입력폼">
                            	<caption>기부상담 신청 입력폼입니다.</caption>
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

