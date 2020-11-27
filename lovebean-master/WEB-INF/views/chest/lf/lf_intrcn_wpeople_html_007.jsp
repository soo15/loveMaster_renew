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
                            <div class="group-imgbox"><img src="/common/img/contents/group_img07.jpg" alt=""></div>
                            
                            <h4 class="title-heading_a mg-t-l">사무처장</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">박용훈</dt>
                                    <dd class="fake-table-td">
                                        <p>사무국 총괄</p>
<!--                                         <p><i class="sprite-group-tel"></i>062-654-9077</p> -->
                                       <!--  <p><i class="sprite-group-mail"></i>yhpark1024@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>                                        
                            
                            <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">최진수 팀장(겸직)</dt>
                                    <dd class="fake-table-td">
                                        <p>- 경영관리팀 총괄<br>
										- 운영위원회 운영 전반<br>
										- 사업계획 및 예산수립 / 결산 업무<br>
										- 월간일정, 주간일정 수립 취합 및 보고<br>
										- 지회평가업무총괄</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5174</p>
                                        <!-- <p><i class="sprite-group-mail"></i>chestking@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">오귀은 주임</dt>
                                    <dd class="fake-table-td">
                                        <p>- 총무, 회계, 인사관리 담당<br>
											- 직원 복리후생, 교육훈련  <br>
											- 전세지원금 관리<br>
											- 재산 및 비품관리<br>
											- 시민참여위원회 운영 전반<br>
											- 감사업무 <br>
											- 사업계획 및 예산수립, 결산업무 지원  <br>
											- 운영위원회 업무 지원<br>
                                        <p><i class="sprite-group-tel"></i>042-347-5181</p>
                                        <!-- <p><i class="sprite-group-mail"></i>oke1612@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                                                        
                            <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">최진수 팀장</dt>
                                    <dd class="fake-table-td">
                                        <p>
                                        - 모금사업 총괄<br>
										- 모금분과실행위원회 운영 전반<br>
										- 모금 계획수립<br>
										- 캠페인출범식,폐막식등행사<br>
										- 모금분석/월별지회평가등성과분석<br>
										- 팀 주간, 월간 일정수립<br>
										- 대외협력 및 주요행사 대응</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5174</p>
                                        <!-- <p><i class="sprite-group-mail"></i>chestking@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">김미경 과장</dt>
                                    
                                    <dd class="fake-table-td">
                                        <p>- 아너소사이어티 / 유산기부<br>
										- 학교모금<br>
										- 공모형 연합모금<br>
										- 시구 순회모금<br>
										- 공무원워크샵,간담회<br>
										- 미디어 모금<br>
										- 언론홍보 담당<br>
										- 홍보대사 관리, 광고제작<br>
										- 중앙회 회보 기사제공<br>
										- 기부자 관리 총괄<br>
										- 담당행정기관 : 대전광역시, 교육청, 유성구</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5175</p>
                                        <!-- <p><i class="sprite-group-mail"></i>cnmik@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">유미라 대리</dt>
                                    <dd class="fake-table-td">
                                        <p>- 나눔리더,나눔리더스클럽<br/>
										- 정부청사및행정기관모금(착한일터포함)<br/>
										- 공공기관(정부산하, 시산하 기관 포함)<br/>
										- 모금수입처리<br/>
										- MS,이니시스<br/>
										- 이벤트,특별모금,온라인모금<br/>
										- 종교모금<br/>
										- 지정기탁 개인정기 배분<br/>
										- 담당행정기관 : 동구, 중구</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5176</p>
                                        <!-- <p><i class="sprite-group-mail"></i>mira2096@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">박성용 대리</dt>
                                    <dd class="fake-table-td">
                                        <p>- 기업모금 (기업 착한일터 포함)<br/>
										- 착한일터 총괄<br/>
										- 이웃돕기 유공자 시상식 및 각종 외부 유공자 추천<br/>
										- 사랑의온도탑 제작 / 설치 / 관리 등<br/>
										- 나눔봉사단 운영 <br/>
										- 담당행정기관 : 서구<br/>
										- 회보 주소관리 및 발송</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5178</p>
                                        <!-- <p><i class="sprite-group-mail"></i>symental@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">박새미 주임</dt>
                                    <dd class="fake-table-td">
                                        <p>- 착한가게,착한가정<br/>
										- 담당행정기관:대덕구<br/>
										- 직능단체,협회,사회단체<br/>
										- 지로모금<br/>
										- 소형모금함관리<br/>
										- 홈페이지, SNS(페이스북 등) 온라인 홍보<br/>
										- 홍보인쇄물 제작 : 연간보고서, 리플렛, 포스터 제작 및 배포 등<br/>
										- 홍보 및 모금물품 제작(사랑의열매, 모금함 등)</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5177</p>
                                        <!-- <p><i class="sprite-group-mail"></i>mira2096@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">강한뫼 팀장</dt>
                                    <dd class="fake-table-td">
                                        <p>- 배분사업 총괄<br>
										- 배분분과실행위원회 운영 전반<br>
										- 배분계획 수립<br>
										- 배분기획 : 현장 욕구수렴, 간담회, FGI, 기관장 간담회 등<br>
										- 배분사업 평가업무 총괄<br>
										- 팀 주간, 월간 일정 수립<br>
										- 대외협력 및 주요행사 대응</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5180</p>
                                        <!-- <p><i class="sprite-group-mail"></i>dg013@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">이정구 대리</dt>
                                    <dd class="fake-table-td">
                                        <p>- 기획사업 (전국기획사업 포함) : 기관 배분 중심<br>
											- 지정기탁사업 (기관 배분) : 기업, 착한일터, 아너 지정기탁 등<br>
											- 지정기탁사업 평가 총괄</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5185</p>
                                        <!-- <p><i class="sprite-group-mail"></i>pain87@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">장주섭 대리</dt>
                                    <dd class="fake-table-td">
                                        <p>- 신청사업 (슈퍼비젼단 운영 등)<br>
											- 지정기탁사업 (기관 배분) : 행정기관을 통한 지정기탁 등<br>
											- 평가지원단 운영 전반 : 간담회, 교육, 워크샵 등<br>
											- 차량지원사업 관리</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5184</p>
                                        <!-- <p><i class="sprite-group-mail"></i>jjs@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">박유영 주임</dt>
                                    <dd class="fake-table-td">
                                        <p>- 복권기금사업<br>
											- 긴급지원사업<br>
											- 기획사업 : 기초복지 및 단순지원사업 중심<br>
											- 지정기탁사업(기관/현금)<br>
											 *착한가게(가정) / 직능단체·협회·종교 지정배분
											</p>
                                        <p><i class="sprite-group-tel"></i>042-347-5183</p>
                                        <!-- <p><i class="sprite-group-mail"></i>timmy1020@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">이재경 주임</dt>
                                    <dd class="fake-table-td">
                                        <p>- 현물 모금 및 배분 사업<br/>
                                        - 지정기탁사업 : 기관 정기배분
                                        </p>
                                        <p><i class="sprite-group-tel"></i>042-347-5179</p>
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
                                        <p class="person-position">회장</p>
                                        <p class="person-time">2020.03 ~ 현재</p>
                                    </div>
                                    <div class="person-col-photo">
                                        <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_07.jpg" alt="정태희 프로필 이미지"></div>
                                    </div>
                                    <div class="person-col-info">
                                        <p class="person-name">정태희</p>
                                        <div class="person-profile">
                                            <p class="person-profile-tit">[주요 약력]</p>
                                            <dl class="person-profile-item">
                                                <dt>1991년 ~</dt>
                                                <dd>㈜삼진정밀 대표이사</dd>
                                                <dt>2005년 ~</dt>
                                                <dd>㈜삼진코리아 대표이사</dd>
                                                <dt>2008년 ~</dt>
                                                <dd>대전지방검찰청 범죄피해자 지원센터 후원회장</dd>
                                                <dt>2013년 ~</dt>
                                                <dd>정부조달마스협회 부회장</dd>
                                                <dt>2014년 ~ 2016년</dt>
                                                <dd>중소기업융합 대전세종충남연합회장</dd>
                                                <dt>2016년 ~</dt>
                                                <dd>대전상공회의소 부회장</dd>
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
                                        <td class="td-point">정태희</td>
                                        <td>삼진정밀 대표이사</td>
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
                                            <th scope="row" rowspan="2">부회장</th>
                                            <td class="td-point">강도묵 </td>
                                            <td colspan="3">대전세종충남경영자총협회 회장 대전광역시개발위원회 회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김태범 </td>
                                            <td colspan="3">대전종합법무법인 공동대표 변호사</td>
                                         </tr>
                                        <tr>
                                            <th scope="row" rowspan="7" class="no-line">위원</th>
                                            <td class="td-point">김도훈</td>
                                            <td>충청투데이 부회장</td>
                                            <td class="td-point">김복철</td>
                                            <td>대덕연구개발특구기관장협의회장(한국지질자원연구원장)</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김영일</td>
                                            <td>대전광역시 의사회 회장</td>
                                            <td class="td-point">류진석</td>
                                            <td>충남대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박경배</td>
                                            <td>前 대전성시화운동본부 대표회장</td>
                                            <td class="td-point">손종학</td>
                                            <td>충남대학교 법학전문대학원 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정해교</td>
                                            <td>대전광역시청 보건복지국장</td>
                                            <td class="td-point">이광축</td>
                                            <td>TJB대전방송 사장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">윤순기</td>
                                            <td>KEB하나은행 충청영업그룹 대표</td>
                                            <td class="td-point">정성욱</td>
                                            <td>대전 상공회의소 회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">서지원</td>
                                            <td colspan="3">대전광역시여성단체협의회장</td>
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
                                        <td class="td-point">이장순</td>
                                        <td>한남대학교 회계학과 교수</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">박희경</td>
                                        <td>민음 법률사무소 변호사</td>
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
                                            <td class="td-point">김태범</td>
                                            <td colspan="3">대전종합법무법인 공동대표 변호사</td>
                                        </tr>
										<tr>
                                            <th scope="row" rowspan="2">부위원장</th>
                                            <td class="td-point">장창수</td>
                                            <td colspan="3">용문종합사회복지관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">장온정</td>
                                            <td colspan="3">목원대학교 사회복지학과 교수</td>
                                        </tr>
										<tr>
                                            <th scope="row" rowspan="5">위원</th>
                                            <td class="td-point">김은혜</td>
                                            <td>우송대학교 사회복지아동학부 교수</td>
                                            <td class="td-point">배영길</td>
                                            <td>대전사회복지관협회 회장(생명종합사회복지관 관장)</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">양혜진</td>
                                            <td>대전대학교 사회복지학과 교수</td>
                                            <td class="td-point">오인근</td>
                                            <td>침례신학대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이광진</td>
                                            <td>대전경제정의실천시민연합기획위원장</td>
                                            <td class="td-point">이승규</td>
                                            <td>중도일보 논설실장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정지웅</td>
                                            <td>배재대학교 복지신학과 교수</td>
                                            <td class="td-point">정윤경</td>
                                            <td>한남대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">서정기</td>
                                            <td>대성 건축사사무소 대표</td>
                                            <td class="td-point">김현구</td>
                                            <td>에이원법률사무소 변호사</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
                                            <td class="td-point">강도묵</td>
                                            <td colspan="3">대전세종충남경영자총협회 회장 대전광역시개발위원회 회장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">부위원장</th>
                                            <td class="td-point">김만구</td>
                                            <td colspan="3">미래건설연구원 원장</td>
                                        </tr>
										<tr>
                                            <th scope="row" rowspan="8">위원</th>
                                            <td class="td-point">김희철</td>
                                            <td>태화건설산업주식회사 대표이사</td>
                                            <td class="td-point">정주택</td>
                                            <td>대전지방변호사회 사무국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김영기</td>
                                            <td>중구지역사회보장협의체 위원장</td>
                                            <td class="td-point">유영석</td>
                                            <td>TJB대전방송 경영광고국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">조덕형</td>
                                            <td>대전광역시한의사회 사무국장</td>
                                            <td class="td-point">최성운</td>
                                            <td>대전광역시치과의사회 사무국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김명수</td>
                                            <td>충남시인협회장</td>
                                            <td class="td-point">심현종</td>
                                            <td>대전상공회의소 사업본부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김시원</td>
                                            <td>대덕이노폴리스벤처협회 사무국장</td>
                                            <td class="td-point">최우재</td>
                                            <td>중소기업융합 대전세종충남연합회 사무국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">장홍섭</td>
                                            <td>대전광역시의사회 사무처장</td>
                                            <td class="td-point">박진호</td>
                                            <td>대전개발위원회 부회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이장희</td>
                                            <td>대전광역시교육청 총무과장</td>
                                            <td class="td-point">최연수</td>
                                            <td>대전KBS 총무국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이재근</td>
                                            <td>MBC대전문화방송 경영기술국장</td>
                                            <td class="td-point">유병은</td>
                                            <td>한국철도공사 미래전략실 사회가치처 부장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                             <h4 class="title-heading_a mg-t-m">평가지원단</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                <table summary="평가지원단">
                                    <caption>평가지원단 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">평가지원단장</th>
                                            <td class="td-point">이현수</td>
                                            <td colspan="3">대전광역자활센터 센터장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="6">평가지원단</th>
                                            <td class="td-point">김선경</td>
                                            <td>서구지역자활센터 센터장</td>
                                            <td class="td-point">변기섭</td>
                                            <td>사회복지법인 밀알 본부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이종옥</td>
                                            <td>행복마을 사무국장</td>
                                            <td class="td-point">임현숙</td>
                                            <td>대전광역시가정위탁지원센터관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김화종</td>
                                            <td>대덕구노인종합복지관 부장</td>
                                            <td class="td-point">윤향미</td>
                                            <td>판암장애인보호작업장 원장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">성은경</td>
                                            <td>유성구장애인종합복지관 지역연계팀장</td>
                                            <td class="td-point">김미애</td>
                                            <td>선우노인복지센터 시설장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">남영시</td>
                                            <td>서구노인복지관 사무국장</td>
                                            <td class="td-point">이재훈</td>
                                            <td>천양원 원장</td>
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
        
