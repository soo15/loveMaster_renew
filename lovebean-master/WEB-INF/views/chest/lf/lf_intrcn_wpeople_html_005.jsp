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
                            <div class="group-imgbox"><img src="/common/img/contents/group_img05.jpg" alt=""></div>

                            <h4 class="title-heading_a mg-t-l">사무처장</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">이정윤</dt>
                                    <dd class="fake-table-td">
                                        <p>사무국 운영총괄</p>
                                        <!-- <p><i class="sprite-group-mail"></i>doncome@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>

                            <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 정민주</dt>
                                    <dd class="fake-table-td">
                                        <p>경영관리, 홍보사업 총괄, 유공자포상식</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3321</p>
                                        <!-- <p><i class="sprite-group-mail"></i>keit@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김빈</dt>
                                    <dd class="fake-table-td">
                                        <p>기획, 인사, 회계, 총무</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3303</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kimbin89@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            
                            <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 손병일</dt>
                                    <dd class="fake-table-td">
                                        <p>모금사업총괄, 대외협력업무 총괄</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3311</p>
                                        <!-- <p><i class="sprite-group-mail"></i>byungil.son@chst.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">과장 김태식</dt>
                                    <dd class="fake-table-td">
                                        <p>기업사회공헌, 착한일터, 현물기부</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3312</p>
                                        <!-- <p><i class="sprite-group-mail"></i>sik8007@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">과장 최은영</dt>
                                    <dd class="fake-table-td">
                                        <p>착한가게, 부평구, 남동구, 연수구, 옹진군, 동구</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3320</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kadde@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 조우성</dt>
                                    <dd class="fake-table-td">
                                        <p>아너 소사이어티, 나눔리더, 나눔리더스클럽, 착한가정, 이벤트 모금</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3313</p>
                                        <!-- <p><i class="sprite-group-mail"></i>skekt101@chest.or.kr</p> -->
                                    </dd>
                                </dl>                                
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 강정윤</dt>
                                    <dd class="fake-table-td">
                                        <p>서구•중구•계양구•미추홀구•강화군 담당</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3317</p>
                                        <!-- <p><i class="sprite-group-mail"></i>nooni@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 최수진</dt>
                                    <dd class="fake-table-td">
                                        <p>현물 기부, 봉사단 관리, 기부자 관리</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3316</p>
                                        <!-- <p><i class="sprite-group-mail"></i>dlqhfka1009@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            

                            <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 최유미</dt>
                                    <dd class="fake-table-td">
                                        <p>배분사업 총괄, 중장기 기획사업</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3326</p>
                                        <!-- <p><i class="sprite-group-mail"></i>foryou0316@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 백수경</dt>
                                    <dd class="fake-table-td">
                                        <p>신청사업, 긴급지원사업, 기획사업, 연합모금 배분, 배분사업설명회, 회계법인 관리</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3322</p>
                                        <!-- <p><i class="sprite-group-mail"></i>breek3325@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 권지수</dt>
                                    <dd class="fake-table-td">
                                        <p>지정기탁 배분관리, 정기평가, 배분교육</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3325</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jigu1114@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">담당 이하롬</dt>
                                    <dd class="fake-table-td">
                                        <p>지역연계사업 배분관리(지역사회보장협의체)</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3307</p>
                                        <!-- <p><i class="sprite-group-mail"></i>leeharom@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">담당 서민지</dt>
                                    <dd class="fake-table-td">
                                        <p>복권기금사업, 명절지원사업(설), 배분차량관리</p>
                                        <p><i class="sprite-group-tel"></i>032-456-3327</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jigu1114@chest.or.kr</p> -->
                                    </dd>
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
                                        <p class="person-time">2020.04 ~현재 </p>
                                    </div>
                                    <div class="person-col-photo">
                                        <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_05.jpg" alt="심재선프로필 이미지"></div>
                                    </div>
                                    <div class="person-col-info">
                                        <p class="person-name">심재선</p>
                                        <div class="person-profile">
                                            <p class="person-profile-tit">[학력사항]</p>
                                            <dl class="person-profile-item">
                                                <dt>1975.2</dt>
                                                <dd>송도고등학교 졸업</dd>
                                                <dt>1979.2</dt>
                                                <dd>중앙대학교 정경대학 신문방송학과 졸업</dd>
                                            </dl>
                                            <p class="person-profile-tit">[주요활동]</p>
                                            <dl class="person-profile-item">
                                                <dt>1982.12</dt>
                                                <dd>공성운수(주) 입사</dd>
												<dt>1994~1997</dt>
                                                <dd>인천상공회의소 15~16대 의원 </dd>
												<dt>2000~2003</dt>
                                                <dd>인천상공회의소 17~18대 상임의원</dd>
												<dt>2006~현재</dt>
                                                <dd>인천상공회의소 19~23대 부회장 </dd>
												<dt>2011~2017</dt>
                                                <dd>인천사회복지공동모금회 운영위원<br>
                                                  인천사회복지공동모금회 부회장(2011.7 선임)</dd>
												<dt>2011.12</dt>
                                                <dd>아너소사이어티 67호(인천 5호)</dd>
												<dt>2016.2~2017.5</dt>
                                                <dd>인천아너소사이어티 클럽 회장</dd>
												<dt>현재</dt>
                                                <dd>법무부 법사랑위원 인천지역협의회 부회장<br>
						                                                사단법인 한국사법교육원 이사 <br>
						                                                인천화물자동차운송사업협회 이사장<br>
						                                                전국화물자동차운송사업연합회 부회장<br>
						                                                물류산업 진흥재단 이사장</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
<!--                                 <div class="btn-area mg-t-l"> -->
<!--                                     <a href="" class="btn-base-imp">역대회장</a> -->
<!--                                 </div> -->
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
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">회장</th>
                                        <td class="td-point">심재선</td>
                                        <td>(주)공성운수 대표</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table summary="부회장">
                                    <caption>부회장 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" rowspan="2" class="no-line">부회장</th>
                                        <td class="td-point">서동만</td>
                                        <td>㈜대림테크 회장/인천시 벤처기업협회 회장</td>
                                    </tr>
<!--                                     <tr> -->
<!--                                         <td class="td-point">허인애</td> -->
<!--                                         <td>우리기업 대표</td> -->
<!--                                     </tr> -->
                                    </tbody>
                                </table>
                                <table summary="분과위원장">
                                    <caption>분과위원장 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" rowspan="3" class="no-line">분과위원장</th>
                                        <td class="td-point">서동만</td>
                                        <td>㈜대림테크 회장/인천시 벤처기업협회 회장</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">권정호</td>
                                        <td>인천대학교 사회복지학과 교수</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">김의식</td>
                                        <td>단건축사무소 대표</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table summary="위원">
                                    <caption>위원 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" rowspan="11" class="no-line">위원</th>
                                        <td class="td-point">정하음</td>
                                        <td>대한전문건설협회 인천광역시회</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">김민배</td>
                                        <td>인하대학교 법학전문대학원 교수</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">김윤태</td>
                                        <td>에이비엠㈜/에이비엠홀딩스㈜ 대표</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">김정화</td>
                                        <td>법무법인 선 대표변호사</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">김형년</td>
                                        <td>인천광역시 재향군인회 회장</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">문완진</td>
                                        <td>일주건설㈜ 대표</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">박남원</td>
                                        <td>인천사랑회 수석부회장</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">박미숙</td>
                                        <td>사단법인 화도진문화원 원장</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">성용원</td>
                                        <td>인천광역시 보건복지국장</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">윤정혜</td>
                                        <td>인천재능대학교 사회복지과 부교수</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">정연용</td>
                                        <td>인천광역시교육청 교육국장</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table summary="감사">
                                    <caption>감사 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" rowspan="2" class="no-line">감사</th>
                                        <td class="td-point">정재성</td>
                                        <td>인일회계법인 이사</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">신광순</td>
                                        <td>더편한세무법인 대표</td>
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
                            <h4 class="title-heading_a mg-t-m">모금분과실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table summary="모금분과실행위원">
                                        <caption>모금분과실행위원 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">서동만</td>
                                            <td colspan="3">(주)대림테크 대표이사</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="6">위원</th>
                                            <td class="td-point">윤희택</td>
                                            <td>인천상공회의소 경제산업부 부장</td>
                                            <td class="td-point">허신욱</td>
                                            <td>인천경영자총협회 상무</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">지주현</td>
                                            <td>인천소상공인연합회 사무처장</td>
                                            <td class="td-point">김택승</td>
                                            <td>대한전문건설협회인천시회 사무처장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">황철환</td>
                                            <td>인천광역시의사회 사무처장</td>
                                            <td class="td-point">허은광</td>
                                            <td>인천문화재단 기획경영본부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박범호</td>
                                            <td>인천경영포럼 사무처장</td>
                                            <td class="td-point">박연자</td>
                                            <td>인천인성교육범국민실천연합 총괄위원장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이기설</td>
                                            <td>해안실업 대표이사</td>
                                            <td class="td-point">정석헌</td>
                                            <td>흥륜사 정토원 원장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정규성</td>
                                            <td>인천탁주 대표</td>
                                            <td class="td-point">심현영</td>
                                            <td>인천서부산업단지관리공단 전무이사</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4 class="title-heading_a mg-t-m">배분분과실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table summary="배분분과실행위원">
                                        <caption>배분분과실행위원 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">권정호</td>
                                            <td colspan="3">인천대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="8">위원</th>
                                            <td class="td-point">김세원</td>
                                            <td>인천광역시노인복지관협회장</td>
                                            <td class="td-point">김광병</td>
                                            <td>청운대학교사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김혜미</td>
                                            <td>인천대학교 사회복지학과 교수</td>
                                            <td class="td-point">고성란</td>
                                            <td>삼산종합사회복지관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">길옥연</td>
                                            <td>前)인천아동청소년그룹홈협의회장</td>
                                            <td class="td-point">조승석</td>
                                            <td>경인여자대학교 사회복지학과장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이충권</td>
                                            <td>인하대학교 사회복지학과 교수</td>
                                            <td class="td-point">유정아</td>
                                            <td>가천길과학대학 운동재활복지과교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">서봉만</td>
                                            <td>인천연구원 연구위원 </td>
                                            <td class="td-point">신선아</td>
                                            <td>인천사회복지사협회 부회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">최상회</td>
                                            <td>인천중구장애인복지관장</td>
                                            <td class="td-point">김주리</td>
                                            <td>파인트리홀 원장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">전지혜</td>
                                            <td>인천대학교 사회복지학과 교수</td>
                                            <td class="td-point">최정호</td>
                                            <td>인천여성가족재단 연구위원</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">홍현웅</td>
                                            <td colspan="3">연수구청소년수련관장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4 class="title-heading_a mg-t-m">홍보분과실행위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table summary="홍보분과실행위원">
                                        <caption>홍보분과실행위원 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">김의식</td>
                                            <td colspan="3">단건축사무소 대표</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="5">위원</th>
                                            <td class="td-point">이은경</td>
                                            <td>인천일보 사회부장</td>
                                            <td class="td-point">이재필</td>
                                            <td>씨제이헬로비전 기자</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이진호</td>
                                            <td>경인일보 사회부장</td>
                                            <td class="td-point">주춘식</td>
                                            <td>티브로드 인천보도제작국 부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">최유탁</td>
                                            <td>기호일보 편집국 사회부장</td>
                                            <td class="td-point">이범수</td>
                                            <td >중부일보 인천본사 사회부 기자</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">원태규</td>
                                            <td >NIB 남인천방송 기자</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
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
        
