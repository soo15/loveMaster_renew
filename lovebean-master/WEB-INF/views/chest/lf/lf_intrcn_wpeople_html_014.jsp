<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사랑의 열매 > 소개  > 함께하는 사람들 
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
                                <div class="group-imgbox"><img src="/common/img/contents/group_img14.jpg" alt=""></div>
                                
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">김상균 </dt>
                                        <dd class="fake-table-td">
                                            <p>사무국 운영총괄</p>
                                            <!-- <p><i class="sprite-group-mail"></i>ksg6979@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>                                
                                <h4 class="title-heading_a mg-t-l">모금사업1팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 오세헌</dt>
                                        <dd class="fake-table-td">
                                            <p>모금사업1팀 업무 전반<br>(아너 소사이어티, 중고액 ․ 소다수(개인모금))</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6814</p>
                                           <!--  <p><i class="sprite-group-mail"></i>osh@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 황성일 </dt>
                                        <dd class="fake-table-td">
                                            <p>아너 소사이어티 모금<br>나눔리더·리더스클럽 모금 및 기부자 관리<br>여수시, 광양시, 장성군</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6807</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hsi2012@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 이순화</dt>
                                        <dd class="fake-table-td">
                                            <p>소다수 나눔캠페인 모금(착한일터/착한가게/착한가정)<br>전남복지재단 연합모금(블루sos모금)<br>나주시, 영암군, 담양군, 곡성군, 장흥군, 강진군, 함평군</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6809</p>
                                            <!-- <p><i class="sprite-group-mail"></i>mini5212@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">모금사업2팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 이현승</dt>
                                        <dd class="fake-table-td">
                                            <p>모금사업2팀 업무 전반(기업모금 ․ 연합모금 관리, 현물모금 관리)</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6811</p>
                                            <!-- <p><i class="sprite-group-mail"></i>lhs@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 전현정</dt>
                                        <dd class="fake-table-td">
                                            <p>모금분과실행위원회 개최 및 관리<br>연합모금(중앙/지회)사업 추진 및 관리<br>기타, 순천시, 화순군, 영광군</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6802</p>
                                            <!-- <p><i class="sprite-group-mail"></i>pyj@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 이종민 </dt>
                                        <dd class="fake-table-td">
                                            <p>나눔명문기업 캠페인, 학교모금 캠페, 나눔공모전<br>CMS 출금의뢰 및 정기기부자 관리<br>무안군, 구례군, 고흥군, 완도군, 해남군, 진도군, 신안군</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6819</p>
                                            <!-- <p><i class="sprite-group-mail"></i>tnsk5040@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 이정길</dt>
                                        <dd class="fake-table-td">
                                            <p>현물지정기탁 모금, 기부(Give)컴 캠페인 추진 및 관리<br>목포시, 보성군<br>이벤트특별모금 관리(행사, 재난재해 특별모금)</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6812</p>
                                           <!--  <p><i class="sprite-group-mail"></i>jeonhj24@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 박유진</dt>
                                        <dd class="fake-table-td">
                                            <p>육아휴직 </p>
                                            <!-- <p><i class="sprite-group-tel"></i>061-902-6809/6800</p>-->
                                            <!-- <p><i class="sprite-group-mail"></i>tnsk5040@chest.or.kr</p>-->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 정종헌</dt>
                                        <dd class="fake-table-td">
                                            <p>배분사업팀 업무 전반 관리</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6810</p>
                                           <!--  <p><i class="sprite-group-mail"></i>jjh7498@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 손민관</dt>
                                        <dd class="fake-table-td">
                                            <p>신청사업<br>기획사업(나눔문화확산지원사업, 복지현안우선지원사업,사랑의김장김치지원사업, 전국기획사업, 기타 신규기획사업 등)</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6805</p>
                                            <!-- <p><i class="sprite-group-mail"></i>sssky80@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 이재두</dt>
                                        <dd class="fake-table-td">
                                            <p>기획사업(차량지원사업, 복지기관인프라강화사업, 도서지역 및 오지마을 지원사업, 주택개보수지원사업, 기타 신규 기획사업 등)<br>포스코 중앙지정기탁사업 등<br>배분차량 매각, 폐차관리</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6804</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jd9037@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 강하연 </dt>
                                        <dd class="fake-table-td">
                                            <p>긴급지원사업<br>기획사업(주택신축매칭그랜트 지원사업, 나눔대축제 매칭지원사업, 기타 신규 기획사업 등)<br>GS칼텍스 중앙지정기탁사업 등</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6815</p>
                                            <!-- <p><i class="sprite-group-mail"></i>gkdus9412@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 김샛별 </dt>
                                        <dd class="fake-table-td">
                                            <p>복권기금사업(야간보호, 방학지원, 가족기능강화사업 등)<br>기획사업(월동난방비지원사업, 기타 신규기획사업 등)</p>
                                            <p><i class="sprite-group-tel"></i>061-980-6819</p>
                                            <!-- <p><i class="sprite-group-mail"></i>totquf2766@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">경영지원팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김윤하</dt>
                                        <dd class="fake-table-td">
                                            <p>경영지원 업무 전반 관리</p>
                                            <p><i class="sprite-group-tel"></i>061-980-6820</p>
                                            <!-- <p><i class="sprite-group-mail"></i>kyh007@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 이혜련</dt>
                                        <dd class="fake-table-td">
                                            <p>회계(예산 및 결산, 보조금, 구매 및 계약) 인사, 총무</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6808</p>
                                            <!-- <p><i class="sprite-group-mail"></i>auddk7@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 이미현</dt>
                                        <dd class="fake-table-td">
											<p>홍보 관련 업무 및 관리<br>사랑의열매 나눔봉사단(자원봉사자)<br>온라인모금, 기부자 상훈 관리(중앙회, 도지사)</p>
                                            <p><i class="sprite-group-tel"></i>061-902-6802</p>
                                           <!--  <p><i class="sprite-group-mail"></i>jeonhj24@chest.or.kr</p> -->
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
                                            <p class="person-time">2019.10 ~ 현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman3_14.jpg" alt=""></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">노동일</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>현</dt>
                                                    <dd>(주)민콘 대표이사</dd>
                                                    <dt>현</dt>
                                                    <dd>전남대학교 병원 이사</dd>
                                                    <dt>전</dt>
                                                    <dd>전남대학교 총동창회장</dd>
                                                </dl>
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
                                    <div class="wide-scroll members">
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
                                                <td class="td-point">노동일 </td>
                                                <td colspan="3">주식회사 민콘 대표</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="2">부회장</th>
                                                <td class="td-point">장애신</td>
                                                <td colspan="3">前 전남여수교육지원청 교육장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">고광일</td>
                                                <td colspan="3">목포한국병원 원장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="5" >위원</th>
                                                <td class="td-point">김양희</td>
                                                <td>前 전라남도 여성단체협의회장</td>
                                                <td class="td-point">박희서</td>
                                                <td>조선대학교 사회과학대학 행정복지학부 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">나양명</td>
                                                <td>나양명법률사무소 대표</td>
                                                <td class="td-point">민영돈</td>
                                                <td>조선대학교 총장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">안병옥</td>
                                                <td>전남도청 보건복지국장</td>
                                                <td class="td-point">박창수</td>
                                                <td>재단법인 씨젠의료재단 광주호남지역본부 대표원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이희경</td>
                                                <td>월곡중학교 교장</td>
                                                <td class="td-point">조성희</td>
                                                <td>싸이버테크 주식회사 대표이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">홍기문</td>
                                                <td>前  전남대학교 법과대학 학장</td>
                                                <td class="td-point">허영호</td>
                                                <td >미림산업개발 대표</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="3" class="no-line">감사</th>
                                                <td class="td-point">임선숙</td>
                                                <td >광주지방변호사회 회장 <br/>법무법인 이우스 대표</td>
                                                <td class="td-point">최병선</td>
                                                <td >동명회계법인 회계사</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 운영위원회 -->
                        <!-- S : 분과실행위원회 -->
                        <section class="ui-tab-pnl" id ="pnl3" >
                            <div class="tab-contents">
                                <h4 class="title-heading_a mg-t-m">배분분과위원회</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="배분분과위원회">
                                            <caption>배분분과위원회 정보입니다.</caption>
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
                                                <td class="td-point">박희서</td>
                                                <td colspan="3">조선대학교 사회과학대학 행정복지학부 교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="2">부위원장</th>
                                                <td class="td-point">정광익</td>
                                                <td colspan="3">목포재활요양병원 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">신정숙</td>
                                                <td colspan="3">광주보건대학교 사회복지과 교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="7" class="no-line">위원</th>
                                                <td class="td-point">김정란</td>
                                                <td>여수장애인재활자립장 원장</td>
                                                <td class="td-point">김태영</td>
                                                <td>포스코광양제철소 행정섭외그룹지역협력팀 팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">나종운</td>
                                                <td>한국투자증권 호남지역본부 본부장</td>
                                                <td class="td-point">명근홍</td>
                                                <td>목포과학대학교 사회복지과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박공식</td>
                                                <td>화정3동성당 담당신부</td>
                                                <td class="td-point">유명재</td>
                                                <td>전라남도사회복지협의회 사무처장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이규환</td>
                                                <td>(사)사회복지균등실현을 위한 사랑의음악회 이사장</td>
                                                <td class="td-point">이재환</td>
                                                <td>순천제일대학교 사회복지과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">임성수</td>
                                                <td>전라남도 사회복지과 과장</td>
                                                <td class="td-point">정신정</td>
                                                <td>위스타트 강진글로벌아동센터 관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">조지현</td>
                                                <td>동신대학교 사회복지학과 교수</td>
                                                <td class="td-point">황언배</td>
                                                <td>목포문화방송 경영기획국 국장</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                <h4 class="title-heading_a mg-t-m">모금분과위원회</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="모금분과위원회">
                                            <caption>배분분과위원회 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col class="col-w02">
                                                <col>
                                                <col class="col-w02">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <!-- <tr>
                                                <th scope="row">위원장</th>
                                                <td class="td-point">노동일</td>
                                                <td colspan="3">㈜민콘 대표</td>
                                            </tr> -->
                                            <tr>
                                                <th scope="row" >부위원장</th>
                                                <td class="td-point">허영호 </td>
                                                <td colspan="3">미림산업개발 대표이사</td>
                                            </tr>
                                            <th scope="row" rowspan="9">위원</th>
                                                <td class="td-point">강종원 </td>
                                                <td>한국외식업중앙회전라남도지회 사무국장</td>
                                                <td class="td-point">고병국</td>
                                                <td>여수중부교회 담임목사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">고흥석</td>
                                                <td>GS칼텍스 지역협력팀 부장</td>
                                                <td class="td-point">김용철</td>
                                                <td>여수항도선사회 상무</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박정순</td>
                                                <td>한국여성경제인협회 전남지회 특별부회장</td>
                                                <td class="td-point">박형배</td>
                                                <td>광양상공회의소 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">서호기</td>
                                                <td>순천상공회의소 사무국장</td>
                                                <td class="td-point">오승석</td>
                                                <td>전라남도치과의사회 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이용백</td>
                                                <td>포스코광양제철소 지역협력팀 과장</td>
                                                <td class="td-point">정찬주</td>
                                                <td>한국거래소 노무복지팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">정영애</td>
                                                <td>빛가람손해사정법인소장</td>
                                                <td class="td-point">최병만</td>
                                                <td>전라남도약사회 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최창호</td>
                                                <td>목포상공회의소 사무처장</td>
                                                <td class="td-point">황명상</td>
                                                <td>한화케미칼 여수공장 사회공헌팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">한경진</td>
                                                <td>사회적경제 활성화 전남네트워크 운영위원장</td>
                                                <td class="td-point">류성훈</td>
                                                <td>무등일보 사회부장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이부규</td>
                                                <td colspan="3">한수원(주)한빛원자력본부 대외협력처 차장</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <h4 class="title-heading_a mg-t-m">배분평가지원단</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                    <table summary="배분평가지원단">
                                        <caption>배분평가지원단 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">단장</th>
                                            <td class="td-point">박공식</td>
                                            <td colspan="3">화정3동성당 담당신부</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">부단장</th>
                                            <td class="td-point">이미경</td>
                                            <td colspan="3">전국지역아동센터협의회 호남이사</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="8" class="no-line">단원</th>
                                            <td class="td-point">김종유</td>
                                            <td>동부증권 부장</td>
                                            <td class="td-point">김종협 </td>
                                            <td>동아보건대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김진우 </td>
                                            <td>여수시노인복지관 관장</td>
                                            <td class="td-point">나명희</td>
                                            <td>아동청소년 (사)푸른샘 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">류재중</td>
                                            <td>전남청소년미래재단 원장</td>
                                            <td class="td-point">맹현숙</td>
                                            <td>목포장애인요양원 원장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박은주</td>
                                            <td>자혜양로원 원장</td>
                                            <td class="td-point">박인권</td>
                                            <td>목포상리사회복지관 관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정남숙</td>
                                            <td>여수보육원 사무국장</td>
                                            <td class="td-point">최종순</td>
                                            <td >여수시장애인종합복지관 사무국장</td>
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
        
