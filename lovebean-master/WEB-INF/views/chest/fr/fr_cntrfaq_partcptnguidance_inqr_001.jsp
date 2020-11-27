<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [하단메뉴] 기부참여안내 > 기부 FAQ 
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
     $(document).ready(function() {

         init();

         $('.ui-acco-btn').off('click').on('click', function(e) {
             clickEvent(this);
         });

         
     });

     function goTabDisplay(obj) {

         
         $('.ui-tab-pnl').attr({'aria-hidden' : 'true'});
         $('.ui-tab-btn').attr('class', 'ui-tab-btn');

         $("#btn" + obj).addClass('selected');
         $("#pnl" + obj + '.ui-tab-pnl').attr({'aria-hidden' : 'false'});
         
         // 해당 Tab 의 첫번째 FAQ 을 활성화 한다. 
         var firstFaq = $( $.find("#pnl" + obj + ' dl.ui-acco-wrap dt.ui-acco-tit button.ui-acco-btn') ).first();
         clickEvent($(firstFaq));
     }

     function init() {

         $.each($('.ui-acco-pnl'), function() {
             $('.ui-acco-pnl').css('display', 'none');
         });

         $.each($('.ui-acco-tit'), function() {
             $('.ui-acco-btn').removeClass('selected');
         });

         goTabDisplay(0); // 첫번째 tab
         
     }

     function clickEvent(obj) {
        
         // 선택 되어 있다면 hide  
         if ($(obj).hasClass('selected')) {

             // 모두 접기 
             $('.ui-acco-btn').removeClass('selected');
             $('.ui-acco-pnl').css('display', 'none');

             $(obj).removeClass('selected');
             $(obj).parent().next('dd.ui-acco-pnl').hide();
             

         } else {

             // 모두 접기 
             $('.ui-acco-btn').removeClass('selected');
             $('.ui-acco-pnl').css('display', 'none');

             $(obj).addClass('selected');
             $(obj).parent().next('dd.ui-acco-pnl').show();

         }
         ;

     }   
    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
</script>

<div class="base-body type-sub" id="baseBody">
    <div class="sub-visual visual_f01">
        <div class="sub-title-area">
            <h2 class="heading-title-a">기부금 FAQ</h2>
            <p class="title-sub-txt">사랑의열매에서 알려드립니다.</p>
        </div>
    </div>
    
    <%@ include file="../../layout/breadcrumbs.jsp"%>
    
    <main class="base-main" id="baseMain">
        <div class="contents-area">
            <div class="contents-hd">
                <h3><strong>기부 FAQ</strong><span>기부관련 자주하는 질문과 답변입니다.</span></h3>
                <div class="contents-menu-nav">
                </div>
            </div>

        <div class="seo-box">
            <div class="ui-tab ui-tab-type2 contents-tab col-2"
                id="uiTabCCKI18_1">
                <div class="ui-tab-btns" btn-id="uiTabCCKI18_1">
                    <button type="button" class="ui-tab-btn" id="btn0" onclick="javascript:goTabDisplay(0);"><i>기부활동</i></button>
                    <button type="button" class="ui-tab-btn" id="btn1" onclick="javascript:goTabDisplay(1);"><i>기부금 세금공제 안내</i></button>
                </div>
                <div class="ui-tab-pnls" pnl-id="uiTabCCKI18_1">
                    <!-- S : 기부활동 -->
                    <section class="ui-tab-pnl" id="pnl0">
                        <h1 class="hide">기부활동</h1>
                        <div class="ui-acco type-qna" role="group" id="uiAccoCCKI18_2">
                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button" class="ui-acco-btn" id="b0">모금회에 기부했을 때 기부금 소득공제는 어떻게 되나요?<span class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>○ 그림파일. [기부금 과세특례]</p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        모금회에 기부를 했는데, 기부금 영수증은 어떻게 받을 수
                                        있나요?<span class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>○ 우편으로 영수증을 원하실 경우에는 연말
                                        소득공제전에 받아보실 수 있구요. 일반적으로 국세청
                                        연말정산간소화서비스 기부내역에서 자동으로 확인하실 수
                                        있습니다.</p>

                                    <p>
                                        발송 주소는 기부당시의 자료를 근거로 하므로, 주소가
                                        변경되신 경우에는 홈페이지 [나의기부]에서 기부정보를
                                        수정하시면 됩니다(기부금 영수증 발송 전)<br>
                                        만약, 우편사고로 12월 중순 이후에도 영수증을 받지 못할
                                        경우에도 모금회로 연락 주시면 재발송 가능합니다.
                                    </p>
                                    <p>[기부금 영수증 신청방법]</p>
                                    <p>
                                        ☞ 온라인 신청 : 나의기부>기부내역>기부금영수증신청<br>
                                        ☞ 전화신청 : 080-890-1212 <br>
                                        ☞ 기타문의 <br> 서울 02-3144-7700
                                        부산 051-790-1400 대구 053-667-1000
                                        <br> 인천 032-456-3333 광주
                                        062-222-3566 대전 042-347-5171 <br>
                                        울산 052-270-9000 경기 031-220-7962
                                        경기북부 031-906-4028 <br> 강원
                                        033-244-1661 충북 043-238-9100 충남
                                        042-489-8423 <br> 전북
                                        063-282-0606 전남 061-902-6800 경북
                                        053-980-7800 <br> 경남
                                        055-270-6700 제주 064-755-9810 세종
                                        044-863-5400
                                    </p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        오늘 기부를 했는데, 홈페이지 내 기부내역 확인에 안
                                        보이나요? <span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>○ 사랑의열매는 기부내역 확인 서비스로 성금사용
                                        내역을 안내하고 있습니다.</p>
                                    <!-- [기부내역 확인하기] -->
                                    <p>
                                        다만, 사랑의열매 홈페이지를 통해서 신용카드·휴대폰·실시간
                                        계좌이체를 한 기부자의 경우, 전자결제시스템(이니시스)를
                                        통해 사랑의열매 계좌로 들어오는데까지 최소 2주에서 최대
                                        3개월까지 소요됩니다. <br> 사랑의열매로
                                        기부금이 전달되면, 기부자님의 핸드폰으로
                                        감사문자(SMS)가 발송됩니다. 그때 홈페이지에 확인하실
                                        수 있습니다.
                                    </p>

                                    <p>때문에 3일 이내 빠르게 기부내역을 확인하고 싶으신
                                        분은 "무통장 입금"으로 기부금을 결제하신 후, 해당
                                        지회로 전화하셔서 기부자정보를 말씀해주셔야 합니다.</p>

                                    <p>감사합니다.</p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        내가 기부한 금액이 모두 제가 원하는 곳에 사용되나요?<span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>○ 기부자님이 쓰이기를 원하셨던 분야로 해당 기부금이
                                        활용됩니다.</p>

                                    <p>
                                        만약 선택하지 않으셨다면 저희 단체가 지원하는 분야 중에
                                        가장 부족한 부분에 사용되게 됩니다.<br>
                                        공동모금회는 아동·청소년, 장애인, 노인, 여성·다문화,
                                        지역사회, 해외지원, 6개 분야 연간 4백만명의 어려운
                                        이웃과 2만여개의 취약한 사회복지시설을 지원하고 있습니다.
                                    </p>

                                    <p>기부내역은 홈페이지 ‘나의기부’에서 확인하실 수
                                        있습니다.</p>
                                    <!-- [나의기부]  -->
                                    <p>또한 뉴스레터나 회보를 신청해 주시면 수시로
                                        사랑의열매의 활동 현황을 살펴보실 수 있습니다</p>
                                    <!-- [뉴스레터 신청하기]  -->
                                    <!-- [회보 신청하기] (<**현재 링크페이지 비활성화) -->
                                    </p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        사랑의열매 모금함은 어디서 구할 수 있나요?<span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>
                                        ○ 현재 원하시는 모든 분들에게 모금함을 드리지 못하고
                                        있습니다.<br> 모금함 관리와 운영를 보다 잘
                                        하기 위함이니 널리 양해해주시기 바랍니다.<br>
                                        가장 가까운 사랑의열매로 문의주시면, 지역 사랑의열매
                                        사무처와 협의하여 모금함을 받으실 수 있습니다.<br>
                                        감사합니다.
                                    </p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        단체 이름으로도 기부가 가능한가요?<span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>○ 법인/기관 회원도 기부가 가능합니다.
                                    <p>
                                    <p>
                                        사업자등록번호를 기준으로 연말 기부금영수증 발급도
                                        가능합니다. 자세한 내용은 아래 기부참여방법 사이트에서
                                        확인 하실 수 있습니다.
                                        <!-- [기부>참여방법안내] -->
                                    </p>
                                    <p>또한, 동호회나 학급이름으로 기부를 원하실 경우에도
                                        기부가 가능합니다. 다만 기부금영수증 발급기준 요건인
                                        주민등록번호나 사업자등록번호가 없는 단체의 경우,
                                        영수증발급이 어려움을 미리 말씀드립니다.</p>
                                    <p>
                                        많은 문의 바랍니다.<br> 기부 상담번호 :
                                        080-890-1212<br>
                                        <!-- ※내게 맞는 기부찾기 [바로가기] -->
                                        감사합니다.
                                    </p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        지난 달에 정기기부 신청을 했는데 왜 통장에서 돈이 안
                                        빠져나갔죠?<span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>
                                        ○ 몇 가지 경우 때문에 출금이 안 될 수도 있습니다.<br>
                                        통장에 잔액이 부족하거나, 계좌번호가 잘못 입력되었거나,
                                        계좌 사용이 금지 되는 경우 등입니다.
                                    </p>
                                    <p>
                                        홈페이지에서 로그인 후
                                        마이페이지>회원정보수정>기본/기부정보 변경에서
                                        정기기부정보를 변경시 현재 계좌상태가 표시됩니다.<br>
                                        신청하신 계좌의 상태가 출금 불가능일 경우, 해당 월의
                                        출금이 정상적으로 이뤄지지 않음을 알려드립니다.
                                    </p>
                                    <p>더 궁금하신 사항은
                                        기부상담번호(080-890-1212)로 문의주시면 친절하고
                                        빠른 상담 받으실 수 있습니다. 감사합니다.</p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        기부 중단은 어떻게 해야하나요?<span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>
                                        ○&nbsp;기부 중단 신청은 사랑의열매 나눔콜센터 080-890-1212로 신청해주시면 됩니다.<br><br>
                                           중단하신 시점에서 다음달 기부약정액이 출금되지 않습니다.</p>
                                    <p>오래도록 나눔을 실천해주셔서 감사드립니다.</p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        왜 주민번호가 필요한가요?<span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>
                                        ○ 개인정보 보호가 굉장히 민감한 사안입니다. <br>
                                        공동모금회는 기부자의 개인정보가 최대한 보호될 수 있도록
                                        노력하고 있습니다.
                                    </p>
                                    <p>
                                        다만 주민번호는 국세청을 통한 소득공제를 받기 위해서는
                                        필수적인 내용입니다.<br> 그리고 기부금을
                                        자동기부하시기 위해서는 금융결제원의 승인이 필요합니다.
                                        기부자님의 통장에서 기부금을 출금하는 것은 매우 중요한
                                        사항이기 때문에 주민번호는 필수적으로 필요합니다. 많은
                                        양해 부탁드립니다.
                                    </p>
                                    <p>
                                        기부자 외의 홈페이지 회원의 경우는 회원가입시 아이핀을
                                        이용하여 가입이 가능하며 3년 이상 미사용 회원에 대해서는
                                        주민번호 삭제를 하는 등 개인정보보호법과 정보통신망법을
                                        준수하고 있습니다.

                                        <!-- 개인정보 보호정책 보기  -->
                                    </p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        계좌이체 이외에 신용카드나 휴대폰 기부가 가능한가요?<span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>○ 물론 기부가 가능합니다.</p>
                                    <p>
                                        하지만, 신용카드 및 휴대폰은 10%에 가까운 수수료가
                                        들어가기 때문에 기부자님이 꼭 원하지 않으시면, 계좌이체를
                                        권해드리고 있습니다.<br> 계좌이체를 하시면
                                        수수료 없이 모든 금액을 기부하실 수 있습니다.

                                        <!-- 기부신청하기  -->
                                    </p>
                                </dd>
                            </dl>

                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button"
                                        class="ui-acco-btn">
                                        은행계좌를 통해 기부하고 싶은데 어떻게 하면 되나요?<span
                                            class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>○ 사회복지공동모금회에 은행계좌를 통해 기부를 하시는
                                        방법은 2가지가 있습니다.</p>
                                    <p>첫째로, 저희 모금회에서 연중 캠페인으로 진행중인
                                        정기기부 계좌이체를 신청하시면 매달 일정액이 성금으로
                                        이체됩니다.</p>
                                    <!-- [정기기부 신청하기] -->
                                    <p>
                                        둘째로는 공동모금회에서 개설중인’사랑의 계좌’로 원하는
                                        금액만큼 보내주시면 됩니다. 지회에 보내주신 성금을 해당
                                        지역의 소외된 이웃을 위해 사용됩니다.
                                        <!-- [지회별 사랑의계좌 확인하기] -->
                                    </p>
                                    <p>
                                        그리고, 은행계좌이체 외에도 신용카드, 핸드폰, ARS 등
                                        다양한 결제방법이 있습니다. 홈페이지 "기부참여방법"에서
                                        한눈에 나에게 맞는 기부방법을 찾아 신청할 수 있습니다.
                                        <!-- [기부참여방법 알아보기] -->
                                    </p>
                                </dd>
                            </dl>

                        </div>
                    </section>
                    <!-- E : 기부활동 -->
                    <!-- S : 기부금 세금공제 안내  -->
                    <section class="ui-tab-pnl" id="pnl1">
                        <h1 class="hide">지원활동</h1>
                        <div class="ui-acco type-qna" role="group"
                            id="uiAccoCCKI18_3">
                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button" class="ui-acco-btn">
                                        1. 개인기부자의 세금공제<span class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>
                                        <span class="b">개인(비사업자/근로소득자)의경우, 근로소득금액의 <span class="yellow">100% 한도</span> 내에서 세액공제를 받을 수 있습니다. 세액공제율은15%이며, 1천만원초과분은30%가적용됩니다.</span> 
                                        <br>*지정기부금단체는 30% 한도인정
                                    </p>
                                    <p class="ex">예시] 연봉이 1억 원인 직장인A씨가 사랑의열매에 3,000만원을 기부했을 때, 기부에 따른 세금 절감은 얼마나 될까요?</p>
                                    <p class="step_title b">STEP 1. 기부인정한도액산출</p>
                                    <p>■ 한도액:근로소득금액의<span class="yellow">100%</span>/근로소득금액= 총급여-근로소득공제
                                        <br>= 1억원-1,200만원+ (1억원-4,500만원) x 5% = 8,525만원
                                    </p>
                                    <p class="c">[근로소득공제]</p>
                                    <table class="c">
                                        <colgroup>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>총급여액</th>
                                                <th>공제액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>500만원이하</td>
                                                <td>총급여액의70%</td>
                                            </tr>
                                            <tr>
                                                <td>500만원초과1,500만원이하</td>
                                                <td>350만원+ 500만원초과액의40%</td>
                                            </tr>
                                            <tr>
                                                <td>1,500만원초과4,500만원이하</td>
                                                <td>750만원+ 1,500만원초과액의15%</td>
                                            </tr>
                                            <tr>
                                                <td>4,500만원초과1억원이하</td>
                                                <td>1,200만원+ 4,500만원초과액의5%</td>
                                            </tr>
                                            <tr>
                                                <td>1억원초과</td>
                                                <td>1,475만원+ 1억원초과액의2%</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <p class="bg_white">▷기부인정한도액은 8,525만 원이므로 A씨가 기부한 3,000만원 전액 세액공제 대상</p>
                                    <p>* 지정기부금단체의 기부인정한도액은 근로소득금액의 30%이므로, A씨가 기부한3,000만원 중 25,575,000원만 세액공제 대상임.</p>
                                    <p class="step_title b">STEP 2. 산출세액계산</p>
                                    <p>세액공제율은 1,000만원을 기준으로 아래와 같이 나뉘므로, 계산시유의 
                                        <br>-1,000만원이하기부금: 세액공제율15% 
                                        <br>-1,000만원초과분: 세액공제율30%
                                    </p>
                                    <p class="bg_white">▷1,000만원x 15% + (3,000만원–1,000만원) x 30% = 7,500,000원</p>
                                    <p>* 지정기부금단체에기부한경우 
                                        <br> 1,000만원x15% + (25,575,000 -1,000만원) x 30% = 6,172,500원
                                    </p>
                                    <p class="step_title b">STEP 3. 절세액확인</p>
                                    <p class="bg_white">▷3,000만원기부시8,250,000원소득세감소(7,500,000원+ 주민세10% 가산)</p>
                                    <p> * 지정기부금단체기부시6,789,750원소득세감소(6,172,500원+ 주민세10% 가산)총급여액	공제액  500만원이하	총급여액의70%</p>
                                </dd>
                            </dl>
                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button" class="ui-acco-btn">
                                        2. 개인사업자의 세금공제<span class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>
                                        <span class="b">종합소득세신고시 사업소득금액의 <span class="yellow">100%한도</span> 내에서 기부자의 선택에 따라 필요경비에 산입하거나 세액공제를 받을 수 있습니다.</span>
                                        <br>*지정기부금단체는30% 한도인정
                                    </p>
                                    <p class="ex">예시] 총수입액이1억원, 필요경비가3,000만원인B씨가 사랑의열매에 3,000만원을 기부했을 때, 기부에 따른 세금절감은 얼마나 될까요?</p>
                                    <p class="step_title b">STEP 1. 기부인정한도액산출</p>
                                    <p>■ 한도액: 사업소득금액의<span class="yellow">100%</span>/ 사업소득금액= 총수입액-필요경비 
                                        <br> = 1억원-3,000만원= 7,000만원
                                    </p>
                                    <p class="bg_white">▷기부인정한도액은 7,000만 원이므로, B씨가 기부한 3,000만원 전액 경비 산입 또는 공제가능</p>
                                    <p>* 지정기부금단체의 기부 인정 한도액은 사업소득금액의 30%이므로, B씨가 기부한3,000만원중 2,100만원만 인정</p>
                                    <p class="step_title b">STEP 2. 산출세액계산</p>
                                    <p>■ 과세표준: 총수입액-기부금-필요경비
                                        <br>= 1억원-3,000만원-3,000만원= 4,000만원
                                    </p>
                                    <p class="c">[종합소득과세표준세율]</p>
                                    <table class="c">
                                        <colgroup>
                                            <col>
                                            <col width="25%">
                                            <col >
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>과세표준</th>
                                                <th>세율(%)</th>
                                                <th>산출세액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1,200만원이하</td>
                                                <td>6%</td>
                                                <td>과세표준의6%</td>
                                            </tr>
                                            <tr>
                                                <td>1,200만원초과4,600만원이하</td>
                                                <td>15%</td>
                                                <td>72만원+ 1,200만원초과액의15%</td>
                                            </tr>
                                            <tr>
                                                <td>4,600만원초과8,800만원이하</td>
                                                <td>24%</td>
                                                <td>582만원+ 4,600만원초과액의24%</td>
                                            </tr>
                                            <tr>
                                                <td>8,800만원초과1억5,000만원이하</td>
                                                <td>35%</td>
                                                <td>1,590만원+ 8,800만원초과액의35%</td>
                                            </tr>
                                            <tr>
                                                <td>1억5,000만원초과3억원이하</td>
                                                <td>38%</td>
                                                <td>3,760만원+ 1억5,000만원초과액의38%</td>
                                            </tr>
                                            <tr>
                                                <td>3억원초과5억원이하</td>
                                                <td>40%</td>
                                                <td>9,460만원+ 3억원초과액의40%</td>
                                            </tr>
                                            <tr>
                                                <td>5억원초과</td>
                                                <td>42%</td>
                                                <td>17,460만원+ 5억원초과액의42%</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <p class="bg_white">▷과세표준이4,000만원이므로산출세액은 <br>
                                        72만원+ (4,000만원-1,200만원) x 15% = 4,920,000원</p>
                                    <p>*지정기부금단체에 기부한 경우 과세표준이 1억원-2,100만원-3,000만원= 4,900만원 이므로 산출세액은 	<br> 582만원+ (4,900만원-4,600만원) x 24% = 6,540,000원
                                    </p>
                                    <p>* 기부금이 없는 경우 과세표준이 1억원-3,000만원= 7,000만 원이므로 산출세액은
                                        <br>582만원+ (7,000만원-4,600만원) x 24% = 11,580,000원 </p>
                                    <p class="step_title b">STEP 3. 절세액 확인</p>
                                    <p class="bg_white">▷1,158만원(기부금이 없는 경우) - 4,920,000원(법정기부금단체에 기부한 경우)
                                        <br>= 6,660,000원
                                        <br>: 7,326,000원 소득세 감소(6,660,000원+ 주민세10% 가산)
                                    </p>
                                    <p>*지정기부금단체에 기부한 경우
                                        <br>1,158만원-6,540,000원= 5,040,000원
                                        <br>: 5,544,00원소득세감소(5,040,000원+ 주민세10% 가산)
                                    </p>
                                </dd>
                            </dl>
                            <dl class="ui-acco-wrap">
                                <dt class="ui-acco-tit">
                                    <button type="button" class="ui-acco-btn">
                                        3. 법인사업지의 세금공제<span class="ui-acco-arrow"></span>
                                    </button>
                                </dt>
                                <dd class="ui-acco-pnl">
                                    <p>
                                        <span class="b">법인세 신고시 해당사업연도 법인 소득금액 <span class="yellow">50% 한도</span> 내에서 전액 필요경비에 산입할 수 있습니다.</span>
                                        <br>*지정기부금단체는10% 한도인정
                                    </p>
                                    <p class="ex">예시] 기준소득금액이12억원인법인이(재)바보의나눔에2억원을기부했을 때, 기부에 따른 세금절감은 얼마나될까요?(이월결손금0원으로 가정)</p>
                                    <p class="step_title b">STEP 1. 기부인정한도액산출</p>
                                    <p>■한도액: 기준소득금액의<span class="yellow">50%</span> / 기준소득금액= 차가감소득금액+기부금-이월결손금
                                        <br>※ 차가감소득금액= 법인세법상 총수입금액–필요경비(기부금을 포함한 금액)
                                        <br>= 12억원 x 50% = 6억원
                                    </p>
                                    <p class="bg_white">▷기부인정한도액은 6억 원으로, 법인이 기부한 2억 원 전액 경비 산입 인정</p>
                                    <p>* 지정기부금단체의 기부인정 한도액은 기준소득금액의 10%이므로, 법인이 기부한 2억 원 중 1억2,000만 원만 인정</p>
                                    <p class="step_title b">STEP 2. 산출세액계산</p>
                                    <p>■과세표준: 총수입액–기부금-필요경비
                                        <br> = 12억원-2억원= 10억원
                                    </p>
                                    <p class="c">[법인과세표준세율]</p>
                                    <table class="c">
                                        <colgroup>
                                            <col>
                                            <col width="25%">
                                            <col >
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>과세표준</th>
                                                <th>세율(%)</th>
                                                <th>산출세액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2억원이하</td>
                                                <td>10%</td>
                                                <td>과세표준의10%</td>
                                            </tr>
                                            <tr>
                                                <td>2억원초과200억원이하</td>
                                                <td>20%</td>
                                                <td>2,000만원+ 2억원초과액의20%</td>
                                            </tr>
                                            <tr>
                                                <td>200억원초과3,000억원이하</td>
                                                <td>22%</td>
                                                <td>39억8,000만원+ 200억원초과액의22%</td>
                                            </tr>
                                            <tr>
                                                <td>3,000억원초과</td>
                                                <td>25%</td>
                                                <td>655억8,000만원+ 3,000억원초과액의25%</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <p class="bg_white">▷과세표준이10억원이므로산출세액은
                                        <br>2,000만원+ (10억원-2억원) x 20% = 1억8,000만원
                                    </p>
                                    <p>* 지정기부금단체에 기부한 경우 과세표준이 12억원-1억2,000만원= 10억8,000만원이므로 산출세액은
                                        <br>2,000만원+ (10억8,000만원-2억원) x 20% = 1억9,600만원
                                    </p>
                                    <p>* 기부금이 없는 경우 과세표준이 12억 원이므로 산출 세액은
                                        <br>2,000만원+ (12억원-2억원) x 20% = 2억2,000만원
                                    </p>
                                    <p class="step_title b">STEP 3. 절세액 확인</p>
                                    <p class="bg_white">▷2억2,000만원(기부금이 없는 경우)-1억8,000만원(법정기부금단체에 기부한 경우)
                                        <br>= 4,000만원
                                        <br>: 4,400만 원 법인세 감소(4천만원+ 주민세10% 가산)
                                    </p>
                                    <p>* 지정기부금단체에 기부한 경우
                                        <br>2억2,000만 원-1억9,600만 원= 2,400만 원
                                        <br>: 2,640만 원 법인세 감소(2,400만 원+ 주민세10% 가산)
                                    </p>
                                </dd>
                            </dl>
                        </div>
                    </section>
                    <!-- E : 기부금 세금공제 안내  -->
                </div>
            </div>

        </div>

        </div>
    </main>
            
 </div>
