<!--
 ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴]  기부 > 기업사회공헌 > 사회공헌 현물기부
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
        location.href = url + "/initSoctycntracthngcntr.do";

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
    <input type="hidden" name="cn" id=""  value="기부_기업사회공헌_사회공헌현물기부_상담신청" />
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
            <h3><strong>사회공헌 현물기부</strong><span>어려운 이웃에게 행복상자를 전하는 따뜻한 기업</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="area-type-a type3">
                <img src="/common/img/contents/donation-logo5.png" alt="" >
                <p class="area-type-tit area-type-tit2"><em class="color-type1">“행복상자” 캠페인</em> - 행복상자로 이웃의 힘이 되어주세요!!</p>
                <p>모두가 어렵다고 하는 요즘...<br>가정에서는 경제적 생활고에 시달리고, 업체들은 창고에 쌓여가는 재고품으로 한숨이 늘어만 갑니다.</p>
                <p>지금 쌓여가는 물품들을 어려운 이웃들에게 행복상자로 선물하지 않으시겠어요?<br>세상을 위한 나눔의 손길로 우리의 겨울은 더욱 따뜻해 질 수 있습니다. 따뜻한 마음을 “행복상자”에 차곡차곡 담아 전하세요!</p>
                <p class="area-type-tit2 type2">기업에는 <em class="color-type1">소득공제 혜택</em>, 우리 이웃들에게는 <em class="color-type1">큰 힘</em>이 됩니다.<strong>세상을 바꾸는 <em class="color-type1">당신의 힘!</em></strong></p>
            </div>

            <div class="donation-section">
                <div class="donation-article type4">
                    <div class="donation-find-area">
                        <ul class="donation-find-list">
                            <li class="n13"><strong>의류기증</strong><span>추운 겨울바람으로부터<br>든든하고 포근하게 지켜주는 힘</span></li>
                            <li class="n14"><strong>도서기증</strong><span>아이들의 마음과 정서를<br>안정시켜주는 힘</span></li>
                            <li class="n15"><strong>난방용품기증</strong><span>어르신들의 추운 몸을<br>따스함으로 덮어주는 힘</span></li>
                            <li class="n16"><strong>생필품기증</strong><span>저소득 가정에 활력을<br>불어넣는 힘</span></li>
                        </ul>
                    </div>

                    <ul class="donation-desc">
                        <li>기간 :  연중</li>
                        <li>참여대상 : 의류, 도서, 난방용품 등 제조업체 및 유통업체(중고물품 기부 불가)</li>
                        <li>참여방법 : 모금사업본부 법인모금팀으로 연락</li>
                    </ul>
                    <div class="dontation-desc-group">
                        <p class="donation-item">
                            <span><i class="sprite-group-tel"></i>02-6262-3154</span>
                            <span>
                                <i class="sprite-group-mail"></i>
                                <a href="mailto:plutus86@chest.or.kr" target="_blank" class="link-mail">plutus86@chest.or.kr</a>
                            </span>
                        </p>
                        <p class="donation-desc-txt">* 나눔에 참여하는 기업은 연말소득공제혜택을 받으실 수 있습니다. (기부물품 기부가액산정기준-장부가액(취득가액))</p>
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
                                <p><i class="sprite-group-tel"></i>02-6262-3154</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:plutus86@chest.or.kr" target="_blank" class="link-mail">plutus86@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">강원 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>033-243-1664</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:skpark2009@chest.or.kr" target="_blank" class="link-mail">skpark2009@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">서울 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>02-6053-0452</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:pupple7979@chest.or.kr" target="_blank" class="link-mail">pupple7979@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">충북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>043-238-8026</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:staryeny@chest.or.kr" target="_blank" class="link-mail">staryeny@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">부산 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>051-790-1404</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:ksm79@chest.or.kr" target="_blank" class="link-mail">ksm79@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">충남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-8898-0511</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:guns@chest.or.kr" target="_blank" class="link-mail">guns@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">대구 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>053-667-1004</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:chanhee33@chest.or.kr" target="_blank" class="link-mail">chanhee33@chest.or.kr</a></p>
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
                                <p><i class="sprite-group-tel"></i>032-456-3313</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:skekt101@chest.or.kr" target="_blank" class="link-mail">skekt101@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">전남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>061-902-6812</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:kbm@chest.or.kr" target="_blank" class="link-mail">kbm@chest.or.kr</a></p>
                            </dd>
                        </dl>

                        <dl class="fake-table-item">
                            <dt class="fake-table-th">광주 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>062-222-3562</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:skw@chest.or.kr" target="_blank" class="link-mail">skw@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">경북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>053-980-7812</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jmas@chest.or.kr" target="_blank" class="link-mail">jmas@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">대전 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>042-347-5715</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:powersw@chest.or.kr" target="_blank" class="link-mail">powersw@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">경남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>055-270-6728</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:cjy@chest.or.kr" target="_blank" class="link-mail">cjy@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">울산 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>052-270-9014</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jessong@chest.or.kr" target="_blank" class="link-mail">jessong@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">제주 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>064-759-9020</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:naouri@chest.or.kr" target="_blank" class="link-mail">naouri@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">경기 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>031-220-7952</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:hory0612@chest.or.kr" target="_blank" class="link-mail">hory0612@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">세종 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-4269-0567</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:cnmik@chest.or.kr" target="_blank" class="link-mail">cnmik@chest.or.kr</a></p>
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


