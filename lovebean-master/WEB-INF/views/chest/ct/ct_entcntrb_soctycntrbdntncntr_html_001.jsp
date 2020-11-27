<!--
 ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴]  기부 > 기업사회공헌 > 사회공헌 성금기부
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
$(document).on("click", "#btnCounsel, #btnCounselTop", function(e){
    e.preventDefault();
    $("#counselBox").toggle();
    var id = $(this).attr("id");
    if( id == "btnCounselTop" ) $(".base-wrap").scrollTop($("#agreeInfoCompany").offset().top+500);
});


/*===========================================================
 * 상담신청버튼(btnCompanyInsert),  인증버튼(companyCheckPlus), 위치안내(btnMap)  버튼 클릭시 Function !!
 *===========================================================*/
$(document).on("click", "#btnCompanyInsert, #companyCheckPlus, #btnMap", function(e){

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
    // 위치안내
    if( id == "btnMap" ) gf_submitMovePage("/lf/intrcn/initBranchintrcn.do?mapYn=Y","");
});

/*===========================================================
 * 상담신청 완료 후 Function !!
 *===========================================================*/
function insertCompanyAfter( data ) {
    if( data.result > 0 ) {
        alert("상담신청이 완료 되었습니다");
        location.href = url + "/initSoctycntrbdntncntr.do";

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
 * 본인 인증 실패
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
    <input type="hidden" name="cn" id=""  value="기부_기업사회공헌_사회공헌성금기부_상담신청" />
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
            <h3><strong>사회공헌 성금기부</strong><span>행복은 사회를 만드는 밑거름 사회공헌활동</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="area-type-a type2">
                <img src="/common/img/contents/donation-logo6.png" alt="" >
                <p class="area-type-tit area-type-tit2">기업의 사회공헌활동은 선택이 아닌 필수입니다.</p>
                <p>기업의 사회적 책임(CSR : Corporate Social Responsibility) 활동 및 사회 공헌활동은 공공정책의 사각지대를 메우기도 하고,<br>사회적 이슈화를 통해 제도화를 이끌어내기도 하는데,<br>이것이 실현될 수 있도록 사랑의 열매는 기업과 최적의 파트너가 되어 최선의 노력을 기울이고 있습니다.
                </p>
            </div>

            <div class="donation-section">
                <div class="enterprise-box">
                    <p class="enterprise-tit"><span><strong>기업사회공헌 참여기업</strong></span></p>
                    <ul class="enterprise-list">
                        <li><img src="/common/img/temp/enterprise01.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise02.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise03.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise04.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise05.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise06.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise07.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise08.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise09.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise10.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise11.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise12.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise13.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise14.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise15.png" alt=""></li>
                        <li><img src="/common/img/temp/enterprise16.png" alt="" ></li>
                    </ul>
                </div>

                <h4 class="table-tit">직접기부 방법</h4>
                <div class="donation-article">
                    <div class="donation-article-inner">
                        <p class="donation-article-img"><img src="/common/img/temp/sample04.png" alt="" ></p>
                        <div class="donation-desc-box">
                            <ul class="donation-desc">
                                <li>사회복지공동모금회에 직접기부 (계좌 입금, 방문기부)
                                    <div class="btn-area-l">
                                        <button type="button" class="btn-base-imp small" id="btnCounselTop">기업 일시기부 상담신청</button>
                                        <button type="button" class="btn-base-bline small" id="btnMap">위치안내 바로가기 </button>
<!--                                         <button type="button" class="btn-base-bline small"><a href="/lf/intrcn/initBranchintrcn.do?mapYn=Y">위치안내 바로가기</a> </button> -->
<!--                                         <a href="/lf/intrcn/initBranchintrcn.do?mapYn=Y" class="btn-base-line small" >위치안내 바로가기</a> -->
                                    </div>
                                </li>
                                <li>방송사 및 신문사 성금접수에 기부</li>
                                <li>
                                    기부 방송 출연 및 참여
                                    <p>*사랑의열매는 방송사들과 함께 연말이웃돕기 생방송을 비롯한 특별방송 등을 통하여 이웃을 위한 기부활동을 펼치고 있습니다.</p>
                                </li>
                                <li>TV 및 라디오 기부채널에 기부</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <h4 class="table-tit">기업의 사회공헌, 지속가능한 성장을 위한 가장 확실한 투자</h4>
                <div class="donation-article">
                    <ul class="progress-area">
                        <li class="progress-item">
                            <div class="progress-img"><img src="/common/img/contents/progressbar-donute01.png" alt="" ></div>
                            <p class="progress-tit">일반인의</p>
                            <p class="progress-tit">사회공헌활동 참여기업에<br>호감을 느낀다</p>
                            <div class="progress-txt">
                                <p>일반인의 92%가 사회공헌활동<br>참여기업에 호감느끼는 것으로</p>
                                <span>- 전국경제인연합회 조사<br>- 기업기부의식 조사</span>
                            </div>
                        </li>

                        <li class="progress-item">
                            <div class="progress-img"><img src="/common/img/contents/progressbar-donute02.png" alt="" ></div>
                            <p class="progress-tit">소비자의</p>
                            <p class="progress-tit">사회적으로 좋은일을 하는<br>브랜드로 바꿀것</p>
                            <div class="progress-txt">
                                <p>가격과 질이 같다면 76%의<br>소비자들은 사회적으로<br>좋은일을 하는 브랜드로 바꿀 것</p>
                                <span>- 미국의 한 컨설팅회사<br>Cone Roper Benchma 가 조사</span>
                            </div>
                        </li>

                        <li class="progress-item">
                            <div class="progress-img"><img src="/common/img/contents/progressbar-donute03.png" alt="" ></div>
                            <p class="progress-tit">사회공헌</p>
                            <p class="progress-tit">기업의 직원이<br>더 소비자를 위해 노력하며<br>이직율은 절반에 불과</p>
                            <div class="progress-txt">
                                <p>사회공헌에 활발한 기업의 직업이 직원이<br>그렇지 않은 기업의 직원보다 50%나 더<br>소비자를 위해 노력하며 사회공헌활동에<br>무관심한 기업의 직원들은 그렇지 않은<br>기업의 직원보다 이직률이 두배</p>
                                <span>- Shareholder Power 조사</span>
                            </div>
                        </li>
                    </ul>
                </div>

                <h4 class="table-tit">기업 사회공헌활동의 믿음직한 파트너, 사랑의열매</h4>
                <div class="donation-article">
                    <div class="donation-article-inner">
                        <p class="donation-article-img"><img src="/common/img/temp/sample05.png" alt="" ></p>
                        <div class="donation-desc-box">
                            <p class="desc-box-txt">이제 기업의 사회공헌활동은 단순한 자선적 기부를 넘어서 전략적인 지역사회투자로 바뀌고 있습니다.<br>사랑의열매는 이 변화의 중심에서 기업사회공헌활동을 더욱 전문적으로 발전시키기 위해서 노력하고 있습니다.</p>
                            <ul class="donation-desc">
                                <li>기업의 이미지와 욕구에 부합하는 사회공헌사업 제안</li>
                                <li>배분사업에 대한 철저하고 투명한 관리</li>
                                <li>기업의 기부로 변화되는 긍정적 성과와 결과 보고</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="btn-area">
                    <button type="button" class="btn-base-imp counsel-open" id="btnCounsel">기부상담하기</button>
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

