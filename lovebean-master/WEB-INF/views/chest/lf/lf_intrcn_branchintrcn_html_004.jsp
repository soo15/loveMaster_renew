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
                                            <div class="img-box"><img src="/common/img/contents/group_info_img04.png" alt=""></div>
                                        </div>
                                        <div class="text-area">
                                            <p class="txt-big-a">사회복지공동모금회는</p>
                                            <p class="txt-basic-a"> 공동모금을 통하여 사회복지에 대한 국민의 이해와 참여를 제고함과 아울러 국민의 자발적인 성금으로 조성된 재원을 효율적이고 공정하게 관리ㆍ운용 함으로써 사회복지증진에 이바지 하기 위해 [사회복지공동모금회법]에 의해 1998년 설립된 법정민간단체입니다. <br><br>
                                            공동모금제도는 지역사회를 바탕으로 '모두를 위한 한 번의 기부' 원리를 통해 기부의 일원화를 달성하고 모금된 기금을 보다 효율적으로 활용하는 원칙에서 출발하는 것으로서, 민간 사회복지 관련기관의 재정확충을 돕고 기부금의 공동모금과 공동배분을 통한 서비스 중복의 방지, 자원의 효율적 관리, 민간사회복지사업의 활성화, 그리고 지역사회 주민들에게 지역사회 복지증진을 위한 기회를 제공해 주는 것과 같은 효과를 가져올 수 있었습니다.<br><br>
                                            대구사회복지공동모금회의 설립도 이에 준하여 공동모금사업을 추진하게 되어 1998년 4월 21일 대구광역시공동모금회 설립위원회(위원장:강영신) 및 실무위원회(위원장:박태영)를 발족하여 정관 및 법인설립을 준비하였으며 1998년 7월 16일 창립이사회를 개최하여 단독 사회복지법인으로 출범하여 공동모금 업무를 시작하였습니다. 그러다 1999년 5월 1일부로 사회복지공동모금회 대구광역시지회로 전환되어 현재에 이르고 있습니다.<br><br>
                                            대구사회복지공동모금회는 대구 기부문화의 정착과 확산을 주도하고, 배분사업을 통한 민간복지 발전 및 사회복지의 문제 해결을 위해 끊임없이 노력하고 있으며, 앞으로도 시민여러분들의 이웃사랑을 더욱 공정하고 투명하게 지원하여 우리 사회에 어렵고 힘든 이웃들에게 든든한 버팀목이 될 수 있는 ‘대구 사랑의 열매’가 되도록 최선을 다하겠습니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- E : 소개 -->
                            <!-- S : 찾아오시는길 -->
                            <section class="ui-tab-pnl" id="pnl1">
                                <div class="tab-contents">
                                    <h4 class="heading-title-b mg-t-sm">사랑의열매 대구 사회복지공동모금회</h4>
                                    <p class="map-adress">
                                        <i class="sprite-map-1"></i>
                                        (412-60)대구광역시 동구 장등로 36 4층 (신천동 123-1, 아성빌딩) <br>
                                        대표번호 : 053) 667-1000  대표팩스 : 053-667-1009, 053-255-1015
                                    </p>
<!--                                     <div class="btn-area-r mg-t-s"> -->
<!--                                         <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                     </div> -->
                                    <!-- * 카카오맵 - 지도퍼가기 -->
                                    <!-- 1. 지도 노드 -->
                                    <div class="map-area">
                                        <div id="daumRoughmapContainer1569826897736" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                    </div>
                                    <!--
                                        2. 설치 스크립트
                                        * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                    -->
                                    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                    <!-- 3. 실행 스크립트 -->
                                    <script charset="UTF-8">
                                        new daum.roughmap.Lander({
                                            "timestamp" : "1569826897736",
                                            "key" : "v8mw",
                                            "mapHeight" : "500"
                                        }).render();
                                    </script>
                                    <div class="how-to">
                                        <div class="how-to-section">
                                            <i class="sprite-map-2"></i>
                                            <p class="heading-title-b">버스를 이용하실 경우</p>
                                            <p class="sb-contents-tit">주변 정류장) 신천초등학교앞, 신천초등학교건너, 상공회의소앞, 귀빈예식장앞, 솔렌스힐건너</p>
                                            <p class="sb-contents-tit">해당 장소 주변에 정차하는 버스리스트</p>
                                            <dl class="how-to-dl">
                                                <dt>간선 :</dt>
                                                <dd>399 (갈고개-자인-터미널-자인) 399 (갈고개-자인-터미널-자인-갈고개) 399 (갈고개-터미널-반곡) 399 (곡란-자인-터미널-자인) 399 (반곡-자인-터미널-자인) 399 (사림,흥정,우검-자인-터미널-자인) 399 (사림-자인-터미널-자인) 399 (사림-자인-터미널-자인-남산) 399 (상대-터미널-자인) 399 (송림-자인-터미널-자인) 399 (외촌-자인-터미널-자인) 399 (자인-고속터미널-자인) 399 (자인-마곡,진량-터미널-자인-외촌) 399 (자인-터미널-경리-곡란) 399 (자인-터미널-경산-자인-갈고개) 399 (자인-터미널-경산-자인-반곡) 399 (자인-터미널-경산-조곡) 399 (자인-터미널-자인-사림) 399 (자인-터미널-자인-송림) 399 (자인-터미널-자인-우검) 399 (자인-터미널-자인-우검,흥정,사림) 399 (조곡-자인-터미널-자인) 805 814 814 818 (대구대-귀빈-북리-황제) 818 (대구대-귀빈-황제) 818 (윤성-진량고-초원-하양-귀빈-황제) 818 (윤성-황제-귀빈-황제) 818 (하양-귀빈-황제) 818 (하양-능성-하양-귀빈-황제) 818 (하양-신녕,은해사,하양-귀빈-대구대-황제) 818 (황제-귀빈-대구대) 818 (황제-귀빈-북리-신상삼거리) 818 (황제-귀빈-북리-황제) 818 (황제-귀빈-황제) 818 (황제-북리-귀빈-대구대) 818 (황제-북리-귀빈-북리-신상삼거리)</dd>
                                                <dt>지선 :</dt>
                                                <dd>동구1 동구1-1 수성4</dd>
                                                <dt>일반 :</dt>
                                                <dd>399 (갈고개-남곡-자인-터미널-자인)</dd>
                                            </dl>
                                        </div>

                                        <div class="how-to-section">
                                            <i class="sprite-map-3"></i>
                                            <p class="heading-title-b">지하철을 이용하실 경우</p>
                                            <p class="sb-contents-tit">대구 1호선 신천역</p>

                                        </div>
                                    </div>
                                </div>
                            </section>
                            <!-- E : 찾아오시는길 -->
                        </div>


                    </div>
                </div>

            </div>
        </main>
 </div>

