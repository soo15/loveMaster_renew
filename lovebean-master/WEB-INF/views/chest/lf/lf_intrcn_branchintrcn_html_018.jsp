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
                                    <div class="text-area">
                                        <p class="txt-big-a">세종사회복지공동모금회는</p>
                                        <p class="txt-basic-a"> 2005년 행정중심복합도시 건설을 위한 특별법이 제정·공포된 후 2012년 7월 1일 세종특별자치시가 출범하게 되면서 이에 발맞추어 세종시지회 설립준비단을 구성 후 개소하게 되었습니다. <br><br>
                                        세종사회복지공동모금회는 기존의 광역시·도 지역처럼 인적 물적 인프라가 구축되지 않은 어려운 여건속에서도 '사랑의동전 모으기', '성금모금행사', '사랑의 열매달기 운동', 지로모금', '연말집중캠페 인' 등의 다양한 모금활동을 통해 첫 해 6억원의 이웃돕기 성금을 모금하는 성과를 거두었습니다. 이 모든 것은 세종시민의 따뜻한 이웃사랑의 나눔을 통해서만 가능한 일 입니다.
                                        시민 여러분들의 고귀한 사랑으로 모아진 값진 성금은 지역의 사회복지사업을 수행하는 시설 · 기관 과 저소득층, 장애인, 소년소녀가장, 무의탁노인 등 어려운 이웃들의 꿈과 희망을 키우는데 소중히 사용되고 있습니다.<br><br>
                                        세종사회복지공동모금회는 세종시민 여러분에게는 이웃과 사랑을 나누는 기쁨을 안겨주고 지역사회 의 목소리에 귀 기울여 복지사각지대를 해소하고, 저소득층 긴급지원사업을 통해 어려운 이웃에게는 다시 시작할 수 있는 용기와 행복한 내일을 설계할 수 있는 희망을 주기 위해 노력하고 있습니다. 세종시민 여러분의 정성이 담겨있는 성금을 공정하고 투명하게 배분하여 도움을 필요로 하는 이웃을 돌보는데 더욱 정진하겠습니다.<br><br>
                                        사회복지공동모금회와 함께 우리 이웃에게 행복과 희망을 선사해 주신 시민 여러분의 소중한나눔에 감사드리며 우리 주변의 나눔의 손길이 필요한 이웃들과 함께 하나되는 행복도시세종이 되도록 행 복 파트너로서 세종사회복지공동모금회가 함께하겠습니다.
                                        앞으로도 지속적인 참여와 관심을 부탁드립니다. 감사합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 소개 -->
                        <!-- S : 찾아오시는길 -->
                        <section class="ui-tab-pnl" id="pnl1">
                            <div class="tab-contents">
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 세종 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    세종특별자치시 조치원읍 충현로 40, 4층 (휘림빌딩) <br>
                                    대표번호 : 044) 863-5400  대표팩스 : 044) 863-5401
                                </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                    <div id="daumRoughmapContainer1569905950656" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1569905950656",
                                        "key" : "v9av",
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

