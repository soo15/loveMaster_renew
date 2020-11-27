<!--
 ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴]  기부 > 기업사회공헌 > 공익연계마케팅
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

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
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
            location.href = url + "/initPblbnfcntcmarkt.do";

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
             if( $.trim( $("#companyNm").val() ).length == 0 ) {soo
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

     /*************************************************************
      * Ajax Send Callback Function !!
      *************************************************************/

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
    <input type="hidden" name="cn" id=""  value="기부_기업사회공헌_공익연계 마케팅_상담신청" />
</form>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">기업사회공헌 </h2>
        <p class="title-sub-txt">사랑을 나누는 다양한 방법을 소개합니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>착한소비(공익연계마케팅)</strong><span>기업이 공익 목적을 위해 자사 상품의 마케팅과 연계하여 기부하는 방법입니다.</span></h3>
            <div class="contents-menu-nav">
            </div>
        </div>

        <div class="seo-box">
            <div class="area-type-a type5">
                <img src="/common/img/contents/marketing-logo_191203.png" alt="" >
                <!--<p class="area-type-tit area-type-tit2"><em class="color-type1">공익연계마케팅(Cause-Related Marketing:CRM)</em>은 기업들이<br>
                    공익과의 연계성을 고려해 활동하는 마케팅의 일종으로,<br>
                    기업이 비영리기관에 브랜드의 이윤 중 일정액을 기부함으로써 사회적 공익에 앞장서는 나눔의 형태를 말합니다.</p>
                <p>이런 마케팅의 기법은 1983년 미국의 아메리칸 익스프레스사에서 처음 도입한 개념으로,<br>
                    당시 자유의 여신상 복원 캠페인으로 회원들이 카드를 사용할 때마다 일정액을 적립해<br>
                    170만달러 기금 조성, 카드 사용액 27% 증가, 신규가입자 10% 증가라는 놀라운 성과를 거두었습니다.<br>
                    이 후 기업들이 다양하고 전략적인 공익마케팅을 개발해 활용하고 있습니다.</p>
                <div class="img-center-box mg-t-ml"><img src="/common/img/contents/marketing_img01.jpg" alt=""></div>  -->
            </div>

            <h4 class="title-heading_b mg-b-m">착한소비란?</h4>
            <div class="camp_info">
                <p class="camp-info-txt2">기업이 제품 판매수익금 일부를 공익을 위해 기부하는 활동인   CRM(cause-related marketing, 공익연계마케팅)의 사랑의열매 브랜드</p>
            </div>
            <h4 class="title-heading_b mgt-m mg-b-m">착한소비 효과</h4>
            <div class="camp_info">
                <p class="camp-info-txt">기업 : 상품 판매 증가로  매출 확대, 기업에 대한 긍정적 이미지 효과</p>
                <p class="camp-info-txt">고객 :  필요한 물품 구입, 상품 구매로 자연스런 기부 동참</p>
                <p class="camp-info-txt">사회복지기관(NGO) 및 취약계층 : 지원을 통한 효과적이고 효율적인 사업 전개, 삶의 질 향상 및 현실적인 문제 해결</p>
            </div>
            <h4 class="title-heading_b mgt-m mg-b-m">착한소비 유형</h4>
            <div class="camp_info">
                <p class="camp-info-txt">나눔상품 : 지정상품 사랑의열매 로고 부착</p>
                <p class="camp-info-txt">나눔홍보 : 상품 광고 및 전단지에  사랑의열매 로고 표기 </p>
            </div>
            <h4 class="title-heading_b mgt-m mg-b-m">착한소비 참여 현황</h4>

					<div class="donation-article">
					    <div class="gallery-list">
					        <ul>
					            <li>
					                <a href="#" class="gallery-link">
					                    <div class="gallery-img"><img src="/common/img/contents/marketing_img01_2001_1.png" alt=""></div>
					                    <p class="gallery-tit align-c"><b>제주특별자치도개발공사 삼다수</b></p>
					                </a>
					            </li>
					            <li>
					                <a href="#" class="gallery-link">
					                    <div class="gallery-img"><img src="/common/img/contents/marketing_img01_2001_2.jpg" alt=""></div>
					                    <p class="gallery-tit align-c"><b>롯데제과 </b></p>
					                </a>
					            </li>
					            <li>
					                <a href="#" class="gallery-link">
					                    <div class="gallery-img"><img src="/common/img/contents/marketing_img01_2001_3.jpg" alt=""></div>
					                    <p class="gallery-tit align-c"><b>경동제약 그날엔 정 </b></p>
					                </a>
					            </li>
					            <li>
					                <a href="#" class="gallery-link">
					                    <div class="gallery-img"><img src="/common/img/contents/marketing_img01_2001_4.jpg" alt=""></div>
					                    <p class="gallery-tit align-c"><b>키스미 마스카라 </b></p>
					                </a>
					            </li>
					        </ul>
					    </div>
					</div>

<!--             <div class="attach-area mgt-l"> -->
<!--                 <div class="contact-wrap"> -->
<!--                     <span>담당자 : 권정만 대리</span> -->
<!--                     <span class="ico-tel">02-6053-0391</span> -->
<!--                     <span class="ico-email">jigomany@chest.or.kr</span> -->
<!--                 </div> -->
<!--             </div> -->

            <div class="btn-area">
                <button type="button" class="btn-base-imp counsel-open" id="btnCounsel">기부상담하기</button>
            </div>
            <!-- S : 기부상담신청 -->
            <div id="counselBox" class="sb-box dis-none">
                <div class="sb-box-inner">
                    <p class="sb-contents-tit">기부상담신청</p>
                    <p class="sb-contents-desc">기부상담을 위해 상담받으실 분 성함과 연락처를 남겨주시면 빠른시간안에 연락드리도록 하겠습니다.</p>
                    <div class="sb-content">
                        <div class="sb-content-tbl">
                            <table>
                                <caption>기부상담신청 정보입니다.</caption>
                                <colgroup>
                                    <col class="col-l">
                                    <col class="col-auto">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">
                                        <label for="cckfunr02_s1">상담지역</label>
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
                                            <button type="button" class="btn-base-imp small" id="companyCheckPlus" title="새 창 열림">인증</button>
                                        </div>
                                        <p class="table-cell">- NICE 평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다.<br>
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
				                        <table summary="제 3자 개인정보 수집‧이용에 동의에 따른  상세정보">
				                            <caption>제 3자 개인정보 수집‧이용에 동의에 따른  상세정보입니다.</caption>
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
                            <a href="" class="btn-base-imp" id="btnCompanyInsert">상담신청</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- E : 기부상담신청 -->
        </div>
    </div>
</main>