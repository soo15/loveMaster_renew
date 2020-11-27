<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사랑의 열매 > 소개  > 지회소개
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
    $(document).ready(function(){

        goTabDisplay((${tabMapYn}?1:0));

    });

    function goTabDisplay(obj){
        // 초기화
        $(".ui-tab-pnl").attr({'aria-hidden':'true'}) ;
        $(".ui-tab-btn").attr('class','ui-tab-btn');

        $("#btn" + obj ).attr('class','ui-tab-btn selected');
        $("#pnl"+ obj +".ui-tab-pnl").attr({'aria-hidden':'false'}) ;
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
</script>

<div class="base-body type-sub" id="baseBody">

    <div class="sub-visual visual04_02">
        <div class="sub-title-area">
            <h2 class="heading-title-a">소개</h2>
            <p class="title-sub-txt">사랑의열매는 이웃사랑의 상징입니다.</p>
        </div>
    </div>

    <%@ include file="../../layout/breadcrumbs.jsp"%>

    <main class="base-main" id="baseMain">
        <div class="contents-area">
            <div class="contents-hd">
                <h3><strong>조직소개</strong><span>나누는 기쁨, 희망과 행복 - 사랑의열매를 소개합니다.</span></h3>
                <div class="contents-menu-nav">
                </div>
            </div>

            <div class="seo-box">
                <div class="ui-tab ui-tab-type2 col-2 contents-tab" id="uiTabCCKI12_1">
                    <div class="ui-tab-btns" btn-id="uiTabCCKI12_1">
                        <button type="button" class="ui-tab-btn" id ="btn0" onclick="javascript:goTabDisplay(0);"><i>소개</i></button>
                        <button type="button" class="ui-tab-btn" id ="btn1" onclick="javascript:goTabDisplay(1);"><i>찾아오시는길</i></button>
                    </div>

                    <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                        <!-- S : 소개 -->
                        <section class="ui-tab-pnl" id="pnl0">
                            <div class="tab-contents">
                                <div class="img-with-txt mg-t-sm">
                                    <div class="img-area">
                                        <div class="img-box"><img src="/common/img/contents/group_info_img11_1.jpg" alt=""></div>
                                    </div>
                                    <div class="text-area">
                                        <p class="txt-big-a">충청북도사회복지공동모금회는</p>
                                        <p class="txt-basic-a">1998년 8월 25일 이상훈 초대 회장의 취임과 함께 공식 출범하였으며, 1999년 사회복지공동모금회법으로 개정되어 ‘사회복지법인 사회복지공동모금회 충청북도지회’로 조직체계가 전환되었습니다. 이후 김준석 회장, 한장훈 회장, 송옥순 회장, 이명식 회장을 거쳐 2019년 11월 제10대 회장으로 노영수 前청주상공회의소 회장이 선출되어 충북지회의 사업을 이어나가고 있습니다. <br>

                                        충북지회는 지회장을 중심으로 충청북도지사를 명예회장으로 위촉했으며, 지회 운영의 중요한 사항을 결정하는 운영위원회와 분야별 주요 활동방향 및 실행을 담당하는 모금, 배분이 조직되어 활동하고 있습니다. 또한 조직운영과 모금, 배분의 투명한 운영을 위한 시민감시위원회가 구성되어 정례화 되고 있습니다. <br><br>

                                        주요 모금사업으로는 직장인이 급여의 일정액을 정기 기부하는 착한일터캠페인과 매월 지급되는 급여에서 1천원 미만의 잔액을 이웃돕기 성금계좌에 자동이체 하는 우수리모금, 개인 정기기부 등이 진행되고 있습니다. 또한 중소규모의 자영업자가 참여하는 착한가게캠페인도 지속적인 참여가 이루어지고 있으며, 기업의 이윤을 지역사회로 환원하는 기업사회공헌 활동이 크게 증가하여 나눔 참여활동이 진행되고 있습니다. 특히, 최근에는 개인이 5년 동안 1억 원을 기부하는 고액기부자 모임인 아너 소사이어티 회원가입도 크게 증가하고 있는 추세입니다. <br><br>

                                        매년 연말에 실시하는 ‘희망나눔캠페인’은 ‘사랑의 온도탑’ 제막식을 시작으로 가두모금 캠페인, 시·군 순회모금, 언론사 모금, 사랑의 계좌모금 등 다양한 행사가 진행되며, 차기년도에 전년도에 나눔에 참여해주신 분들을 초청하여 유공자 포상식도 개최하고 있습니다. <br><br>

                                        이러한 모금을 통해 기탁된 소중한 사랑은 한 해 동안 다양한 지원사업을 통하여 충북지역의 어려운 이웃들과 사회복지시설기관·단체들을 포함한 지역사회 현안문제 해결을 위해 지원되고 있으며, 공정한 심사와 성금의 투명한 집행을 위한 심사·평가를 위한 사회복지 전문가들의 역할이 더욱 강화되고 있습니다. <br><br>

                                        충청북도사회복지공동모금회가 사랑의 열매를 달고 충북도민과 함께한지 벌써 20년째를 맞고 있습니다. 어려운 경제여건 속에서도 항상 함께해주신 도민들의 이웃사랑정신이 사회복지현장과 지역사회에 뿌리 내릴 수 있도록 지속적으로 노력하겠습니다.</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 소개 -->
                        <!-- S : 찾아오시는길 -->
                        <section class="ui-tab-pnl" id="pnl1">
                            <div class="tab-contents">
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 충북 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    (28583)충청북도 청주시 흥덕구 공단로 87(복대동) 충북종합사회복지센터 403호  <br>
                                    대표번호 : 043) 238-9100, 9200  대표팩스 : 043) 238-9300
                                </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                    <div id="daumRoughmapContainer1569891260582" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1569891260582",
                                        "key" : "v93g",
                                        "mapHeight" : "500"
                                    }).render();
                                </script>
                            </div>
                        </section>
                        <!-- E : 찾아오시는길 -->
                    </div>

                </div>
            </div>

        </div>
    </main>
 </div>
