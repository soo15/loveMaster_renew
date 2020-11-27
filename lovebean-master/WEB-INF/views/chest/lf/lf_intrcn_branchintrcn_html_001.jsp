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
                            <button type="button" class="ui-tab-btn" id ="btn0" title="소개" onclick="javascript:goTabDisplay(0);"><i>소개</i></button>
                            <button type="button" class="ui-tab-btn" id ="btn1" title="찾아오시는길" onclick="javascript:goTabDisplay(1);"><i>찾아오시는길</i></button>
                        </div>
                        <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                            <!-- S : 소개 -->
                            <section class="ui-tab-pnl" id ="pnl0" >
                                <div class="tab-contents">
                                    <div class="img-with-txt mg-t-sm">
                                        <div class="text-area">
                                            <p class="txt-big-a">사랑의열매 사회복지공동모금회는</p>
                                            <p class="txt-basic-a">공동모금제도를 활용하여 다양한 이해관계자들과 파트너십을 이루어 사회변화를 추구하는 국민 모두의 기관입니다.<br>
                                            사랑의열매는 어려운 이웃에 희망을 전하고자 『사회복지공동모금회법』에 따라 1998년 설립된 법정 전문모금•배분기관
                                            입니다. 전국 광역자치단체별로 지회를 두어 각 지역에서 모금된 성금 은 해당 지역의 복지 사업에 사용하고 있습니다.</p>
                                            <div class="btn-area-r">
                                                <!-- a class="btn-base-line small" onclick="javascript:gf_genFileExport(this);">사회복지공동모금회 법과정관</a-->
                                                <button type="button" class="btn-base-line small" onclick="gf_genFileExport(this);">사회복지공동모금회 법과정관</button>
                                                <input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}' escapeXml='false' />" />
                                                <input id="phycFileNm" name="phycFileNm" type="hidden" value="사회복지공동모금회법과정관.pdf" />
                                                <input id="logcFileNm" name="logcFileNm" type="hidden" value="사회복지공동모금회법과정관.pdf" />
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <h4 class="title-heading_a mg-t-m">사랑의열매 비전2030 체계도 </h4>
                                    <div class="group-infobox">
                                        <div class="tb-type_a">
                                            <table>
                                                <caption><p>사랑의열매 비전2030 체계도  정보입니다.</p></caption>
                                                <colgroup>
                                                    <col class="col-w01">
                                                    <col>
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row">미션</th>
                                                    <td>나눔으로 하나되는 행복한 세상</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">비전</th>
                                                    <td>함께 따뜻한 세상을 만드는 사랑의열매</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">전략방향</th>
                                                    <td> 참여, 신뢰, 소통, 혁신으로 나눔의 사회적 가치 확산</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="wide-scroll">
                                                <table class="side-line">
                                                   <caption><p>사회복지공동모금회 전략목표 정보입니다.</p></caption>
                                                    <colgroup>
                                                        <col class="col-w01">
                                                        <col class="col-w03">
                                                        <col>
                                                        <col class="col-w03">
                                                        <col class="col-w03">
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th scope="col" class="th-point">전략목표</th>
                                                        <th scope="col">1. 나눔참여 인프라 확대</th>
                                                        <th scope="col">2. 사회문제 해결 및 사회성과 제시 강화 </th>
                                                        <th scope="col">3. 건강한 거버넌스 구축</th>
                                                        <th scope="col">4. 변화 주도 조직 운영</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <th scope="row" rowspan="5" class="th-point no_line">전략과제</th>
                                                        <td>지역사회나눔생태계 육성 <br>[5대 혁신과제]</td>
                                                        <td>의제기반사회문제 해결 강화 <br>[5대 혁신과제]  </td>
                                                        <td>배분의 파트너십 강화</td>
                                                        <td>지정기탁 혁신</td>
                                                    </tr>
                                                    <tr>
                                                        <td>협력적 기부문화 조성</td>
                                                        <td>새로운 사회변화 신속대응</td>
                                                        <td>임원구성의다양성 제고</td>
                                                        <td>디지털조직으로 변화</td>
                                                    </tr>
                                                    <tr>
                                                        <td>소액다수기부활성화 <br>[5대 혁신과제]</td>
                                                        <td>사업성과 보고 강화</td>
                                                        <td>의사결정 권한의  <br>분산 및 독립성 강화</td>
                                                        <td>지역중심사업체계 구축</td>
                                                    </tr>
                                                    <tr>
                                                        <td>나눔관련정책개발 강화</td>
                                                        <td>배분 영역의 확대 </td>
                                                        <td>시민 참여 활성화 <br>[5대 혁신과제]</td>
                                                        <td>업무 효율성 증대 </td>
                                                    </tr>
                                                    <tr>
                                                        <td>나눔관련R&amp;D 강화</td>
                                                        <td>배분 행정의 혁신 <br>[5대 혁신과제]</td>
                                                        <td>의사결정 공개  확대</td>
                                                        <td>조직 및 인적 역량 강화</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <table summary="운영원리">
                                                <caption>운영원리 정보입니다.</caption>
                                                <colgroup>
                                                    <col class="col-w01">
                                                    <col>
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row">운영원리</th>
                                                    <td>참여와 권한의 분산, 자율성과 사회적 책무성, 투명성과 공개성, 신뢰와 협력</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div> -->
                                    
                                    <!--변경  200924 -->
                                    <div class="vision">
                                            <div class="inner">
                                                <div class="sub_tit">
                                                    <strong>사랑의열매 비전2030 체계도</strong>
                                                </div>
                                                <ul>
                                                    <li>
                                                        <div class="txt_wrap">
                                                            <em>미션</em>
                                                            <strong>"나눔으로&nbsp;&nbsp;<br>
                                                                &nbsp;&nbsp;하나 되는&nbsp;&nbsp;<br>
                                                                <span>&nbsp;&nbsp;&nbsp;행복한 세상</span>"&nbsp;</strong>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="txt_wrap">
                                                            <em>비전</em>
                                                            <strong><span>함께 따뜻한 세상을</span><br>만드는 <br>
                                                                사랑의열매</strong>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="txt_wrap">
                                                            <em>전략방향</em>
                                                            <strong><span>참여, 신뢰, 소통,</span><br>혁신으로
                                                                <br>
                                                                나눔의 사회적<br>
                                                                가치확산</strong>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="vision__strategys">
                                                <h3>전략목표</h3>
                                                <ul>
                                                    <li>
                                                        <p>1</p>
                                                        <em class="icon1"></em>
                                                        <strong>나눔 참여<br />
                                                            인프라 확대</strong>
                                                    </li>
                                                    <li>
                                                        <p>전략과제</p>
                                                        <p class="bold">· 지역사회나눔생태계 육성<br />
                                                            [ 5대 혁신과제 ]</p>
                                                        <p>· 협력적 기부문화 조성</p>
                                                        <p class="bold">· 소액다수기부활성화<br />
                                                            [ 5대 혁신과제 ]</p>
                                                        <p>· 나눔관련정책개발 강화</p>
                                                        <p>· 나눔관련R&D 강화</p>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li>
                                                        <p>2</p>
                                                        <em class="icon2"></em>
                                                        <strong>사회문제 해결 및<br />
                                                            사회성과 제시강화</strong>
                                                    </li>
                                                    <li>
                                                        <p>전략과제</p>
                                                        <p class="bold">· 의제기반사회문제 해결&nbsp;강화<br />
                                                            [ 5대 혁신과제 ]</p>
                                                        <p>· 새로운 사회변화 신속대응</p>
                                                        <p>· 사업성과 보고 강화</p>
                                                        <p>· 배분 영역의 확대</p>
                                                        <p class="bold">· 배분 행정의 혁신<br />
                                                            [ 5대 혁신과제 ]</p>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li>
                                                        <p>3</p>
                                                        <em class="icon3"></em>
                                                        <strong>건강한 거버넌스<br />
                                                            구축</strong>
                                                    </li>
                                                    <li>
                                                        <p>전략과제</p>
                                                        <p>· 배분의 파트너십 강화</p>
                                                        <p>· 임원구성의다양성 제고</p>
                                                        <p>· 의사결정 권한의 분산 및
                                                            독립성 강화</p>
                                                        <p class="bold">· 시민 참여 활성화<br />
                                                            [5대 혁신과제]</p>
                                                        <p>· 의사결정 공개 확대</p>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li>
                                                        <p>4</p>
                                                        <em class="icon4"></em>
                                                        <strong>변화 주도 조직<br />
                                                            운영</strong>
                                                    </li>
                                                    <li>
                                                        <p>전략과제</p>
                                                        <p>· 지정기탁 혁신</p>
                                                        <p>· 디지털조직으로 변화</p>
                                                        <p>· 지역중심사업체계 구축</p>
                                                        <p>· 업무 효율성 증대</p>
                                                        <p>· 조직 및 인적 역량 강화</p>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div>
                                                <ul class="vision__principle">
                                                    <h3>운영원리</h3>
                                                    <li>
                                                        <em class="icon1"></em>
                                                        <strong>참여와 권한의 분산</strong>
                                                    </li>
                                                    <li>
                                                        <em class="icon2"></em>
                                                        <strong>자율성과 사회적 책무성</strong>
                                                    </li>
                                                    <li>
                                                        <em class="icon3"></em>
                                                        <strong>투명성과 공개성</strong>
                                                    </li>
                                                    <li>
                                                        <em class="icon4"></em>
                                                        <strong>신뢰와 협력</strong>
                                                    </li>
                                                </ul>

                                            </div>

                                        </div>
                                    <!--//  -->
                                </div>
                            </section>
                            <!-- E : 소개 -->
                            <!-- S : 찾아오시는길 -->
                            <section class="ui-tab-pnl" id ="pnl1">
                                <div class="tab-contents">
                                    <h4 class="heading-title-b mg-t-sm">사랑의열매 사회복지공동모금회</h4>
                                    <p class="map-adress">
                                        <i class="sprite-map-1"></i>
                                        (100-120) 서울시 중구 정동 1-17번지 사랑의열매회관 6층<br>
                                        대표번호 : 02) 6262-3000  대표팩스 : 02) 6262-3100
                                    </p>
<!--                                     <div class="btn-area-r mg-t-s"> -->
<!--                                         <button type="button" class="btn-base-bline small">프린트</button> -->
<!--                                     </div> -->
                                    <!-- * 카카오맵 - 지도퍼가기 -->
                                    <!-- 1. 지도 노드 -->
                                    <div class="map-area">
                                        <div id="daumRoughmapContainer1569036493600" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                                    </div>
                                    <!--
                                        2. 설치 스크립트
                                        * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                    -->
                                    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                                    <!-- 3. 실행 스크립트 -->
                                    <script charset="UTF-8">
                                        new daum.roughmap.Lander({
                                            "timestamp" : "1569036493600",
                                            "key" : "v4sh",
                                            "mapHeight" : "500"
                                        }).render();
                                    </script>
                                    <div class="how-to">
                                        <div class="how-to-section">
                                            <i class="sprite-map-2"></i>
                                            <p class="heading-title-b">버스를 이용하실 경우</p>
                                            <p class="sb-contents-tit">세종문화회관 하차</p>
                                            <p class="how-to-txt">광화문 사거리 하차 시 동화면세점 방향으로 전방 15미터 이동 후 홀리스커피전문점 골목으로 30미터 전방</p>
                                            <p class="sb-contents-tit">세종문화회관 정류소 이용 가능한 버스 번호</p>
                                            <dl class="how-to-dl">
                                                <dt>좌석 :</dt>
                                                <dd>1005-5, 5500, 5500-1, 5500-2, 9001</dd>
                                                <dt>간선 :</dt>
                                                <dd>103, 109, 150, 401, 402, 406, 704</dd>
                                                <dt>지선 :</dt>
                                                <dd>1711, 4012, 7016, 7018, 7022, 7023</dd>
                                                <dt>광역 :</dt>
                                                <dd>9400, 9401, 9411, 9600, 9602, 9706, 9708, 9710, 9713, 9301</dd>
                                            </dl>
                                            <p class="sb-contents-tit">광화문 사거리 하차</p>
                                            <p class="how-to-txt">광화문 사거리 하차 시 동화면세점 방향으로 전방 15미터 이동 후 홀리스커피전문점 골목으로 30미터 전방</p>
                                            <p class="sb-contents-tit">세종문화회관 정류소 이용 가능한 버스 번호</p>
                                            <dl class="how-to-dl">
                                                <dt>좌석 :</dt>
                                                <dd>1000, 1000-1, 1200, 5000, 1002, 631</dd>
                                                <dt>간선 :</dt>
                                                <dd>161, 260, 270, 271, 273, 370, 470, 471, 600, 602,702, 720, 721</dd>
                                                <dt>지선 :</dt>
                                                <dd>7019</dd>
                                                <dt>광역 :</dt>
                                                <dd>9701, 9702, 9301, 9600, 9704, 9706, 9708, 9709, 9713</dd>
                                            </dl>
                                        </div>

                                        <div class="how-to-section">
                                            <i class="sprite-map-3"></i>
                                            <p class="heading-title-b">지하철을 이용하실 경우</p>
                                            <p class="sb-contents-tit">5호선 광화문역 6번출구</p>
                                            <p class="how-to-txt">동화면세점 방향으로 전방 30미터 이동 후 홀리스커피전문점 골목으로 30미터 전방</p>
                                            <p class="sb-contents-tit">1호선 시청역 3번출구</p>
                                            <p class="how-to-txt">서울시의회 방향으로 50미터 직진후 왼쪽 골목으로 70미터 직진</p>
                                            <p class="sb-contents-tit">2호선 시청역 12번출구 </p>
                                            <p class="how-to-txt">서울시의회 방향으로 250미터 직진후 왼쪽 골목으로 70미터 직진</p>
                                        </div>

                                        <div class="how-to-section">
                                            <i class="sprite-map-4"></i>
                                            <p class="heading-title-b">자동차를 이용하실 경우</p>
                                            <p class="sb-contents-tit">광화문 사거리 하차</p>
                                            <p class="how-to-txt">광화문 사거리 하차 시 동화면세점 방향으로 전방 15미터 이동 후 홀리스커피전문점 골목으로 30미터 전방</p>
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
 

