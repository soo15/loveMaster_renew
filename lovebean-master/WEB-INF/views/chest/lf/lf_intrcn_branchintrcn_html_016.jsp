
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
                                        <div class="img-box"><img src="/common/img/contents/group_info_img16.png" alt=""></div>
                                    </div>
                                    <div class="text-area">
                                        <p class="txt-basic-a">감사원에서 이웃돕기 성금을</p>
                                        <p class="txt-basic-a">민간이 자율적 복지 참여와 운영으로 전환시킴이 바람직하다는 의견이 처음 제시된 후 정부에서는 공동모금회 설립을 위해 1997년 3월 27일(법률5317호) 사회복지공동모금법을 제정하였고, 1998년 2월 2일(대통령, 보건복지부령) 사회복지공동모금법 시행령을 공포하였습니다. 이에 정부의 주도로 추진해 오던 이웃돕기 성금모금의 관리 운영을 지양하고 사회복지에 관한 도민의 이해와 참여의 촉진과 도민의 자발적인 성금으로 공동모금된 재원을 효율적으로 관리, 운용하기 위하여 경상남도사회복지공동모금회는 1998년 7월 29일 설립되었습니다. <br><br>

                                        “사랑의 열매”를 통한 모금사업을 수행하고 있는 사회복지공동모금회는 타모금기관과 달리 특정 기관이나 종교에 제한하지 않고 전국의 모든 사회복지기관과 시민단체들을 지원한다는 포괄성과 공정성을 중시하는 기관으로 그 공익성을 인정받아 1999년 1월부터 「조세특례제한법」에 의해 기부금 전액의 손금산입이 가능한 유일한 민간 사회복지법인으로 우리나라의 기부문화 확대와 기업의 사회복지 참여 활성화에 전력하고 있습니다. <br><br>

                                        우리나라 사회복지기관들은 지역사회의 욕구와 그 많은 수를 충분히 알고 있음에도 불구하고 자원의 부족으로 기관 및 사업에 대한 홍보나 사업 확장을 하지 못하고 있습니다. 이런 안타까움을 줄이기 위해 경상남도사회복지공동모금회는 전문적으로 모금활동을 하고 그 과정에서 각 사회복지사업을 전국민에게 알려 도움이 필요한 어려운 이웃들에게 필요한 서비스를 연결, 자원이 부족한 기관에 모금액을 전달하기 위하여 생겨났습니다.</p>
                                    </div>
                                </div>
                                <div class="group-infobox">
                                    <div class="tb-type_a">
                                        <table summary="공동모금회 정보">
                                            <caption>공동모금회 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row">공동모금회의 역할</th>
                                                <td>전국 사회복지기관 및 소외된 이웃과 사회복지분야 발굴 및 지원 <br>
                                                시민들에게 공동체 의식과 나눔문화 홍보<br>
                                                기부문화 선진화 및 생활화 캠페인 추진<br>
                                                선진 모금프로그램 개발<br>
                                                배분의 투명성, 전문성 확보에 진력</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 소개 -->
                        <!-- S : 찾아오시는길 -->
                        <section class="ui-tab-pnl" id="pnl1">
                            <div class="tab-contents">
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 경남 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    (51410)경상남도 창원시 의창구 충혼로 91 창원문성대학 제7호관 4층 경남사회복지공동모금회 <br>
                                    대표번호 : 055) 270-6700  대표팩스 : 055) 270-6702~3
                                    </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                    <div id="daumRoughmapContainer1569905549328" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1569905549328",
                                        "key" : "v9ah",
                                        "mapHeight" : "500"
                                    }).render();
                                </script>
                                <div class="how-to">
                                    <div class="how-to-section">
                                        <i class="sprite-map-2"></i>
                                        <p class="heading-title-b">버스를 이용하실 경우</p>
                                        <p class="sb-contents-tit">문성고교 앞 하차</p>
                                        <p class="sb-contents-tit">문성고교 앞 정류소 이용 가능한 버스 번호</p>
                                        <dl class="how-to-dl">
                                            <dt>직행 :</dt>
                                            <dd>703, 710, 751, 757</dd>
                                            <dt>일반 :</dt>
                                            <dd>102, 103, 109, 113, 155, 212, 220, 221, 506</dd>
                                        </dl>
                                        <p class="sb-contents-tit">창원전문대학(문성대학) 앞 하차</p>
                                        <p class="sb-contents-tit">창원전문대학(문성대학) 앞 정류소 이용 가능한 버스 번호</p>
                                        <dl class="how-to-dl">
                                            <dt>직행 :</dt>
                                            <dd>704</dd>
                                            <dt>일반 :</dt>
                                            <dd>10, 11, 12, 13, 14, 30, 31, 32, 34, 35, 58, 59, 101, 111, 116, 213, 216, 502</dd>
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

