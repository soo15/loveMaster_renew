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
                                        <div class="img-box"><img src="/common/img/contents/group_info_img17.png" alt=""></div>
                                    </div>
                                    <div class="text-area">
                                        <p class="txt-big-a">제주도사회복지공동모금회는</p>
                                        <p class="txt-basic-a">1998년 5월 7일 설립준비위원 위촉 및 제1차 회의를 개최하였으며, 같은해 8월 18일 제주도지사로부터 법인설립허가를 받았으며 8월 21일 법인등기를 실시하여 초대회장에 한창영 회장을 선임하여 좋은 출발을 하였습니다. <br><br>

                                        1999년 4월, 국회는 사회복지공동모금법을 중앙 및 지역의 공동모금회를 단일조직으로 묶는 사회복지공동모금회법으로 대체 입법하여 독립법인으로 운영되던 '사회복지법인 제주도공동모금회'는 '사회복지법인 사회복지공동모금회 제주도지회(이하 '제주지회')'로 전환되었습니다. <br><br>

                                        제주도사회복지공동모금회는 그동안 도내 사회복지의 문제를 해결하기 위해 다양한 배분사업을 실시하고 있으며, 민간 복지재원을 위해 다양한 모금 방법을 개발하여 공정하고 투명한 모금 및 배분 전문기관으로 역할을 다하고 있습니다. <br><br>

                                        앞으로도 제주사회복지공동모금회는 어려운 여건속에서도 나보다 더 어려운 이웃들을 위해 모아 주신 사랑과 정성을 주위의 어려운 이웃들에게 희망으로 전하도록 하겠습니다. 또한 공정한 배분과 투명한 집행으로 배분현장에서 도민의 사회복지욕구를 충족시키기 위하여 민간 지원기관의 역할을 충실히 수행해 나가도록 하겠습니다.</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 소개 -->
                        <!-- S : 찾아오시는길 -->
                        <section class="ui-tab-pnl" id="pnl1">
                            <div class="tab-contents">
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 제주 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    제주시 중앙로 165 상록회관 4층 <br>
                                    대표번호 : 064) 755-9810  대표팩스 : 064) 756-9820
                                </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                    <div id="daumRoughmapContainer1569905734953" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1569905734953",
                                        "key" : "v9ao",
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
