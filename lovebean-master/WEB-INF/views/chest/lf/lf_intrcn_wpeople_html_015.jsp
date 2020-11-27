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
                                    <div class="group-imgbox"><img src="/common/img/contents/group_img15.jpg" alt=""></div>
                                    <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                    <div class="fake-table-box">
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">정동의</dt>
                                            <dd class="fake-table-td">
                                                <p>사무국 운영총괄</p>
                                                <!-- <p><i class="sprite-group-mail"></i>vtcn1@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                    </div>
                                    <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                                    <div class="fake-table-box">
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">팀장 이원경</dt>
                                            <dd class="fake-table-td">
                                                <p>● 경영관리팀 업무총괄 <br>
                                                ● 운영위원회 <br>
                                                ● 시민참여위원회</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7806</p>
                                               <!--  <p><i class="sprite-group-mail"></i>yes@chest.or.kr</p> -->
                                            </dd>
                                            <dt class="fake-table-th">주임 김영민</dt>
                                            <dd class="fake-table-td">
                                                <p>● 회계,  세무, 교육<br>
                                                ● 인사, 교육</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7801</p>
                                                <!-- <p><i class="sprite-group-mail"></i>kym9010@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">주임 김일향</dt>
                                            <dd class="fake-table-td">
                                                <p>● 총무업무<br>
                                                ● 홍보 및 이벤트 업무</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7803</p>
                                                <!-- <p><i class="sprite-group-mail"></i>khy0965@chest.or.kr</p> -->
                                            </dd>
                                            <!-- 
                                            <dt class="fake-table-th">주임 손영광</dt>
                                            <dd class="fake-table-td">
                                                <p>- 나눔교육업무</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7808</p>
                                                <p><i class="sprite-group-mail"></i>syj2755@chest.or.kr</p>
                                            </dd> -->
                                        </dl>
                                    </div>
                                    <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                    <div class="fake-table-box">
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">팀장 김종원</dt>
                                            <dd class="fake-table-td">
                                                <p>● 모금 관련업무 총괄 운영 및 조정</p>
												<p>● 사업계획서 및 사업 예산 조정</p>
												<p>● 모금분과실행위원회 운영</p>
												<p>● 희망나눔캠페인 계획</p>
												<p>● 모금실적 / 데이터분석 / 통계관리</p>
												<p>● 지회평가 업무</p>
												<p>● 대외협력 업무 및 전달식 (회장,사무처장 수행)</p>
												<p>● 기부금 지출관리</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7811</p>
                                                <!-- <p><i class="sprite-group-mail"></i>dg011@chest.or.kr</p> -->
                                            </dd>
                                            <dt class="fake-table-th">대리 장성익</dt>
                                            <dd class="fake-table-td">
                                                <p>● 아너소사이어티 업무(총괄)</p>
												 <p>- 희망자산나눔, 착한권리나눔 추진</p>
												 <p>● 학교모금(난치병학생돕기사업 포함) 업무</p>
												 <p>● 사업계획서 및 사업 예산 작성</p>
												 <p>● 지역연계모금사업(모금/배분)</p>
												 <p>- 경주시, 예천군, 청송군, 영양군</p>
												 <p>● 연합모금사업(모금/배분)</p>
												 <p>- 해당지역 협의체</p>
												 <p>● 기업사회공헌사업 : 해당지역</p>
												 <p>- 한수원(본사), 월성원자력본부, 경북개발공사</p>
												<p><i class="sprite-group-tel"></i>053-980-7812</p>
                                                <!-- <p><i class="sprite-group-mail"></i>jmas@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">대리 이승환</dt>
                                            <dd class="fake-table-td">
                                                <p>● 희망나눔캠페인 추진</p>
												<p>- 캠페인출범식, 방송모금, 폐막식 등</p>
												<p>● 지역연계모금사업(모금/배분)</p>
												<p>- 김천시, 문경시, 고령군, 기타</p>
												<p>● 기업사회공헌사업(총괄) : 해당지역</p>
												<p>- 삼성, 한국도로공사, 한국전력기술</p>
												<p>- 나눔명문기업</p>
												<p>● 연합모금사업(모금/배분)</p>
												<p>- 해당지역 협의체, 경북체육회 </p>
												<p>● 시군간담회/워크샵 </p>
                                                <p><i class="sprite-group-tel"></i>053-980-7802</p>
                                                <!-- <p><i class="sprite-group-mail"></i>lsh@chest.or.kr</p> -->
                                            </dd>
                                            <dt class="fake-table-th">대리 함초롬</dt>
                                            <dd class="fake-table-td">
                                                <p>● 고향사랑나눔운동사업(총괄)</p>
												 <p>● 유공자포상 관련 업무(유공자포상식 포함)</p>
												 <p>● 지역연계모금사업(모금/배분)</p>
												 <p>- 포항시, 안동시, 울릉군 </p>
												 <p>● 기업사회공헌사업 : 해당지역</p>
												 <p>● 연합모금사업(모금/배분)</p>
												 <p>- 해당지역 협의체, 소방본부</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7816</p>
                                               <!--  <p><i class="sprite-group-mail"></i>choromham@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">주임 양승엽</dt>
                                            <dd class="fake-table-td">
                                                <p>● 나눔리더, 나눔리더스클럽 업무(총괄)</p>
												 <p>● 모금 통계 관리(희망나눔캠페인포함)</p>
												 <p>● 지역연계모금사업(모금/배분)</p>
												 <p>- 구미시, 경산시, 봉화군, 성주군</p>
												 <p>● 기업사회공헌사업 : 해당지역</p>
												 <p>● 연합모금사업(모금/배분)(총괄)</p>
												 <p>- 해당지역 협의체, 중앙매칭 </p>
												 <p>● 홈페이지기부(신용카드, 핸드폰 기부 등) 업무</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7804</p>
                                                <!-- <p><i class="sprite-group-mail"></i>ysy9057@chest.or.kr</p> -->
                                            </dd>
                                            <dt class="fake-table-th">주임 이세영</dt>
                                            <dd class="fake-table-td">
                                                <p>● 현물기부사업(모금/배분)</p>
												<p>● 연합모금사업(모금/배분)</p>
												<p>- 연탄본부, 기타 등</p>
												<p>● 자원봉사자관리(VMS교육 포함)</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7815</p>
                                                <!-- <p><i class="sprite-group-mail"></i>young1101@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">주임 김보규</dt>
                                            <dd class="fake-table-td">
                                                <p>● CMS 관리업무(1도민1나눔포함)(총괄)</p>
												<p>- 정기기부자관리 </p>
												<p>● 착한일터/착한가정 사업 추진(총괄)</p>
												<p>● 지역연계모금사업(모금/배분)</p>
												<p>- 영주시, 상주시, 의성군, 청도군</p>
												<p>● 기업사회공헌사업 : 해당지역 </p>
												<p>● 연합모금사업(모금/배분)</p>
												<p>- 해당지역 협의체</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7814</p>
                                                <!-- <p><i class="sprite-group-mail"></i>dmsgp3125@chest.or.kr</p> -->
                                            </dd>
                                            <dt class="fake-table-th">주임 천소영</dt>
                                            <dd class="fake-table-td">
                                                <p>● 사랑의열매 나눔봉사단 업무(총괄)</p>
												<p>● 착한가게(릴레이캠페인 포함) 업무(총괄)</p>
												<p>● 지역연계모금사업(모금/배분)</p>
												<p>- 영천시, 군위군, 영덕군, 칠곡군, 울진군</p>
												<p>● 기업사회공헌사업 : 해당지역</p>
												<p>● 연합모금사업(모금/배분)</p>
												<p>- 해당지역 협의체 </p>
                                                <p><i class="sprite-group-tel"></i>053-980-7817</p>
                                                <!-- <p><i class="sprite-group-mail"></i>csy6187@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                    </div>
                                    <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                    <div class="fake-table-box">
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">팀장 임해은</dt>
                                            <dd class="fake-table-td">
                                                <p>● 배분업무 총괄</p>
												<p>● 배분분과실행위원회 운영 </p>
												<p>● 평가지원단 운영관리</p>
												<p>● 배분사업 계획/예산 관리</p>
												<p>● 지회평가 관련 업무</p>
												<p>● 배분관련 대외협력업무</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7821</p>
                                                <!-- <p><i class="sprite-group-mail"></i>dg008@chest.or.kr</p> -->
                                            </dd>
                                            <dt class="fake-table-th">대리 김명현</dt>
                                            <dd class="fake-table-td">
                                                <p>● 기획사업</p>
												<p>- 중앙 기획사업 (전국기획사업 등)</p>
												<p>- 함께하는 명절 행복나눔 지원사업(기관지원)</p>
												<p>- 의제 기반 복지현안지원사업 (신규 기획사업)</p>
												<p>● 지정기탁사업</p>
												<p>- 기업지정 : 포스코, 삼성, 한수원, 풍산 등</p>
												<p>- 특별모금 배분사업</p>
												<p>● 배분사업 평가 </p>
												<p>● 배분기획 및 욕구조사(간담회, FGI등)</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7832</p>
                                                <!-- <p><i class="sprite-group-mail"></i>naralove928@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">대리 김준현</dt>
                                            <dd class="fake-table-td">
                                                <p>● 기획사업</p>
												<p>- 소규모복지기관 지원사업 </p>
												<p>- 명절위문금 지원사업(개인) </p>
												<p>- 따뜻한 겨울나기 지원사업(개인/기관)</p>
												<p>- 사랑의열매 차량지원사업 </p>
												<p>- 기타 신규기획사업 / 중앙 1318 열매캠프 관련</p>
												<p>● 긴급지원사업 / 시지역(상시)</p>
												<p>- 긴급지원사업 배분계획 및 지침관리 등</p>
												<p>● 차량 연간보고서 접수 및 관리</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7822</p>
                                                <!-- <p><i class="sprite-group-mail"></i>mcpred@chest.or.kr</p> -->
                                            </dd>
                                            <dt class="fake-table-th">주임 강초롱</dt>
                                            <dd class="fake-table-td">
                                                <p>● 신청사업 </p>
												<p>● 기획사업</p>
												<p>- 한부모 조손가정 자녀 지원사업</p>
												<p>- 취약계층 문화격차 해소사업 ‘열매야 놀자’ </p>
												<p>- 기타 신규기획사업</p>
												<p>● 지정기탁사업 </p>
												<p>- 난치병치료비 지원사업 배분</p>
												<p>- 연합모금사업 배분(중앙매칭, 행복금고 등)</p>
												<p>● 배분사업 설명회 및 배분전달식/지원기관 교육 등</p>
												<p>● 배분실적 관리(배분내역, 실적 및 현황관리)</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7807</p>
                                                <!-- <p><i class="sprite-group-mail"></i>rong216@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                        <dl class="fake-table-item">
                                        	<dt class="fake-table-th">주임 김혜연</dt>
                                            <dd class="fake-table-td">
                                                <p>● 기획사업</p>
												<p>- 시원한 여름나기 지원사업 </p>
												<p>- 기타 신규기획사업</p>
												<p>● 지정기탁사업 </p>
												<p>- 일시 지정기탁사업 배분(기관)</p>
												<p>- 월정기 지정기탁사업 배분(기관)</p>
												<p>- 중앙전출 지정기탁 </p>
                                                <p><i class="sprite-group-tel"></i>053-980-7835</p>
                                                <!-- <p><i class="sprite-group-mail"></i>nova@chest.or.kr</p> -->
                                            </dd>
                                            
                                            <dt class="fake-table-th">주임 김신성</dt>
                                            <dd class="fake-table-td">
                                                <p>● 복권기금사업</p>
												<p>- 야간보호사업</p>
												<p>- 방학지원사업</p>
												<p>- 가족기능 강화사업</p>
												<p>● 긴급지원사업 / 군지역(상시)</p>
												<p>● 복권기금사업 설명회 및 전달식/지원기관 교육 등</p>
                                                <p><i class="sprite-group-tel"></i>053-980-7834</p>
                                                <!-- <p><i class="sprite-group-mail"></i>nova@chest.or.kr</p> -->
                                            </dd>
                                        </dl>
                                        <dl class="fake-table-item">
                                            <dt class="fake-table-th">대리 김미주</dt>
                                            <dd class="fake-table-td">
                                                <p>- 출산휴가 및 육아휴직: 2020. 04. 01.~2021. 06. 30.</p>
                                                <p><i class="sprite-group-tel"></i>-</p>
                                                <!-- <p><i class="sprite-group-mail"></i>kmiju@chest.or.kr</p> -->
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
                                            <p class="person-time">2020년~현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman1_15.jpg" alt=""></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">전우헌</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[학력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>74. 03. ~ 77. 02.</dt>
                                                    <dd>경북고등학교</dd>
                                                    <dt>77. 03. ~ 81. 02.</dt>
                                                    <dd>영남대학교 행정학(학사)</dd>
                                                    <dt>02. 03. ~ 04. 08.</dt>
                                                    <dd>경북대학교 경영학(석사)</dd>
                                                </dl>

                                                <p class="person-profile-tit">[주요경력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>09. 02. ~ 14. 12.</dt>
                                                    <dd>삼성전자 구미사업장 공장장(전무)</dd>
                                                    <dt>14. 12. ~ 16. 12.</dt>
                                                    <dd>삼성전자 고문</dd>
                                                    <dt>18. 08. 14. ~ 20. 08. 14.</dt>
                                                    <dd>前)경상북도 경제부지사</dd>
                                                    <dt>20. 11. 02. ~ 현재 </dt>
                                                    <dd>경북사회복지공동모금회 회장</dd>
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
                                                <col class="col-w02">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row">회장</th>
                                                <td class="td-point">전우헌</td>
                                                <td colspan="3">경북사회복지공동모금회장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부회장</th>
                                                <td class="td-point">이재동</td>
                                                <td colspan="3">前) 대한변호사협회 부협회장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="6" >위원</th>
                                                <td class="td-point">권철순</td>
                                                <td>㈜거산 대표이사</td>
                                                <td class="td-point">김교영</td>
                                                <td>매일신문 경북본사장</td>
                                            </tr>
                                            <tr>

                                                <td class="td-point">김실화</td>
                                                <td>TBC 편성제작 국장</td>
                                                <td class="td-point">도 선</td>
                                                <td>영주시장애인종합복지관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박윤규</td>
                                                <td>영남일보 편집국장</td>
                                                <td class="td-point">이강창</td>
                                                <td>경상북도 복지건강국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이성훈</td>
                                                <td>대구MBC 경영국장</td>
                                                <td class="td-point">이종선</td>
                                                <td>KBS 대구방송총국 시청자서비스국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이진복</td>
                                                <td>경북사랑의열매 나눔봉사단 도단장</td>
                                                <td class="td-point">조정문</td>
                                                <td>경북상공회의소 협의회장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">황경희</td>
                                                <td colspan="3">㈜미래인더스 대표이사</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="3" class="no-line">감사</th>
                                                <td class="td-point">김용신</td>
                                                <td colspan="3">공인회계사/세무사 김용신사무소 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김인수</td>
                                                <td colspan="3">김인수 법률사무소 대표</td>
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
                                <h4 class="title-heading_a mg-t-m">모금분과 실행위원회</h4>
                                <div class="tb-type_c">
                                    <table summary="모금분과실행위원회">
                                        <caption>모금분과실행위원회 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">이진복</td>
                                            <td>경북사랑의열매 나눔봉사단 도단장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="2">부위원장</th>
                                            <td class="td-point">박세왕</td>
                                            <td>국제라이온스 356-E(경북)지구 사무국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">권순길</td>
                                            <td>경상북도의사회 사무처장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="7">모금위원</th>
                                            <td class="td-point">강남규</td>
                                            <td>㈜삼성전자 구미스마트시티 사회공헌센터 부장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김경미</td>
                                            <td>경북여성기업인협의회 회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김상태</td>
                                            <td>前) 포항시상공회의소 사무처장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">송진향</td>
                                            <td>대한건설협회 경상북도회 실장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이승석</td>
                                            <td>경상북도약사회 사무국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">임현석</td>
                                            <td>대구문화방송 경영총괄팀 계획관</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">홍근영</td>
                                            <td>경상북도한의사회 사무국장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <h4 class="title-heading_a mg-t-m">배분분과 실행위원회</h4>
                                <div class="tb-type_c">
                                    <table summary="배분분과실행위원회">
                                        <caption>배분분과실행위원회 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">이재동</td>
                                            <td>前)대한변호사협회 부협회장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="2">부위원장</th>
                                            <td class="td-point">박현민</td>
                                            <td>군위노인복지센터 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이미영</td>
                                            <td>대구상담복지센터 대표</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="10">배분위원</th>
                                            <td class="td-point">진원식</td>
                                            <td>경북도청 사회복지과 과장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">유영준</td>
                                            <td>대구가톨릭대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">조영진</td>
                                            <td>경상북도의회 입법지원팀 팀장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박영준</td>
                                            <td>대구대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이경희</td>
                                            <td>영진전문대학교 사회복지과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">홍일권</td>
                                            <td>성도이현회계법인 공인회계사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김정엽</td>
                                            <td>대구한의대학교 노인복지학전공 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김정은</td>
                                            <td>위덕대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">신우현 </td>
                                            <td>DGB사회공헌재단 차장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정성일</td>
                                            <td>안동과학대학교 사회복지과 교수</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <h4 class="title-heading_a mg-t-m">나눔봉사단</h4>
                                <div class="tb-type_c">
                                    <table summary="나눔봉사단">
                                        <caption>나눔봉사단 정보입니다.</caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">구분</th>
                                            <th>명예단장</th>
                                            <th>단장</th>
                                        </tr>
                                        <tr>
                                            <td class="align-c">경상북도</td>
                                            <td class="align-c">김재덕</td>
                                            <td class="align-c">이진복</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">포항시</td>
                                            <td class="align-c">최혜련</td>
                                            <td class="align-c">임재선</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">경주시</td>
                                            <td class="align-c">김은미</td>
                                            <td class="align-c">최대락</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">김천시</td>
                                            <td class="align-c">박경자</td>
                                            <td class="align-c">박유순</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">안동시</td>
                                            <td class="align-c">송채령</td>
                                            <td class="align-c">김옥희</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">구미시</td>
                                            <td class="align-c">김창숙</td>
                                            <td class="align-c">조중래</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">영주시</td>
                                            <td class="align-c">권정희</td>
                                            <td class="align-c">정옥희</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">영천시</td>
                                            <td class="align-c">이호성</td>
                                            <td class="align-c">이춘자</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">상주시</td>
                                            <td class="align-c">최은경</td>
                                            <td class="align-c">임주원</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">문경시</td>
                                            <td class="align-c">허은숙</td>
                                            <td class="align-c">신윤교</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">경산시</td>
                                            <td class="align-c">이계숙</td>
                                            <td class="align-c">김세준</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">군위군</td>
                                            <td class="align-c">박인순</td>
                                            <td class="align-c">사공은자</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">의성군</td>
                                            <td class="align-c">김윤희</td>
                                            <td class="align-c">서경숙</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">청송군</td>
                                            <td class="align-c">김옥자</td>
                                            <td class="align-c">서옥자</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">영양군</td>
                                            <td class="align-c">강성미</td>
                                            <td class="align-c">주익환</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">영덕군</td>
                                            <td class="align-c">박민혜</td>
                                            <td class="align-c">박진현</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">청도군</td>
                                            <td class="align-c">김미연</td>
                                            <td class="align-c">박지영</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">고령군</td>
                                            <td class="align-c">차영귀</td>
                                            <td class="align-c">여민수</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">성주군</td>
                                            <td class="align-c">김이숙</td>
                                            <td class="align-c">이월봉</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">칠곡군</td>
                                            <td class="align-c">장세연</td>
                                            <td class="align-c">임보숙</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">예천군</td>
                                            <td class="align-c">이미영</td>
                                            <td class="align-c">장경숙</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">봉화군</td>
                                            <td class="align-c">유채선</td>
                                            <td class="align-c">심재덕</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">울진군</td>
                                            <td class="align-c">최상숙</td>
                                            <td class="align-c">이장출</td>
                                        </tr>
                                        <tr>
                                            <td class="align-c">울릉군</td>
                                            <td class="align-c">한남조</td>
                                            <td class="align-c">장금숙</td>
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
        
