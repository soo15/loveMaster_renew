<!--
 ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 기부 > 기부참여방법 > 착한가게
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

    gf_submitMovePage("<c:url value='/ct/fdrmcntr/initNicestore.do' />", "" );

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
        location.href = url + "/initNicestore.do";

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
    <input type="hidden" name="cn" id=""  value="기부_기부참여방법_착한가게_상담신청" />
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
            <h3><strong>착한가게</strong><span>사랑을 나누는 가게 착한가게입니다. 여러분의 많은 참여를 바랍니다.</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="area-type-a type2">
                <img src="/common/img/contents/donation-logo11.png" alt="착한가게" >
                <p class="area-type-tit color-type1 mgt-xxl mgb-n">행복이 착착착! 우리 이웃의 가게에 행복이 밀려옵니다!<br>착한가게에 참여하세요! 나눔의 참 행복을 느끼세요!</p>
                <p>착한가게는 매월 최소 3만원 이상, 매출의 일정액을 정기적으로 어려운 이웃들에게 나누는 가게로서,<br>여러 가게가 모여 착한거리, 착한프랜차이즈와 같은 다양한 형태로도 나눔에 동참하며 개인 기부 문화가 확산되는 데 앞장서고 있습니다.</p>
            </div>

            <div class="donation-section">
                <h4 class="table-tit">가입혜택</h4>
                <div class="donation-article join-benefit-box">
                    <div class="benefit-img-box">
                        <img src="/common/img/contents/donation-benefit-img.png" alt="착한가게" >
                        <div class="btn-area">
                            <button type="button" class="btn-base-bline small">현판 크게보기</button>
                        </div>
                    </div>
                    <div class="benefit-desc-box">
                        <p class="benefit-desc-title">"착한가게 행복이 착!착!착! 여러분의 가게에 행복을 드리겠습니다.<br>착한가게에 참여해주시면 착한가게 현판을 보내드립니다."</p>
                        <dl class="benefit-desc-list">
                            <dt>가게 비치용 착한가게 인증 현판 발송</dt>
                            <dd>- 기부금 영수증 발행 및 세제혜택 : 소득세법에 의거 법정 기부금으로 인정되어 소득금액의 100% 한도 내 세액공제 또는 필요경비 인정</dd>
                            <dd>- 다양한 매체를 통한 가게 홍보 진행</dd>
                            <dd>- 홍보 및 마케팅 이벤트 수시 진행 : 카드사 협약 등 착한가게를 알리는 마케팅 진행</dd>
                        </dl>
                    </div>
                </div>
                <div class="btn-area">
                    <button type="button" class="btn-base-line" id="btnRegist">신청하기</button>
                </div>

                <h4 class="table-tit">착한가게 사례</h4>
                <div class="donation-article">
                    <div class="gallery-list">
                        <ul>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex11_01.png" alt="" ></div>
                                    <p class="gallery-tit"><b>착한가게_<br>본도시락 현판식</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex11_02.png" alt="" ></div>
                                    <p class="gallery-tit"><b>착한가게_<br>이연복쉐프의 목란</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex11_03.png" alt="" ></div>
                                    <p class="gallery-tit"><b>착한가게_<br>충북 1000호_청주푸른병원</b></p>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="gallery-link">
                                    <div class="gallery-img"><img src="/common/img/contents/donation-ex/donation-ex11_04.jpg" alt="" ></div>
                                    <p class="gallery-tit"><b>착한거리_<br>대구 복현오거리 먹자골목</b></p>
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
                                <p><i class="sprite-group-mail"></i><a href="mailto:chkim@chest.or.kr" target="_blank" class="link-mail">chkim@chest.or.kr</a></p>
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
                                <p><i class="sprite-group-tel"></i>053-667-1006</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:hsj9585@chest.or.kr" target="_blank" class="link-mail">hsj9585@chest.or.kr</a></p>
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
                                <p><i class="sprite-group-tel"></i>032-456-3320</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:kadde@chest.or.kr" target="_blank" class="link-mail">kadde@chest.or.kr</a></p>
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
                                <p><i class="sprite-group-tel"></i>064-759-9021</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:kdh@chest.or.kr" target="_blank" class="link-mail">kdh@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">경기 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>031-220-7932</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:weesk02@chest.or.kr" target="_blank" class="link-mail">weesk02@chest.or.kr</a></p>
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


