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
                                        <div class="img-box"><img src="/common/img/contents/group_info_img06.png" alt=""></div>
                                    </div>
                                    <div class="text-area">
                                        <p class="txt-big-a">광주지회는 1998년 4월 6일</p>
                                        <p class="txt-basic-a">사회복지공동모금법의 발효를 앞두고 5명의 설립준비 위원이 위촉되면서 광주지역공동모금회 설립준비위원회가 가동되어 정관을 마련하고 5월과 6월에 걸쳐 초대 이사회를 구성하였다. <br><br>

                                        7월 15일에 열린 창립총회에서 박선홍 초대회장과 임원진을 위촉하고 명예회장 및 고문을 추대했으며, 모금회 사무국 현판식을 갖고 역사적인 첫발을 내디뎠다.<br><br>

                                        1999년 4월, ‘사회복지법인 광주지역공동모금회’는 사회복지공동모금회법이 대체입법 됨에 따라 독립법인으로서 짧은 활동기간을 마감하고 전국 단일법인인 ‘사회복지법인 사회복지공동모금회 광주광역시지회’로 전환되어 활동을 이어갔다. 지회의 전환에 따라 법인이사회는 운영위원회로 대체되어 안정적인 조직활동 체계를 모두 갖추고 활동을 가속화했다.<br><br>

                                        공동모금 첫해인 1999년에 총 8억9천5백여만원을 모금하여 관이 주도하던 전년도에 비해 모금액이 늘어나 시민1인당 모금액이 16개지역중 1위를 차지하여 민간모금에 대한 우려를 불식시켰으며 2005년에는 22억8천5백여만원, 2010년에는 41억3천8백만원, 2012년에는 57억6천6백만원을 모금하는 등 지속적인 성장을 이어갔다.<br><br>

                                        이렇게 모금된 성금은 광주지역에 있는 생활보호대상자 및 저소득 계층을 지원하기 위해 사회복지기금을 조성하고 지원하는 역할을 하고 있다. 국민의 복지 증진을 위한 일이 마땅히 정부가 해야 하지만, 정부의 경우는 하는 일은 방대하고 경직되어 있는 경우가 많아서 정부의 손길이 미처 뻗치지 못하는 경우의 대상자를 찾아서 지원하고 있으며, 지역의 복지욕구를 적극 수렴하여 기획사업을 추진함으로써 광주지역 사회복지 지원사업의 질 향상을 도모하고 있다.<br><br>

                                        현재 광주지회는 연말연시에 집중되는 일회성 성금모금 방식에서 벗어나 ARS모금사업, 자선바자회, 빛고을시민1%나눔운동 등 연중 이웃돕기 모금운동을 활성화하기 위한 다양한 모금방식을 개발하여 공동모금에 대한 시민들의 이해와 참여를 증진시키기 위한 자원개발사업에 주력하고 있다.</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 소개 -->
                        <!-- S : 찾아오시는길 -->
                        <section class="ui-tab-pnl" id="pnl1">
                            <div class="tab-contents">
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 광주 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    (61639) 광주광역시 남구 천변좌로 398, 전남매일 3층<br>
                                     대표번호 : 062)222-3566   대표팩스 : 062)222-5911
                                </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                   <div id="daumRoughmapContainer1602720091243" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                    	"timestamp" : "1602720091243",
                                		"key" : "22g7c",
                                        "mapHeight" : "500"
                                    }).render();
                                </script>
                                <div class="how-to">
                                    <div class="how-to-section">
                                        <i class="sprite-map-2"></i>
                                        <p class="heading-title-b">버스를 이용하실 경우</p>
                                        <p class="sb-contents-tit">사직공원 앞 정류장 하차</p>
                                        <p class="sb-contents-tit">사직공원 앞 정류장 이용 가능한 버스번호</p>
                                        <p class="how-to-dl">금남55</p>
                                    </div>
                                    <!-- <div class="how-to-section">
                                        <i class="sprite-map-4"></i>
                                        <p class="heading-title-b">자동차를 이용하실 경우</p>
                                        <p class="sb-contents-tit">아이나비, 맵피, 지니, 아틀란, T맵, 올레navi 등에서 「광주사랑의열매」 또는 「광주사회복지공동모금회」로 검색</p>
                                        <p class="how-to-txt">주차는 지하주차장만 이용가능(B1~B3)</p>
                                    </div> -->
                                    <div class="how-to-section">
                                        <i class="sprite-map-4"></i>
                                        <p class="heading-title-b">택시를 이용하실 경우</p>
                                        <p class="sb-contents-tit">전남매일에서 하차 </p>
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

