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
                                <div class="group-imgbox"><img src="/common/img/contents/group_img12.jpg" alt=""></div>
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">박은희</dt>
                                        <dd class="fake-table-td">
                                            <p>사무국 총괄</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0501</p>
                                            <!-- <p><i class="sprite-group-mail"></i>dreamer@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 이훈</dt>
                                        <dd class="fake-table-td">
                                            <p>&rtrif; 모금총괄</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0512</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hunlee@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 이원욱</dt>
                                        <dd class="fake-table-td">
	                                        <p>연합모금(천안시복지재단,당진시복지재단,지역사회보장협의체)</p>
	                                        <p>시군순회모금</p>
	                                        <p>시군워크숍</p>
	                                        <p>유공자포상식</p>
	                                        <p>지회평가</p>
	                                        <p>실적 및 통계</p>
	                                        <p>시군: 충남도청, 천안시, 당진시, 태안군_시군청 및 해당지역 기업관리</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0514</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jesusysm@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 이건세</dt>
                                        <dd class="fake-table-td">
	                                        <p>아너소사이어티[개발,관리,행사]</p>
											<p>나눔명문기업</p>
											<p>언론사 및 대외홍보(보도자료, SNS, 기자관리 등)</p>
											<p>캠페인 제막식∙폐막식</p>
											<p>특별모금, 방송모금(연말캠페인 방송)</p>
											<p>시군: 공주시, 보령시, 아산시_시군청 및 해당지역 기업관리</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0511</p>
                                            <!-- <p><i class="sprite-group-mail"></i>guns@chest.or.kr</p> -->
                                        </dd>
                                        
                                        <dt class="fake-table-th">주임 최병준</dt>
                                        <dd class="fake-table-td">
											<p>착한가게</p>
											<p>착한가정</p>
											<p>나눔봉사단</p>
											<p>학교모금</p>
											<p>공공기관모금 </p>
											<p>착한일터</p>
											<p>CMS모금</p>
											<p>시군: 서산시, 예산군, 금산군_시군청 및 해당지역 기업관리</p>
                                            <p><i class="sprite-group-tel"></i>070-4172-7073</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jnjn@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 김관희</dt>
                                        <dd class="fake-table-td">
                                            <p>나눔리더</p>
                                            <p>나눔리더스클럽</p>
                                            <p>대외홍보(홈페이지, 홍보물, 회보)</p>
                                            <p>지로모금, 온라인모금</p>
                                            <p>사랑의열매, 대형 및 중,소형 모금함, 모금사업팀 물품관리</p>
                                            <p>시군: 논산시,서천군,부여군_시군청 및 해당지역 기업관리</p>
											<p><i class="sprite-group-tel"></i>070-8897-0509</p>
                                            <!-- <p><i class="sprite-group-mail"></i>w2@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 이웅희</dt>
                                        <dd class="fake-table-td">
                                            <p>지정기탁현물(모금 및 배분) </p>
                                            <p>CRM 모금</p>
                                            <p>이벤트모금</p>
                                            <p>모금사업팀 서무</p>
                                            <p>시군: 계룡시, 청양군, 홍성군_시군청 및 해당지역 기업관리</p>
											<p><i class="sprite-group-tel"></i>070-8897-0510</p>
                                            <!-- <p><i class="sprite-group-mail"></i>w2@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">사회공헌팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 이해영</dt>
                                        <dd class="fake-table-td">
                                            <p>&rtrif; 사회공헌업무 총괄</p>
                                            <p>&rtrif; 지정기탁배분소위원회 및 평가위원 관리</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0512</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hunlee@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 김정훈</dt>
                                        <dd class="fake-table-td">
	                                        <p>&rtrif; 1000대 기업 모금 및 배분</p>
											<p>- 삼성디스플레이, 삼성전자㈜온양캠퍼스, 삼성SDI, 현대오일뱅크, 현대트랜시스, 한화토탈, 이녹스, 미래엔서해에너지, 애터미, KCC, 솔브레인, 계룡건설, 두산인프라코어,현대그린파워, 현대제철, 현대도시개발, 현대파텍스, 씨텍, LG화학, 한화종합화학, SK이노베이션, 세메스, 환영철강공업, 시티문화재단</p>
											<p>- 사회공헌 워크숍 등 관리</p>
											<p>- 신규기업 개발</p>
											<p>- 협업기관 및 유관기관 간담회 등</p>
											<p>&rtrif; 나라사랑보금자리기업</p>
											<p>- 참여기업 관리 : 보잉코리아, 이마트,카이,KT&G, 효성, 국민은행, 현대자동차그룹, 현대파워텍 등</p>
											<p>&rtrif; 위국헌신전우사랑기금 사업</p>
											<p>- 참여기업 관리 : 개인정기기부 포함, 더존비즈온, 능원금속(주), (사)군인자녀교육진흥원, ㈜삼구아이앤씨, ㈜프런티어코리아, 아주산업 등</p>
											<p>&rtrif; 지정기탁소위원회 위원관리 및 회의준비</p>
											<p>&rtrif; 미배분 지정기탁 잔액관리 총괄</p>
											<p><i class="sprite-group-tel"></i>070-8897-0508</p>
                                            <!-- <p><i class="sprite-group-mail"></i>junghun21@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 정지윤</dt>
                                        <dd class="fake-table-td">
                                           <p>&rtrif; 1000대 기업 모금 및 배분</p>
											<p>- 현대자동차 아산공장, JB주식회사</p>
											<p>- 신규기업 개발</p>
											<p>&rtrif; 발전소 모금 및 배분</p>
											<p>- 한국서부발전, 태안발전본부, 한국동서발전 당진화력본부</p>
											<p>&rtrif; 연합모금, 아너, 지역사회보장협의체 배분</p>
											<p>&rtrif; 사회복지기관 지정기탁 배분</p>
											<p>&rtrif; 배분사업평가 평가진행 등</p>
											<p><i class="sprite-group-tel"></i>070-4172-7072</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jiyoon32@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 전승철</dt>
                                        <dd class="fake-table-td">
	                                        <p>&rtrif; 1000대 기업 모금 및 배분</p>
											<p>- 한국중부발전(보령, 신보령, 서천), 롯데케미칼, 코닝정밀소재</p>
											<p>- 신규기업 개발</p>
											<p>&rtrif; 개인지정기탁(일시 및 정기) 배분</p>
											<p>&rtrif; 미배분 지정기탁 잔액관리</p>
											<p>&rtrif; 사회공헌팀 서무</p>
											<p><i class="sprite-group-tel"></i>070-8897-0506</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jschest@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 조유나</dt>
                                        <dd class="fake-table-td">
                                            <p>&rtrif; 배분업무 총괄</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0504</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yuna1004@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 양지이</dt>
                                        <dd class="fake-table-td">
                                        	<p>&rtrif; 신청사업</p>
											<p>&rtrif; 기획사업</p>
											<p>- 소규모 복지기관 지원사업</p>
											<p>- 주거약자의 지역사회통합을 위한 지원주택 모델화 사업</p>
											<p>- 마을단위 통합 돌봄을 위한 협동화 사업</p>
											<p>- 하반기 신규 기획사업</p>
											<p>&rtrif; 배분분과실행위원회 관리, 통계관리 등</p>
											<p><i class="sprite-group-tel"></i>070-8897-0513</p>
                                           <!--  <p><i class="sprite-group-mail"></i>yge@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 백송이</dt>
                                        <dd class="fake-table-td">
                                            <p>&rtrif; 기획사업</p>
											<p>- 취약계층 여성의 취업기반 형성을 위한 직업재활 지원사업</p>
											<p>- 소규모 복지기관 월동난방비 지원사업</p>
											<p>- 사회복지종사자의 안정을 위한 보호체계 구축사업</p>
											<p>- 취약계층 임신출산 지원을 통한 초기 양육환경 조성사업</p>
											<p>- 저소득가정 학생돕기 지원사업</p>
											<p>&rtrif; 평가지원단 관리</p>
                                            <p><i class="sprite-group-tel"></i>070-4172-7070</p>
                                            <!-- <p><i class="sprite-group-mail"></i>s2@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 강여울</dt>
                                        <dd class="fake-table-td">
                                            <p>&rtrif; 긴급지원사업</p>
											<p>&rtrif; 기획사업</p>
											<p>- 사회복지서비스 차량지원사업</p>
											<p>- 저소득가정 월동난방비 지원사업</p>
											<p>- 명절지원사업</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0500</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hgb22@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 신효정</dt>
                                        <dd class="fake-table-td">
											<p>&rtrif;  복권기금사업</p>
											<p>- 야간보호사업</p>
											<p>- 가족기능강화사업</p>
											<p>&rtrif; 기획사업</p>
											<p>- 방송사례지원사업</p>
											<p>- 가족기능강화를 위한 심리정서 지원사업</p>
											<p>&rtrif; 배분사업팀 서무업무</p>
                                            <p><i class="sprite-group-tel"></i>070-4172-7071</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hgb22@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">경영지원팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 조유나</dt>
                                        <dd class="fake-table-td">
                                            <p>경영지원 총괄</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0504</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yuna1004@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 백명하</dt>
                                        <dd class="fake-table-td">
											<p>&rtrif; 인사(채용, 인사관리, 근태, 복리후생, 직원교육, 제증명 등)</p>
											<p>&rtrif; 기획</p>
											<p>- 사업계획 및 예산</p>
											<p>- 운영위원회 / 시민감시위원회 관리</p>
											<p>- 회계감사 및 결산</p>
											<p>- 자금관리</p>
											<p>- 급여 및 4대보험</p>
											<p>&rtrif; 구매/계약</p>
											<p>&rtrif; 총무(사무실 임대차 관리, 문서관리, 집기비품관리, 각 종 보험 등)</p>
											<p>&rtrif; 회계(기본재산관리, 월마감업무, 지출업무, 세무업무, 법인카드관리)</p>
											<p>&rtrif; 자원봉사자 관리</p>
                                            <p><i class="sprite-group-tel"></i>070-8897-0502</p>
                                            <!-- <p><i class="sprite-group-mail"></i>ha@chest.or.kr</p> -->
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
                                            <p class="person-time">2020 ~ 현제</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_12.jpg" alt="성우종 프로필 이미지"></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">성우종</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[학력]</p>
                                                <div class="person-profile-item">
                                                    <ul>
                                                        <li>순천향대학교 명예경영학박사</li>
                                                    </ul>
                                                </div>
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>1983 - 2001</dt>
                                                    <dd>전)대아그룹 총괄부사장</dd>
                                                    <dt>2013 - 2015</dt>
                                                    <dd>전)재경 서산시향우회 회장</dd>
                                                    <dt>2017</dt>
                                                    <dd>현재 충남 아너소사이어티 클럽 회장</dd>
                                                    <dt>2018</dt>
                                                    <dd>현재 충남사회복지공동모금회 부회장<br>현재 충청남도 지체장애인 협회 후원회장<br>현재 건설공제조합, 대한건설협회 대표 대의원</dd>
                                                </dl>
                                                <p class="person-profile-tit">[포상 이력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>2009</dt>
                                                    <dd>성실납세 대통령 표창</dd>
                                                    <dt>2012</dt>
                                                    <dd>온탑 산업훈장 (건설의 날)</dd>
                                                    <dt>2015</dt>
                                                    <dd>국가사회발전 대통령 표창</dd>
                                                    <dt>2017</dt>
                                                    <dd>국가재난관리 대통령 표창</dd>
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
                                    <table summary="회장">
                                        <caption>회장 정보입니다.</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">회장</th>
                                            <td class="td-point">성우종</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table summary="부지회장">
                                        <caption>부지회장 정보입니다.</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" rowspan="3" class="no-line">부지회장</th>
                                            <td class="td-point">김동복</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김호택</td>
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
                                            <th scope="row" rowspan="4" class="no-line">위원</th>
                                            <td class="td-point">박영숙</td>
                                            <td class="td-point">백창기</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이정석</td>
                                            <td class="td-point">이원식</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">서정만</td>
                                            <td class="td-point">이광축</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">조두식</td>
                                            <td class="td-point">장경희</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                <table summary="감사">
                                    <caption>감사 정보입니다.</caption>
                                    <colgroup>
                                        <col style="width:50%">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" rowspan="2" class="no-line">감사</th>
                                        <td class="td-point">연규동</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">조창현</td>
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
                                <h4 class="title-heading_a mg-t-m">배분분과실행위원회</h4>
                                <div class="tb-type_c">
                                    <table summary="배분분과실행위원회">
                                        <caption>배분분과실행위원회 정보입니다.</caption>
                                        <colgroup>
                                            <col style="width:50%">
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td colspan="2" class="td-point">장경희</td>
                                        </tr>  
                                        <tr>
                                            <th scope="row" rowspan="5">위원</th>
                                            <td class="td-point">이은정</td>
                                            <td class="td-point">유병숙</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">지승훈</td>
                                            <td class="td-point">김진수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정정호</td>
                                            <td class="td-point">강희숙</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김기덕</td>
                                            <td class="td-point">김성욱</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박경연</td>
                                            <td class="td-point">신은경</td>
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
        
