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
                                        <div class="img-box"><img src="/common/img/contents/group_info_img10.png" alt=""></div>
                                    </div>
                                    <div class="text-area">
                                        <p class="txt-big-a">1998년 5월 13일</p>
                                        <p class="txt-basic-a">차흥봉 전 보건복지부장관을 설립위원장으로 하는 5인의 설립준비위원회가 발족하면서 시작됐다. 설립준비위원회는 정관 초안과 이사진 구성안을 마련하고, 7월 21일 열린 제2차 회의와 11월 16일에 열린 제3차 회의를 통해 정관과 제 규정 및 이사선임을 확정하여, 박수복 춘천상공회의소 회장을 초대회장으로 선임했다. 그리고 12월 17일 강원도공동모금회는 창립이사회와 초대회장의 취임식을 갖고 본격 출범했다. <br><br>

                                        1999년 4월 30일 새로 발효된 사회복지공동모금회법에 따라 법인을 해산하고, ‘사회복지공동모금회 강원도지회’(이하 강원지회)로 전환되어 공동모금회 사업을 이어가게 되는데 새로운 조직체계의 도입과 정비과정을 거치면서 강원지회의 모금 및 배분사업은 점차 활성화하고 발전했다. <br><br>

                                        이에 강원도사회복지공동모금회는 강원도민의 자발적 성금으로 공동모금된 재원을 효율적으로 관리/운용함으로써 사회복지 증진에 이바지하므로 강원도 사회복지를 도민 스스로의 힘으로 해결할 수 있는 기초를 마련하고 성금 사용의 투명성과 효율성을 확보하여 대표적인 모금 및 배분의 전문기관으로 성장하게 되었다.</p>
                                    </div>
                                </div>

                                <div class="group-infobox">
                                    <div class="tb-type_a">
                                        <table summary="조직운영체계 및 현황 정보">
                                            <caption>조직운영체계 및 현황 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row">조직운영체계 및 <br>현황</th>
                                                <td>지회장을 중심으로 강원도지사를 명예회장으로 추대하고 있으며, 지회 운영에 관한 주요사항을 의결하는 운영위원회와 산하의 분과실행위원회, 사업과 회계를 점검하는 감사, 업무 전반을 관리하는 사무국이 핵심적인 운영체계를 이루고 있다.</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <h4 class="title-heading_a mg-t-m">주요사업현황</h4>
                                        <table summary="모금 , 배분 정보">
                                            <caption>모금 , 배분 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row">모금 </th>
                                                <td>- 산불, 태풍, 수해이재민 돕기 성금 모금 <br>
                                                - 연말 이웃돕기 성금 캠페인 모금 <br>
                                                - 사랑의 쌀보내기 모금운동, 어려운농촌돕기 모금운동, 시민서로돕기 원주1004 모금, 나눔의문화운동 등</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">배분</th>
                                                <td>- 난치병어린이 지원사업 <br>
                                                - 저소득층 생계비 및 의료비지원사업 <br>
                                                - 재가복지차량 및 이동목욕차량 지원사업 <br>
                                                - 사회복지시설 및 기관/단체에 사업비 및 장비구입비 지원 <br>
                                                - 산불, 태풍, 수해이재민 긴급생계비 및 복구비 지원 <br>
                                                - 지역의 사회복지 실현을 위한 다양한 지원등
                                                </td>
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
                                <h4 class="heading-title-b mg-t-sm">사랑의열매 강원 사회복지공동모금회</h4>
                                <p class="map-adress">
                                    <i class="sprite-map-1"></i>
                                    (24239)강원도 춘천시 수변공원길 11, 2동 201호 <br>
                                    대표번호 : 033) 244-1661  대표팩스 : 033) 244-1688
                                </p>
<!--                                 <div class="btn-area-r mg-t-s"> -->
<!--                                     <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                 </div> -->
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div class="map-area">
                                    <div id="daumRoughmapContainer1569831908279" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                </div>
                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1569831908279",
                                        "key" : "v8sa",
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
