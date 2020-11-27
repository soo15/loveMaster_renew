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
                        <div class="tab-contents" id ="tab0" >
                            <div class="group-imgbox"><img src="/common/img/contents/group_img03.jpg" alt=""></div>
                            
                            <h4 class="title-heading_a mg-t-l">사무처장</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">박은덕</dt>
                                    <dd class="fake-table-td">
                                        <p>사무국 운영총괄</p>
                                        <!-- <p><i class="sprite-group-mail"></i>docpe@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            
                            <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 박영희</dt>
                                    <dd class="fake-table-td">
                                        <p>경영·기획·인사관리 업무 총괄</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1409</p>
                                        <!-- <p><i class="sprite-group-mail"></i>birdfiy@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 이준현</dt>
                                    <dd class="fake-table-td">
                                        <p>회계,총무,구매 관련 업무</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1401</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jjun@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            
                            <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 이숙미</dt>
                                    <dd class="fake-table-td">
                                        <p>모금·홍보사업 총괄</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1405</p>
                                        <!-- <p><i class="sprite-group-mail"></i>smroom@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">과장 김수미</dt>
                                    <dd class="fake-table-td">
                                        <p>기업모금, 중앙전입금사업, 홍보</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1404</p>
                                        <!-- <p><i class="sprite-group-mail"></i>ksm79@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                 <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 이경훈</dt>
                                    <dd class="fake-table-td">
                                        <p>아너소사이어티, 희망자산나눔<br>특별/온라인모금, 나눔봉사단</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1477</p>
                                        <!-- <p><i class="sprite-group-mail"></i>internations@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김형주</dt>
                                    <dd class="fake-table-td">
                                        <p>지자체모금(중구,영도구,남구,사하구,강서구) 협약모금</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1407</p>
                                        <!-- <p><i class="sprite-group-mail"></i>hjoo@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 조대희</dt>
                                    <dd class="fake-table-td">
                                        <p>기업모금, 착한일터<br>나눔리더·리더스클럽</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1422</p>
                                        <!-- <p><i class="sprite-group-mail"></i>joday@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 이은경</dt>
                                    <dd class="fake-table-td">
                                        <p>미디어모금, 연합모금<br>학교모금, CRM모금, 이벤트모금</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1411</p>
                                        <!-- <p><i class="sprite-group-mail"></i>pyu556@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">주임 이한결</dt>
                                    <dd class="fake-table-td">
                                        <p>지자체모금 (부산진구,해운대구,금정구,연제구,수영구,기장군)</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1408</p>
                                        <!-- <p><i class="sprite-group-mail"></i>pyu556@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">주임 김수정</dt>
                                    <dd class="fake-table-td">
                                        <p>지자체모금(서구,동구,동래구,사상구,북구), 홍보, 착한가게, 착한가정, 기부자관리, CMS(정기기부)</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1430</p>
                                        <!-- <p><i class="sprite-group-mail"></i>sooj632@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">주임 서은애</dt>
                                    <dd class="fake-table-td">
                                        <p>현물기부, 모금함/사랑의열매 관리</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1415</p>
                                        <!-- <p><i class="sprite-group-mail"></i>smg0707@chest.or.kr </p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 전성경</dt>
                                    <dd class="fake-table-td">
                                        <p>배분사업팀 업무 총괄, 배분사업 계획 수립, 배분사업 평가 관리</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1412</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jeon@chest.or.kr </p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 강정남</dt>
                                    <dd class="fake-table-td">
                                        <p>기획사업, 특별모금사업 배분지원, 배분분과실행위원회 운영</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1410</p>
                                        <!-- <p><i class="sprite-group-mail"></i>nam@chest.or.kr </p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">주임 최선미</dt>
                                    <dd class="fake-table-td">
                                        <p>신청사업, 긴급지원, 배분사업 설명회 및 지원기관 관리, 배분사업평가지원단 운영</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1417</p>
                                        <!-- <p><i class="sprite-group-mail"></i>csm@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">주임 황보지혜</dt>
                                    <dd class="fake-table-td">
                                        <p>복권기금사업, 김순임 기금사업, 기관지정기탁사업, 배분지원차량관리</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1423</p>
                                        <!-- <p><i class="sprite-group-mail"></i>wks0627@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">주임 이수경</dt>
                                    <dd class="fake-table-td">
                                        <p>기관지정기탁사업, 지정기탁사업 평가 관리, 지정기탁사업 소위원회 운영</p>
                                        <p><i class="sprite-group-tel"></i>051-790-1406</p>
                                        <!-- <p><i class="sprite-group-mail"></i>leesk88@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                        </div>  
                    </section>
                    <!-- E : 조직도 -->
                    <!-- S : 회장 -->
                    <section class="ui-tab-pnl" id ="pnl1" >
                        <div class="tab-contents" id ="tab1" >
                            <div class="person-area">
                                <div class="person-item">
                                    <div class="person-col-tit">
                                        <p class="person-position">회장</p>
                                        <p class="person-time">현재</p>
                                    </div>
                                    <div class="person-col-photo">
                                        <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_03.jpg" alt="신정택 프로필 이미지"></div>
                                    </div>
                                    <div class="person-col-info">
                                        <p class="person-name">신정택</p>
                                        <div class="person-profile">
                                            <p class="person-profile-tit">[출생]</p>
                                            <dl class="person-profile-item">
                                                <dt>1948년</dt>
                                                <dd>경남 창녕군</dd>
                                            </dl>
                                            <p class="person-profile-tit">[소속]</p>
                                            <dl class="person-profile-item">
                                                <dt>&nbsp;</dt>
                                                <dd>
                                                    세운철강(주) 회장<br>
                                                    부산사회복지공동모금회 회장
                                                </dd>
                                            </dl>
                                            <p class="person-profile-tit">[학력]</p>
                                            <dl class="person-profile-item">
                                                <dt>&nbsp;</dt>
                                                <dd>
                                                    대구 대륜고<br>
                                                    동아대학교 경영학과<br>
                                                    동아대학교 경영대학원 석사<br>
                                                    동아대학교 경영학 명예박사<br>
                                                    부산대학교 경영학 명예박사
                                                </dd>
                                            </dl>
                                            <p class="person-profile-tit">[주요 약력]</p>
                                            <dl class="person-profile-item">
                                                <dt>1978년</dt>
                                                <dd>세운철강(주) 설립, 대표이사 역임</dd>
                                                <dt>2003년</dt>
                                                <dd>
                                                    세운철강(주) 회장<br>
                                                    한국자유총연맹 부산시지회 회장 역임
                                                </dd>
                                                <dt>2004년</dt>
                                                <dd>법무부 법사랑위원 부산지역연합회 회장</dd>
                                                <dt>2006년</dt>
                                                <dd>주한스리랑카 명예영사</dd>
                                                <dt>2008년</dt>
                                                <dd>㈜에어부산 대표이사 역임</dd>
                                                <dt>2011년</dt>
                                                <dd>아시아기업경영학회 이사장</dd>
                                                <dt>2012년</dt>
                                                <dd>
                                                    부산상공회의소 회장 역임<br>
                                                    부산글로벌포럼 공동대표
                                                </dd>
                                                <dt>2013년</dt>
                                                <dd>
                                                    (사)대한럭비협회 회장 역임<br>
                                                    한국해양구조협회 총재
                                                </dd>
                                                <dt>2015년 ~</dt>
                                                <dd>現부산사회복지공동모금회 회장</dd>
                                            </dl>
                                            <p class="person-profile-tit">[수상내역]</p>
                                            <dl class="person-profile-item">
                                                <dt>2015년</dt>
                                                <dd>범죄예방 한마음대회 국민훈장 모란장</dd>
                                                <dt>2012년</dt>
                                                <dd>제28회 자랑스러운 시민상 대상</dd>
                                                <dt>2009년</dt>
                                                <dd>부산시민산업대상</dd>
                                                <dt>2008년</dt>
                                                <dd>한국의 존경받는 CEO대상</dd>
                                                <dt>2005년</dt>
                                                <dd>통일부장관 표창</dd>
                                                <dt>2002년</dt>
                                                <dd>법무부장관 표창</dd>
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
                        <div class="tab-contents" id ="pnl2" >
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
                                        <td class="td-point">신정택</td>
                                        <td>세운철강 회장</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="wide-scroll members">
                                <table summary="위원">
                                    <caption>위원 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" rowspan="8" class="no-line">위원</th>
                                            <td class="td-point">김진수</td>
                                            <td>부산광역시교육청 부교육감</td>
                                            <td class="td-point">남찬섭</td>
                                            <td>동아대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">임성원</td>
                                            <td>부산일보사 논설실장</td>
                                            <td class="td-point">장재건</td>
                                            <td>국제신문 논설실장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이학상</td>
                                            <td>부산KBS 총무국 국장</td>
                                            <td class="td-point">이명원</td>
                                            <td>부산MBC 경영기획국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">신제호</td>
                                            <td>부산광역시 복지건강국장</td>
                                            <td class="td-point">김호진</td>
                                            <td>KNN 경영본부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">장재봉</td>
                                            <td>천주교부산교구 선교사목국장</td>
                                            <td class="td-point">황태영</td>
                                            <td>부산지방변호사회 부회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이갑준</td>
                                            <td>부산상공회의소 상근부회장</td>
                                            <td class="td-point">이윤희</td>
                                            <td>태금정(주) 대표이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">오흥숙</td>
                                            <td>부산생명의전화 원장</td>
                                            <td class="td-point">방성빈</td>
                                            <td>BNK부산은행 경영기획본부장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
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
                                        <td class="td-point">박상훈</td>
                                        <td>부산지방공인회계사회 감사</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">한승훈</td>
                                        <td>부산지방세무사회 국제이사</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                    <!-- E : 운영위원회 -->
                    <!-- S : 분과실행위원회 -->
                    <section class="ui-tab-pnl" id ="pnl3" >
                        <div class="tab-contents" id ="pnl3" >
                            <h4 class="title-heading_a mg-t-m">모금분과실행위원</h4>
                            <div class="wide-scroll members">
                                <div class="tb-type_c">
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
                                            <td class="td-point">신제호</td>
                                            <td colspan="3">부산광역시 복지건강국장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="2">부위원장</th>
                                            <td class="td-point">박성주</td>
                                            <td colspan="3">부산사회복지협의회 사무처장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">유영란</td>
                                            <td colspan="3">부산주민운동교육원 상임트레이너</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="8">위원</th>
                                            <td class="td-point">김도림</td>
                                            <td>수영로교회 긍휼영역 담당 목사</td>
                                            <td class="td-point">김우생</td>
                                            <td>경성대학교 토목공학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김현옥</td>
                                            <td>동서대학교 IPP사업단 교수</td>
                                            <td class="td-point">민형호</td>
                                            <td>부산사회복지 행정연구회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">백성한</td>
                                            <td>부산KBS 경영지원부장</td>
                                            <td class="td-point">백순희</td>
                                            <td>부산시자원봉사센터장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">서영민</td>
                                            <td>부산 항만소방서 과장</td>
                                            <td class="td-point">이준영</td>
                                            <td>부산일보 논설위원</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">조숙영</td>
                                            <td>북구지역자활센터장</td>
                                            <td class="td-point">조호규</td>
                                            <td>대한적십자사 부산혈액원장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">차재근</td>
                                            <td>문화소통단체 '숨' 대표</td>
                                            <td class="td-point">추준호</td>
                                            <td>부산일보 경영기획부장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h4 class="title-heading_a mg-t-m">배분분과실행위원</h4>
                            <div class="wide-scroll members">
                                <div class="tb-type_c">
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
                                            <td class="td-point">남찬섭</td>
                                            <td colspan="3">동아대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" >부위원장</th>
                                            <td class="td-point">이요한</td>
                                            <td colspan="3">사회복지법인 큰빛 대표이사</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="8">위원</th>
                                            <td class="td-point">김고은</td>
                                            <td>前경남발전연구원 책임연구원</td>
                                            <td class="td-point">김담산</td>
                                            <td>미륵암 주지스님</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김두례</td>
                                            <td>부산복지개발원 지역통합연구부 선임연구위원</td>
                                            <td class="td-point">김영미</td>
                                            <td>동의대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김은정</td>
                                            <td>부경대학교 행정학과(사회복지전공) 교수</td>
                                            <td class="td-point">김혜정</td>
                                            <td>부산여성가족개발원 일·가족연구부 연구위원</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">민현순</td>
                                            <td>前대한의료사회복지사회 부회장</td>
                                            <td class="td-point">배의식</td>
                                            <td>부산디지털대학교 사회복지경영학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">변영우</td>
                                            <td>경성대학교 사회복지학과 교수</td>
                                            <td class="td-point">손지현</td>
                                            <td>신라대학교 복지상담학부 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이오복</td>
                                            <td>부산가톨릭대학교 사회복지학과 교수</td>
                                            <td class="td-point">이원익</td>
                                            <td>부산대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이지욱</td>
                                            <td>법무법인 재유 변호사</td>
                                            <td class="td-point">현안나</td>
                                            <td>동아대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정태효</td>
                                            <td>부산광역시 복지정책과장</td>
                                            <td class="td-point">최윤정</td>
                                            <td>경남정보대학교 사회복지학과 교수</td>
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
        
