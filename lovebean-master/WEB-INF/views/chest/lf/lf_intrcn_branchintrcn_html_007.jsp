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
                                        <div class="img-box"><img src="/common/img/contents/group_info_img07.png" alt=""></div>
                                    </div>
                                    <div class="text-area">
                                        <p class="txt-big-a">사랑은,</p>
                                        <p class="txt-basic-a">아무리 써도 줄어들지 않는 화수분처럼 나눌수록 줄어들지 않고 더욱 늘어납니다. 대전 사회 9 복지공동모금회는 각계각층의 국민들이 보내주신 소중한 성금을 도움이 필요한 많은 곳에 지원하고 있습니다. 아동 · 청소년을 비롯해 장애인, 노인, 여성 · 다문화, 지역사회, 해외에 이르기까지 나눔의 손길이 미치는 곳은 넓고도 다양합니다. 기부자의 기쁨과 보람이 살아 숨 쉬는 나눔의 현장은 언제나 밝고 따스합니다. 귀여운 고사리 손의 어여쁜 마음부터 직장인분들의 소중한 월급정기기부, 착한가게, 착한가정, 아너소사이어티 등 소외 이웃을 위한 다양한 모금의 손길이 한층 따뜻한 대전을 만들어가고 있습니다.<br><br>
                                        저희 대전모금회는 공동모금을 통하여 사회복지에 관한 이해와 참여를 촉진하고, 국민의 자발적인 성금 으로 모금된 재원을 효율적이고 공정하게 관리·운용함으로써 사회복지증진에 이바지하고 있습니다. 대전모금회의 가장 큰 특징은 특정지역이나 단체, 분야, 종교에 국한되는 것이 아니라 대전지역 내 모든 사회복지기관과 시민단체, 개인을 지원하는 '포괄성과 공정성' 에 있습니다. 이 점을 인정받아 1999년 1월부터 조세특례제한법에 의해 기부금 전액이 손금산입이 가능한 유일한 민간사회복지법인으로서 기부 문화의 확대와 기업의 사회복지 참여 활성화에 새로운 지평을 열어가고 있습니다.<br><br>
                                        연말연시 희망나눔캠페인과 모금함 모금, 시민이 직접 참여하는 지로 모금, 매월 월급에서 일정액을 기 부하는 '착한일터캠페인' , 자영업 종사자와 함께하는 '착한가게캠페인' , 자녀와 부모가 함께 나눔 에 참여하는 '착한가정캠페인' 과 지역 방송사와 함께 하는 '방송사모금' 등 다양한 모금캠페인을 통해 이웃돕기 재원을 조성하고 있습니다. 지속적인 언론홍보 및 사랑의 열매 달기 등 시민과 함께하는 캠페인을 통해 더불어 사는 사회를 만들고 지역 내 나눔문화확산을 위해 노력하고 있습니다. 또한 기부자에게 월간 회보, 뉴스레터, 감사편지 발송 등을 통해 대전모금회의 소식을 전하는 한편, 희망나눔캠페인 기간 동안에는 지로용지, 전단지 배포 및 신문 보도 등을 통한 모금 및 배분현황보고를 매년 시행하여 성금사용의 투명성 제고에 만전을 기하고 있습니다.<br><br>
                                        조성된 재원은 각계의 전문가로 구성된 위원회의 엄격한 심사를 통해 합리적이고 가치 있게 쓰여지고 있으며, 그 내역은 언론에 공개하고 있습니다.</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 소개 -->
                        <!-- S : 찾아오시는길 -->
                        <section class="ui-tab-pnl" id="pnl1">
                            <div class="tab-contents">
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 대전 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    (35275)대전광역시 서구 계룡로 314 (갈마동 274-7번지) 대전일보 9층<br>
                                    대표번호 : 042) 347-5171  대표팩스 : 042) 471-5174
                                </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                    <div id="daumRoughmapContainer1569828211025" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1569828211025",
                                        "key" : "v8o3",
                                        "mapHeight" : "500"
                                    }).render();
                                </script>
                        </section>
                        <!-- E : 찾아오시는길 -->
                    </div>

                </div>
            </div>

        </div>
    </main>
 </div>
