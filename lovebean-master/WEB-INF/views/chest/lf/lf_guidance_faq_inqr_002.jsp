<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사랑의 열매 > 안내  > FAQ 
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
        $("#pnl" + obj + ".ui-tab-pnl").attr({'aria-hidden' : 'false'});

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

<div class="sub-visual visual04_02">
    <div class="sub-title-area">
        <h2 class="heading-title-a">안내</h2>
        <p class="title-sub-txt">사랑의 열매는 이웃사랑의 상징입니다.</p>
    </div>
</div>

    <%@ include file="../../layout/breadcrumbs.jsp"%>


<main class="base-main" id="baseMain">
<div class="contents-area">
    <div class="contents-hd">
        <h3>
            <strong>FAQ</strong><span>기부와 지원등 사랑의열매에 궁금하신 점을 안내합니다. </span>
        </h3>
        <div class="contents-menu-nav">
        </div>
    </div>

    <div class="seo-box">
        <div class="ui-tab ui-tab-type2 contents-tab col-4"
            id="uiTabCCKI18_1">
            <div class="ui-tab-btns" btn-id="uiTabCCKI18_1">
                <button type="button" class="ui-tab-btn" id="btn0"
                    onclick="javascript:goTabDisplay(0);">
                    <i>모금회 일반</i>
                </button>
                <button type="button" class="ui-tab-btn" id="btn1"
                    onclick="javascript:goTabDisplay(1);">
                    <i>기부활동</i>
                </button>
                <button type="button" class="ui-tab-btn" id="btn2"
                    onclick="javascript:goTabDisplay(2);">
                    <i>지원활동</i>
                </button>
                <button type="button" class="ui-tab-btn" id="btn3"
                    onclick="javascript:goTabDisplay(3);">
                    <i>기타</i>
                </button>
            </div>
            <div class="ui-tab-pnls" pnl-id="uiTabCCKI18_1">
                <!-- S : 모금회 일반 -->
                <section class="ui-tab-pnl" id="pnl0">
                    <h1 class="hide">모금회 일반</h1>
                    <div class="ui-acco type-qna" role="group"
                        id="uiAccoCCKI18_1">
                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    성금을 내면 필요한 곳에 쓰지 않고, 사회복지공동모금회가
                                    맘대로 운영비로 쓴다면서요? <span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>○ 법정기관인 공동모금회는 「사회복지공동모금회법
                                    제25조(재원의 사용 등)」에 근거해 전년 모금액의 10%
                                    범위 내에서만 관리운영비를 쓸 수 있습니다. 국민의 소중한
                                    성금을 조금이라도 더 어려운 이웃에 지원하기 위해 명확한
                                    집행지침을 세워서 예산을 절감하고 있습니다.</p>

                                <p>○ 그 결과 최근 5년간(2012~2016) 모금회의
                                    관리운영비 평균비율은 5.6%이며, 2016년의 경우
                                    6.1%를 관리운영비로 사용했습니다. 주요 모금기관의
                                    관리운영비 평균 비율이 15.2%([국세청 공익법인
                                    결산서류 공시시스템] 결산액 기준)인데 비하면 약 3분의
                                    1수준으로 매우 낮은 비율을 유지하고 있음을 알려드립니다.
                                    미국 등 기부선진국에서는 약 15~30%를 사용하고
                                    있습니다.</p>

                                <p>
                                    ○ 관리운영비를 포함한 조직운영에 대해서는 시민감시위원회를
                                    통해 운영의 투명성을 점검받고 있으며, 정기적인 내부감사와
                                    보건복지부 감사, 국회 국정감사를 받고 있습니다. 덧붙여
                                    경영의 투명성과 기부자의 알권리를 위해 자발적으로
                                    경영공시를 하고 있습니다. 수입 및 지출현황을 비롯한
                                    정보는 홈페이지에서 확인 가능합니다.
                                    <!-- [경영성과 바로가기]</p> -->
                                <p>○ 앞으로도 저희 공동모금회는 기부자들의 소중한
                                    성금을 최대한 아껴 사용하고, 효과적인 배분과 투명한
                                    조직운영으로 더 큰 믿음을 드리도록 노력하겠습니다.</p>

                                <p>※ 참고 사회복지공동모금회법 제25조(재원의 사용
                                    등) ④ 기부금품 모집과 모금회의 관리·운영에 필요한
                                    비용은 바로 앞 회계연도 모금총액의 100분의 10의
                                    범위에서 이사회의 의결을 거쳐 사용할 수 있다.</p>
                            </dd>
                        </dl>
                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    다른 모금기관들과 사회복지공동모금회는 어떻게 다른가요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>○ 사회복지공동모금회법(특별법)에 의해 출현한
                                    법정기부금단체(기획재정부령 제480호)로 모금과 배분을
                                    포함한 기관 운영 전반이 법률로 정해져 있어 공공성과
                                    투명성이 보장되어 있습니다. 또한 목적사업을 중심으로
                                    운영되는 타 모금기관과 달리 특정 단체 및 대상이 아닌
                                    지역ㆍ단체ㆍ대상자 및 사업별로 복지수요가 공정하게
                                    충족되어야 함을 법령 내 기본원칙에서 정하고 있어 대상의
                                    공정성과 포괄성을 보장하고 있습니다. 이밖에 개인이나
                                    법인이 공동모금회에 기부하였을 경우는 소득세법 적용을 받아
                                    “법정기부금”으로 분류되어 타 기관에 기부하였을 때보다
                                    세금공제혜택에서 유리합니다.</p>
                            </dd>
                        </dl>
                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    사회복지공동모금회는 정부기구입니까?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>○ 아닙니다.</p>

                                <p>사회복지공동모금회는 「사회복지공동모금회법(법률 제
                                    5960 호)」에 의해 1999년 7월 중앙회와 17개
                                    지회로 설립된 사회복지법인으로 민간기관입니다.(2014년
                                    7월 세종지회 개소) 사회복지공동모금회는 경제, 종교,
                                    사회복지, 시민사회단체, 언론계 등 각계 각층의 자발적인
                                    참여로 이루어진 이사회와 분과실행위원회에 의해 모금 및
                                    배분 사업을 행하고 있는 민간 전문 모금 및
                                    배분기관입니다.</p>
                                <!-- 더 자세한 내용은 [공동모금회 소개]에서 확인 가능합니다.</p> -->
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    모금회는 사업의 투명성을 위해 어떤 노력을 하나요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 공동모금회는 법정 전문 모금단체로서 투명성을 위해
                                    내부·외부 감사를 진행하고 있습니다.<br>
                                    정기적인 복지부·감사원 감사를 외부감사뿐만 아니라 외부
                                    시민들로 구성된 시민감시위원회 운영과, 내부 상시감사 등을
                                    진행하고 있습니다. 덧붙여 국민권익위원회에 의뢰하여 청렴도
                                    평가기준 및 청렴컨설팅을 실시하는 등 다양한 방법으로
                                    노력하고 있습니다.
                                </p>

                                <p>
                                    또한 "공공기관의 통합공시에 관한 기준" 적용대상은
                                    아니나, 경영의 투명성과 기부자의 알권리를 위해 자발적으로
                                    경영공시를 하고 있습니다.<br> 수입및
                                    지출현황을 비롯한 정보를 홈페이지에서 확인 가능합니다.
                                </p>
                                <!-- [경영공시 바로가기]  -->
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    사랑의열매는 어떻게 구하나요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 사랑의열매는 사회복지공동모금회의 정신을 담고 있는
                                    상징이자 심볼입니다. </br> 사랑의열매는 사회복지공동모금회를
                                    통해 이웃사랑을 실천하신 분들께 나누어 드리고 있습니다.
                                </p>
                                <p>[사랑의열매 신청방법]</p>

                                <p>
                                    ☞ 이메일 신청 : webmaster@chest.or.kr</br>
                                    ☞ 전화신청 : 전국지회 연락처
                                </p>
                                <p>
                                    서울 02-3144-7700 부산 051-790-1400
                                    대구 053-667-1000<br> 인천
                                    032-456-3333 광주 062-222-3566 대전
                                    042-347-5171<br> 울산
                                    052-227-0770 경기 031-220-7962
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
                                    사랑의열매는 어떤 뜻인가요? <span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 사랑의열매는 사회복지공동모금회의 정신을 담고 있는
                                    상징이자 심볼입니다. <br> 세 개의 빨간
                                    열매는 "나"와 "가족" 그리고 "이웃"을, <br>
                                    빨간색은 따뜻한 사랑의 마음을, <br> 하나로
                                    모아진 줄기는 더불어 함께 사는 사회를 만들어가는 의미를
                                    담고 있습니다.
                                </p>

                                <p>더 자세한 내용이 궁금하시거나, 사랑의열매 CI
                                    이미지파일을 다운받고 싶은신 분은 사랑의열매 소개
                                    페이지에서 확인 가능합니다.</p>
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    수업과제에 필요한 프로포절 양식은 어디서 구할 수 있나요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>○ 모금회 프로포절 양식이라고 하나의 포맷이
                                    정해져있지 않습니다. 사업마다 다른 신청양식을 요구하고
                                    있습니다.</p>
                                <!-- 각 사업의 신청양식은 [지원>서식자료]에서 확인 바랍니다.  -->

                                <p>덧붙여, 사업신청서(프로포절)는 저작권이 있는
                                    해당기관 자료이기 때문에 모금회가 직접 제공할 수
                                    없습니다.</p>
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    이웃돕기운동과 사랑의열매는 어떤 관계입니까? <span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>○ "사랑의열매"를 달아 보셨는지요?</p>

                                <p>사랑의열매는 1980년 사회복지공동모금회의 전신이라고
                                    할 수 있는 보건복지부 산하 "이웃돕기운동중앙추진위원회"
                                    발족과 함께 시작됐고, 이웃돕기운동의 상징으로 이웃사랑을
                                    나누신 분들께서 "나눔과 참여"의 표시로 달아오고
                                    있습니다. 참고로 일본의 경우는 "붉은 깃털"을, 미국의
                                    경우는 "손과 무지개"를 공동모금기관의 상징물로 사용하고
                                    있습니다.</p>

                                <p>즉, 사랑의열매는 사회복지공동모금회를 상징하는 국민
                                    희망 아이콘입니다.</p>
                            </dd>
                        </dl>

                    </div>
                </section>
                <!-- E : 모금회 일반 -->
                <!-- S : 기부활동 -->
                <section class="ui-tab-pnl" id="pnl1">
                    <h1 class="hide">기부활동</h1>
                    <div class="ui-acco type-qna" role="group"
                        id="uiAccoCCKI18_2">
                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    모금회에 기부했을 때 기부금 소득공제는 어떻게 되나요?<span
                                        class="ui-acco-arrow"></span>
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
                                    ○ 기부 중단 신청은 나의기부에서 기부중단을 신청해주시면 즉시 중단되며 콜센터(080-890-1212)를 통해서도 안내받으실 수 있습니다. <br>
                                    중단하신 시점에서 다음달 기부약정액이 출금되지 않습니다.
                                </p>
                                <p>오래도록 나눔을 실천해주셔서 감사하며, 다시 기부를
                                    고민하시게 되면, 사랑의열매
                                    기부상담(080-890-1212)로 문의 주시기 바랍니다.
                                </p>

                                <p>감사합니다.</p>
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
                <!-- S : 지원활동 -->
                <section class="ui-tab-pnl" id="pnl2">
                    <h1 class="hide">지원활동</h1>
                    <div class="ui-acco type-qna" role="group"
                        id="uiAccoCCKI18_3">
                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    사랑의열매 차량은 어떻게 받을 수 있나요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>○ 공동모금회는 지원이 필요한 많은 시설과 기관을
                                    위해 정해진 절차와 기준에 의해 지원사업을 하고 있습니다.</p>
                                <p>문의주신 내용에 답변드리겠습니다. 우선 공동모금회
                                    지원사업 신청은 [온라인배분신청 사이트]에서 가능합니다.
                                    지역 사랑의열매 사무처에 따라 각각 다른 시기에 신청공고를
                                    올리고, 그때 신청하시면 심사를 통해 지원이 가능합니다.</p>
                                <p>더 자세한 내용은 가장 가까운 지역의 사랑의열매로
                                    문의주시면 친절하고 빠른 내용 답변 가능합니다.
                                    감사합니다.</p>
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    지정기탁이 무엇인가요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 사회복지공동모금회법 제27조(기부금품의 지정사용)에
                                    근거하여 답변드리겠습니다. <br> 지정기탁이란
                                    기부금품의 기부자는 배분지역·배분대상자 또는 사용용도를
                                    지정할 수 있는 제도를 뜻합니다.
                                </p>
                                <p>
                                    기부자의 지정 취지에 따라 기부금품을 사용하는 것을
                                    말합니다 다만, 사용 시 지정 및 그 사용방법에 관하여
                                    필요한 사항을 정할 수 있도록 되어 있습니다.<br>
                                    사업의 적정성에 관하여 배분분과실행위원회 심의를 거쳐야
                                    합니다.
                                </p>
                                <p>좀 더 구체적인 답변이 필요하시다면, 가까운 지역의
                                    사랑의열매로 문의바랍니다.</p>
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    사회복지 시설(기관)에서 필요한 의류나 물품을 신청할 수
                                    있나요?<span class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 사회복지공동모금회에서는 <br> 아모레퍼시픽,
                                    한국타이어 등의 기업에서 지속적인 현물기부를 받아 지원하고
                                    있습니다.
                                </p>

                                <p>하지만 품목과 수령이 한정되어 있으므로 원하시는 모든
                                    물품이 지원되지는 못하고 있습니다. 모금회 홈페이지 공고를
                                    통해 일정기간 신청을 받아 지원하고 있습니다.</p>

                                <!-- 자세한 사항은 [물품나눔 안내]를 참고해주세요. </p> -->
                            </dd>
                        </dl>
                    </div>
                </section>
                <!-- E : 지원활동 -->
                <!-- S : 기타 -->
                <section class="ui-tab-pnl" id="pnl3">
                    <h1 class="hide">기타</h1>
                    <div class="ui-acco type-qna" role="group"
                        id="uiAccoCCKI18_4">
                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    사랑의열매 자원봉사는 어떻게 참여할 수 있나요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 사랑의열매는 전국단위 "사랑의열매 봉사단"을 운영하고
                                    있습니다.<br> 나눔문화 확산을 위해 모금활동을
                                    독려하고, 모금회 배분사업에 대해 모니터링을 하는 등의
                                    활동을 합니다.<br> 각 지역별로 운영되고
                                    있기에, 가장 가까운 사랑의열매 사무처로 문의 바랍니다.<br>
                                    감사합니다.
                                </p>
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    사랑의열매 기관 방문은 어디서 신청하나요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 모금회 기관방문을 위해서는 신청과 승인 절차를 거쳐야
                                    합니다.<br> 우선 가장 가까운 지역의
                                    사랑의열매에 연락하셔서 방문이 가능한지 확인 합니다.<br>
                                    홈페이지 [공지>기관방문>기관방문신청] 을 통해 기관방문
                                    신청서를 접수하여 주시기 바랍니다. <br>
                                    다만, 12월~1월은 집중모금 캠페인 기간으로 기관
                                    담당자들의 업무로 인해 기관방문이 어려울 수도 있음을 말씀
                                    드립니다.
                                </p>
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    모금회에서 실습은 어떻게 해야 할 수 있나요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 중앙 공동모금회에서 정기적인 실습 프로그램을 운영하고
                                    있지는 않습니다.<br> 만일, 실습생 모집을 할
                                    경우에는 홈페이지 내 [채용공고] 게시판에 안내합니다.<br>
                                    각 지역 사무처는 상황에 따라 실습생을 모집·운영하고
                                    있습니다.<br> 가장 가까운 지역의 사랑의열매
                                    사무처로 직접 문의주시면 친절하고 정확한 답변 들으실 수
                                    있습니다.<br> 감사합니다.
                                </p>
                            </dd>
                        </dl>

                        <dl class="ui-acco-wrap">
                            <dt class="ui-acco-tit">
                                <button type="button"
                                    class="ui-acco-btn">
                                    모금회 채용은 언제 이뤄지나요?<span
                                        class="ui-acco-arrow"></span>
                                </button>
                            </dt>
                            <dd class="ui-acco-pnl">
                                <p>
                                    ○ 모금회 채용은 정기 전국 공채와 비정기 채용이
                                    있습니다.<br> 정규직과 계약직·인턴직 등 채용
                                    내용에 따라서 각기 일정과 방식이 달라집니다.<br>
                                    채용시에는 사랑의열매 홈페이지 [공지사항>채용정보]와 유명
                                    채용사이트에 공개하고 있습니다.<br> 또한,
                                    계약직 채용의 경우 중앙회를 외 16개 전국 지회별로
                                    진행하는 경우도 있으니 각 지회 홈페이지의 공지사항 또는
                                    가까운 사랑의열매 사무처에 문의 바랍니다.
                                </p>
                            </dd>
                        </dl>

                    </div>
                </section>
                <!-- E : 기타 -->
            </div>
        </div>

    </div>
</div>
</main>

