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
                                        <div class="img-box"><img src="/common/img/contents/group_info_img14.png" alt=""></div>
                                    </div>
                                    <div class="text-area">
                                        <p class="txt-big-a">전남사회복지공동모금회는</p>
                                        <p class="txt-basic-a">‘사랑의 열매’를 상징으로 어려운 이웃들을 위해 ‘사랑’을 모아 ‘희망’을 만들어가는 곳입니다. <br><br>

                                        1998년 공동모금회를 창립하면서 과거 정부 주도로 이루어지던 이웃돕기운동을 이관 받았습니다. 이후 공동모금회는 우리 사회의 나눔문화를 크게 발전시키고 지역복지 증진에 기여하면서 전국적으로는 연간 5천6백억원, 저희 전남지역에서는 130억원의 성금을 모금하는 명실공히 대한민국을 대표하는 민간 사회복지기관으로 성장하였습니다.<br><br>

                                        중앙지원비를 포함해 175억원 남짓을 전남지역 복지지수를 높이는데 지원하고 있으며 300여개 사회복지시설단체와 지역복지 발전을 위해 소통하고, 지역사회 복지문제를 해결하는 중추가교역할을 다하며, 민간복지기관으로서의 위상을 정립하고 있습니다.<br><br>

                                        또한 연말연시 전개되는 나눔캠페인 외에도 연중모금 활성화를 위해 직장인 나눔캠페인, 착한가게 캠페인, 아너 소사이어티 등 다양한 모금활동을 통해 일상 속에서 나눔을 더 많이 실천 할 수 있도록 적극적으로 모금활동을 펼치고 있습니다.<br><br>

                                        저희 전남 사랑의 열매는 지역사회가 따뜻하고 훈훈하게 발전할 수 있도록 하기 위해 일상의 나눔을 뿌리내리게 하는데 더욱 매진해 나갈 것입니다.<br><br>

                                        앞으로도 더 많은 관심과 사랑으로 어려운 이웃들의 손을 잡아주시고 따뜻하고 성숙한 사회로 나아가는데 아름다운 동행을 해주실 것을 부탁드립니다.<br><br>

                                        감사합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 소개 -->
                        <!-- S : 찾아오시는길 -->
                        <section class="ui-tab-pnl" id="pnl1">
                            <div class="tab-contents">
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 전남 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    (58567) 전남 무안군 삼향읍 후광대로 282 전문건설회관 5층 <br>
                                    대표번호 : 061) 902-6806  대표팩스 : 061) 281-6133
                                </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                    <div id="daumRoughmapContainer1569892998125" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1569892998125",
                                        "key" : "v94q",
                                        "mapHeight" : "500"
                                    }).render();
                                </script>
                                <div class="how-to">
                                    <div class="how-to-section">
                                        <i class="sprite-map-2"></i>
                                        <p class="heading-title-b">버스를 이용하실 경우</p>
                                        <p class="sb-contents-tit">전남도청 하차</p>
                                        <p class="sb-contents-tit">전남도청 정류소 이용 가능한 버스 번호</p>
                                        <dl class="how-to-dl">
                                            <dt>1-1번 :</dt>
                                            <dd>해양대학교 → 목포역 → 버스터미널→ 전남도청(70분 간격)</dd>
                                            <dt>30번 :</dt>
                                            <dd>해양대후문→ 2호광장 → 3호광장→ 기독병원→ 전남도청(13분간격)</dd>
                                            <dt>60번 :</dt>
                                            <dd>삼학도→ 목포역→ 버스터미널 → 시민문화체육센터 → 전남도청(28분간격)</dd>
                                        </dl>

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

