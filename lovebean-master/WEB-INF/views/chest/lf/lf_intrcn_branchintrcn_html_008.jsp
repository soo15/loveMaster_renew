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
                                        <div class="img-box"><img src="/common/img/contents/group_info_img08.png" alt=""></div>
                                    </div>
                                    <div class="text-area">
                                        <p class="txt-big-a">울산사회복지공동모금회는</p>
                                        <p class="txt-basic-a">우리나라 국가공업단지의 발상지며, 산업역군의 도시에 1998년 7월 29일에 설립되었습니다. 울산지역 6개 언론단체가 공동으로 모금사업을 전개하여 상호간의 시너지 효과를 극대화하는 “공동모금·공동홍보” 시스템을 갖추고 있는 대표적인 모금기관입니다. <br><br>

                                        이웃사랑캠페인을 통하여 울산시민 참여 유도 및 기업모금 활성화에 노력하여 울산시민분들에게는 이웃과 사랑을 나누는 기쁨을 안겨주고, 배분사업의 구체적인 소개를 통해 지역사회의 복지사각지대 해소에 주력하고 있으며, 저소득층의 긴급 지원사업을 확대하여, 어려운 이웃에게는 다시 시작할 수 있는 용기와 희망을 주기 위해 노력하고 있습니다.<br><br>

                                        앞으로 울산사회복지공동모금회는 신뢰성과 공정성, 소통과 참여로 울산 시민분들게 이웃사랑을 전하며 사회적 책무성을 이행하는 기관이 되겠습니다.<br><br>

                                        감사합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 소개 -->
                        <!-- S : 찾아오시는길 -->
                        <section class="ui-tab-pnl" id="pnl1">
                            <div class="tab-contents">
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 울산 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    (44629) 울산광역시 남구 북부순환도로 45(무거동 220-5) / 무거타워펠리스 5층<br>
                                    대표번호 : 052) 270-9000  대표팩스 : 052) 270-9009
                                </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                    <div id="daumRoughmapContainer1569829714263" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1569829714263",
                                        "key" : "v8pu",
                                        "mapHeight" : "500"
                                    }).render();
                                </script>
                                <div class="how-to">
                                    <div class="how-to-section">
                                        <i class="sprite-map-2"></i>
                                        <p class="heading-title-b">버스를 이용하실 경우</p>
                                        <p class="sb-contents-tit">울산공항에서 신복로타리방향</p>
                                        <dl class="how-to-dl">
                                            <dt>좌석 :</dt>
                                            <dd>1127</dd>
                                            <dt>일반 :</dt>
                                            <dd>103, 109, 150, 401, 402, 406, 704</dd>
                                        </dl>
                                        <p class="sb-contents-tit">울산역에서 신복로타리방향</p>
                                        <dl class="how-to-dl">
                                            <dt>급행 :</dt>
                                            <dd>5001, 5004</dd>
                                            <dt>일반 :</dt>
                                            <dd>807, 304, 307, 357, 104, 114</dd>
                                        </dl>
                                        <p class="sb-contents-tit">울산역에서 신복로타리방향</p>
                                        <dl class="how-to-dl">
                                            <dt>좌석 :</dt>
                                            <dd>401, 1713, 1723</dd>
                                            <dt>일반 :</dt>
                                            <dd>24, 134, 217, 307, 327, 357, 401, 728, 733, 807, 817</dd>
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

