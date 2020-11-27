<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
        
        goTabDisplay(0);

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
                <h3><strong>함께하는 사람들</strong><span>나누는 기쁨, 희망과 행복 - 사랑의열매를 소개합니다.</span></h3>
                <div class="contents-menu-nav">
                </div>
            </div>

            <div class="seo-box">
                <div class="ui-tab ui-tab-type2 col-4 contents-tab" id="uiTabCCKI12_1">
                    <div class="ui-tab-btns" btn-id="uiTabCCKI12_1">
                        <button type="button" class="ui-tab-btn" id ="btn0" onclick="javascript:goTabDisplay(0);"><i>조직도</i></button>
                        <button type="button" class="ui-tab-btn" id ="btn1" onclick="javascript:goTabDisplay(1);"><i>회장</i></button>
                        <button type="button" class="ui-tab-btn" id ="btn2" onclick="javascript:goTabDisplay(2);"><i>운영위원회</i></button>
                        <button type="button" class="ui-tab-btn" id ="btn3" onclick="javascript:goTabDisplay(3);"><i>분과실행위원회</i></button>
                    </div>
                    <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                        <!-- S : 조직도 -->
                        <section class="ui-tab-pnl" id ="pnl0" >
                            <div class="tab-contents">
                                <div class="group-imgbox"><img src="/common/img/contents/group_img13.jpg" alt=""></div>
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">서영숙</dt>
                                        <dd class="fake-table-td">
                                            <p>운영 총괄</p>
                                            <p><i class="sprite-group-tel"></i>063-282-0606</p>
                                            <!-- <p><i class="sprite-group-mail"></i>sys0700@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 양효경</dt>
                                        <dd class="fake-table-td">
                                            <p>모금·홍보 총괄</p>
                                            <p><i class="sprite-group-tel"></i>063-282-0606</p>
                                           <!--  <p><i class="sprite-group-mail"></i>eomji0122@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 박수미</dt>
                                        <dd class="fake-table-td">
                                            <p>아너소사이어티,기업사회공헌,학교모금,
											사랑의열매봉사단,집중모금캠페인추진,
											담당지역(협의체/기관배분)-정읍시,남원시,순창군</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0635</p>
                                            <!-- <p><i class="sprite-group-mail"></i>sumisumi@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 김유리</dt>
                                        <dd class="fake-table-td">
                                            <p>나눔리더 및 나눔리더스클럽,
나눔명문기업,
희망자산나눔 및 착한권리나눔,
언론사모금,
지정기탁사업 평가,
담당지역(협의체/기관배분)-전라북도,전주시,고창군,김제시,임실군,부안군</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0639</p>
                                           <!--  <p><i class="sprite-group-mail"></i>kyul0311@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 정서연</dt>
                                        <dd class="fake-table-td">
                                            <p>연합모금사업,
모금통계 관리,
유공자시상식,
착한가정, 착한가게, 착한일터,
정기기부자 관리 및 온라인모금,
담당지역(협의체/기관배분)-군산시</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0638</p>
                                           <!--  <p><i class="sprite-group-mail"></i>jsy0606@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 류하일</dt>
                                        <dd class="fake-table-td">
                                            <p>지정기탁 개인지원(14개 시군 전체),홍보,
담당지역(협의체/기관배분)-완주군,무주군,진안군,장수군</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0251</p>
                                           <!--  <p><i class="sprite-group-mail"></i>hiryu@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 윤애슬</dt>
                                        <dd class="fake-table-td">
                                            <p>현물기부(14개 시군 전체),모금함모금,이벤트모금,자원봉사자관리
담당지역(협의체/기관배분)-익산시</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0634</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yas@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">경영관리/배분사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 이은영</dt>
                                        <dd class="fake-table-td">
                                            <p>배분·경영 총괄</p>
                                            <p><i class="sprite-group-tel"></i>063-282-0606</p>
                                            <!-- <p><i class="sprite-group-mail"></i>sensuous@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 곽만희</dt>
                                        <dd class="fake-table-td">
                                            <p>경영관리, 총무‧회계 전반</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0637</p>
                                            <!-- <p><i class="sprite-group-mail"></i>azzie38317@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 구성모</dt>
                                        <dd class="fake-table-td">
                                            <p>신청사업,기획사업(전국기획,가계금융역량강화,저소득보훈세대,집수리지원 등)</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0252</p>
                                           <!--  <p><i class="sprite-group-mail"></i>momo@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 송샛별</dt>
                                        <dd class="fake-table-td">
                                            <p>긴급지원사업,기획사업(개인월동난방비,주민조직화,차량지원,명절지원,연합모금지원 등)</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0253</p>
                                           <!--  <p><i class="sprite-group-mail"></i>ssongsae@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 조혜인</dt>
                                        <dd class="fake-table-td">
                                            <p>복권기금사업(사회복지기관),
기획사업(사회복지기관, 지역연계현안지원)</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0255</p>
                                            <!-- <p><i class="sprite-group-mail"></i>alwm2112@chest.or.kr</p> -->
                                        </dd>
                                        <!-- <dt class="fake-table-th">주임 이은선</dt>
                                        <dd class="fake-table-td">
                                            <p>복권기금사업(사회복지기관), 기획사업(사회복지기관)</p>
                                            <p><i class="sprite-group-tel"></i>063-903-0255</p>
                                            <p><i class="sprite-group-mail"></i>kindsun@chest.or.kr</p>
                                        </dd> -->
                                    </dl>
                                </div>
                            </div>
                        </section>
                        <!-- E : 조직도 -->
                        <!-- S : 회장 -->
                        <section class="ui-tab-pnl" id ="pnl1" >
                            <div class="tab-contents">
                                <div class="person-area">
                                    <div class="person-item">
                                        <div class="person-col-tit">
                                            <p class="person-position">제10대 회장</p>
                                            <p class="person-time">2018.05.15 ~ 현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_13.jpg" alt="김동수 프로필 이미지"></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">김동수</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <div class="person-profile-item">
                                                    <ul>
                                                        <li>법무부 법사랑위원 군산·익산지역연합회 회장</li>
                                                        <li>군산상공회의소 회장</li>
                                                        <li>동우문화재단 이사장</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
<!--                                     <div class="btn-area mg-t-l"> -->
<!--                                         <a href="" class="btn-base-imp">역대회장</a> -->
<!--                                     </div> -->
                                </div>
                            </div>
                        </section>
                        <!-- E : 회장 -->
                        <!-- S : 운영위원회 -->
                        <section class="ui-tab-pnl" id ="pnl2" >
                            <div class="tab-contents">
                                <div class="tb-type_c mg-t-m">
                                    <table summary="회장">
                                        <caption>회장 정보입니다.</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">회장</th>
                                            <td class="td-point">김동수</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table summary="부회장">
                                        <caption>부회장 정보입니다.</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" rowspan="3" class="no-line">부회장</th>
                                            <td class="td-point">이선홍</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박완수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">신종화</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table summary="위원">
                                        <caption>위원 정보입니다.</caption>
                                        <colgroup>
                                            <col style="width:50%">
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" rowspan="5" class="no-line">위원</th>
                                            <td class="td-point">김명성</td>
                                            <td class="td-point">김성철</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김양균</td>
                                            <td class="td-point">신종연</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">오성택</td>
                                            <td class="td-point">한재현</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table summary="감사">
                                        <caption>감사 정보입니다.</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" rowspan="2" class="no-line">감사</th>
                                            <td class="td-point">김홍태</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이한구</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <!-- E : 운영위원회 -->
                        <!-- S : 분과실행위원회 -->
                        <section class="ui-tab-pnl" id ="pnl3" >
                            <div class="tab-contents">
                                <h4 class="title-heading_a mg-t-m">배분분과 실행위원회</h4>
                                <div class="tb-type_c">
                                    <table summary="배분분과 실행위원회">
                                        <caption>배분분과 실행위원회 정보입니다.</caption>
                                        <colgroup>
                                            <col style="width:50%">
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td colspan="2" class="td-point">신종화</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="2">부위원장</th>
                                            <td colspan="2" class="td-point">이원식</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="td-point">이해경</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="5">위원</th>
                                            <td class="td-point">고승훈</td>
                                            <td class="td-point">김광혁</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김보금</td>
                                            <td class="td-point">김웅수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박은아</td>
                                            <td class="td-point">박현주</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박형규</td>
                                            <td class="td-point">백옥미</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">양윤주</td>
                                            <td class="td-point">여영훈</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <h4 class="title-heading_a mg-t-m">평가지원단</h4>
                                <div class="tb-type_c">
                                    <table summary="평가지원단">
                                        <caption>평가지원단 정보입니다.</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">단장</th>
                                            <td colspan="4" class="td-point">박기언</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">부단장</th>
                                            <td colspan="4" class="td-point">김준수</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="14">단원</th>
                                            <td class="td-point">김봉규</td>
                                            <td class="td-point">서경순</td>
                                            <td class="td-point">양정인</td>
                                            <td class="td-point">임은용</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">조덕환</td>
                                            <td class="td-point">김영식</td>
                                            <td class="td-point">박광명</td>
                                            <td class="td-point">배영희</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">전길배</td>
                                            <td class="td-point">정영순</td>
                                            <td class="td-point">강명진</td>
                                            <td class="td-point">강승완</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김성윤</td>
                                            <td class="td-point">김인곤</td>
                                            <td class="td-point">박수진</td>
                                            <td class="td-point">송준</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">양상근</td>
                                            <td class="td-point">양성식</td>
                                            <td class="td-point">오정효</td>
                                            <td class="td-point">욱주일</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이미화</td>
                                            <td class="td-point">이옥자</td>
                                            <td class="td-point">장우철</td>
                                            <td class="td-point">정관일</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">최규호</td>
                                            <td colspan="3" class="td-point">최옥숙</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <!-- S : 분과실행위원회 -->
                    </div>
                </div>
            </div>
        </div>
    </main>
 
</div>
        
