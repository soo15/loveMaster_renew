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
                                            <div class="img-box"><img src="/common/img/contents/group_info_img03.png" alt=""></div>
                                        </div>
                                        <div class="text-area">
                                            <p class="txt-big-a">사회복지공동모금회는</p>
                                            <p class="txt-basic-a">이웃과 더불어 나누는 기쁨을, 어려운 이웃에게 희망을 주기위해 1998년 설립된 법정민간단체입니다. 사회복지공동모금회는 기부문화의 정착 및 확산, 배분사업을 통한 민간복지 발전을 위해 노력하고 있습니다. 부산사회복지공동모금회는 전국 17개 지회 중 하나로 연말집중캠페인을 비롯하여 연중 ARS, 사랑의 계좌, 기업기부, 직장모금, 협약모금 등 다양한 기부활동을 펼치고 있으며 부산시민의 따뜻한 이웃사랑을 통해 연간 123억원 이상의 성금을 모금하고 있습니다. <br><br>
                                            또한 공정하고 투명한 배분을 위해 경제계, 언론계, 종교계, 노동계, 사회복지계, 사회단체 등 각계의 전문가로 구성된 기획홍보분과위원회와 배분분과위원회의 심의를 거쳐 ‘저소득 시민 생계비 및 의료비 지원사업’, ‘사랑의 집고치기 지원사업’, ‘외국인 노동자 지원 사업’ 등 소외된 이웃과 취약한 사회복지사업을 위해 지난 한해 약 170억원을 지원하였습니다. <br><br>
                                            부산시민여러분께 이웃과 사랑을 나누는 기쁨을 안겨주고, 지역사회의 복지사각지대에 놓인 소외된 이웃에게는 다시 시작할 수 있는 용기와 희망을 주기 위해 항상 최선을 다하겠습니다. </p>
                                        </div>
                                    </div>
                                    <div class="group-infobox">
                                        <div class="tb-type_a">
                                            <table summary="공동모금회">
                                                <caption>공동모금회 정보입니다.</caption>
                                                <colgroup>
                                                    <col class="col-w01">
                                                    <col>
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row">공동모금회는</th>
                                                    <td>- 모든 시민이 함께 할 수 있도록 노력합니다. <br>
                                                    - 일상생활 속에서도 누구든지 쉽게 이웃을 돕는 캠페인을 펼칩니다. <br>
                                                    - 새로운 모금방법을 도입해 더 많은 성금이 모이도록 노력합니다. <br>
                                                    - 공정하고 투명하게 성금이 나누어질 수 있도록 노력합니다. <br>
                                                    - 민간뿐만 아니라 공공복지 부분의 발전을 이끌어 내고 있습니다.
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
                            <section class="ui-tab-pnl"  id="pnl1">
                                <div class="tab-contents">
                                    <h4 class="heading-title-b mg-t-sm">사랑의열매 부산사회복지공동모금회</h4>
                                    <p class="map-adress">
                                        <i class="sprite-map-1"></i>
                                        (601-738)부산광역시 동구 중앙대로 365, 부산일보사6층 사회복지공동모금회 부산지회 <br>
                                        대표번호 : 051) 790-1414  대표팩스 : 051) 441-9425
                                    </p>
<!--                                     <div class="btn-area-r mg-t-s"> -->
<!--                                         <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                     </div> -->
                                    <!-- * 카카오맵 - 지도퍼가기 -->
                                    <!-- 1. 지도 노드 -->
                                    <div class="map-area">
                                        <div id="daumRoughmapContainer1569822537995" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                    </div>
                                    <!--
                                        2. 설치 스크립트
                                        * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                    -->
                                    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                    <!-- 3. 실행 스크립트 -->
                                    <script charset="UTF-8">
                                        new daum.roughmap.Lander({
                                            "timestamp" : "1569822537995",
                                            "key" : "v8gx",
                                            "mapHeight" : "500"
                                        }).render();
                                    </script>
                                    <div class="how-to">
                                        <div class="how-to-section">
                                            <i class="sprite-map-2"></i>
                                            <p class="heading-title-b">버스를 이용하실 경우</p>
                                            <p class="sb-contents-tit">부산진역 정류소</p>
                                            <p class="sb-contents-tit">부산진역 정류소 이용 가능한 버스 번호</p>
                                            <dl class="how-to-dl">
                                                <dt>좌석 :</dt>
                                                <dd>239, 240, 302, 305, 306, 42, 52-1, 98</dd>
                                                <dt>일반 :</dt>
                                                <dd>101, 101-1, 103, 134, 135, 139, 140, 167, 17, 17-1, 2, 22 26, 27, 35, 40, 41, 43, 52, 55, 59-1, 61, 67, 81, 82, 85, 88 89</dd>
                                            </dl>
                                        </div>

                                        <div class="how-to-section">
                                            <i class="sprite-map-3"></i>
                                            <p class="heading-title-b">지하철을 이용하실 경우</p>
                                            <p class="sb-contents-tit">지하철 부산진역 하차</p>
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
