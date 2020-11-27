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
                <button type="button" class="prev-menu" onclick="javascript:goMovePage(this);">사업성과</button>
                <button type="button" class="next-menu" onclick="javascript:goMovePage(this);">걸어온 길</button>
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
                                        <div class="group-imgbox"><img src="/common/img/contents/group_img16.jpg" alt=""></div>
                                        
                                        <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                        <div class="fake-table-box">
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">유병설</dt>
                                                <dd class="fake-table-td">
                                                    <p>사무국 운영총괄</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>ybs2@chest.or.kr</p> -->
                                                </dd>
                                            </dl>
                                        </div>                                        
                                        <h4 class="title-heading_a mg-t-l">사업관리팀</h4>
                                        <div class="fake-table-box">
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">팀장 신희정</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 사업관리업무 총괄 <br>
                                                       - 사업계획 및 예산관리총괄, 위원회 운영 및 관리(운영위원회, 시민참여위원회)   
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6710</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>deborah2000@chest.or.kr</p> -->
                                                </dd>
                                                <dt class="fake-table-th">대리 박소라</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 회계, 총무, 구매, 기획, 교육, 인사</p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6703</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>psr@chest.or.kr</p> -->
                                                </dd>
                                            </dl>
                                        </div>
                                        <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                        <div class="fake-table-box">
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">팀장 신희정</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 모금사업 총괄<br>
                                                    - 팀 관리 및 지회평가 , 위원회 운영 및 관리(모금분과실행위원회)<br>
                                                    - 아너소사이어티 개발 
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6710</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>deborah2000@chest.or.kr</p> -->
                                                </dd>
                                                <dt class="fake-table-th">대리 박윤주</dt>
                                                <dd class="fake-table-td">
                                                    <p>- CSR기업관리(토지주택공사, 셰플러, 현대로템, 한국지엠) <br>
                                                    - 나눔리더, 나눔리더스클럽 관리<br>
                                                    - 지역연계모금(시·군 협약사업)<br>
                                                    - 학교모금<br>
                                                    - 유공자포상식<br>
                                                    - 신규기부자 개발(창원의창구, 진주, 산청, 함양, 거창)<br>
                                                    - 모금통계
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6711</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>yunju@chest.or.kr</p> -->
                                                </dd>
                                            </dl>
                                            
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">대리 박기훈</dt>
                                                <dd class="fake-table-td">
                                                    <p>- CSR기업관리(현대위아, 삼성중공업, 남동발전, 경남개발공사)<br>
                                                    - 직장인나눔캠페인 관리<br>
                                                    - 지역연계모금(지역사회보장협의체, 지정형시·군협약사업)<br>
                                                    - 금융권협약모금(경남은행, 농협중앙회)<br>
                                                    - 기업사회공헌워크샵<br>
                                                    - 신규기부자 개발(성산구, 거제, 통영, 함안, 의령)<br>
                                                    - 홍보사업, 서무
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6714</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>pkh@chest.or.kr</p> -->
                                                </dd>
                                                <dt class="fake-table-th">대리 김정아</dt>
                                                <dd class="fake-table-td">
                                                    <p>- CSR기업관리(두산중공업 및 계열사, STX복지재단, 슬레이트 및 람사르협약기업 기부자관리, 한국마사회)<br>
                                                    - 지자체관리(시·군 간담회, 순회모금)<br>
                                                    - 이벤트·특별모금<br>
                                                    - 언론사모금/일용직관리<br>
                                                    - 신규기부자개발(창원마산회원구, 합포구, 김해, 밀양, 창녕, 합천)<br>
                                                    - 영수증발급총괄
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6713</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>cuteahya@chest.or.kr</p> -->
                                                </dd>
                                            </dl>
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">대리 이민우</dt>
                                                <dd class="fake-table-td">
                                                    <p>- CSR기업관리(사천KAI, 한화)<br>
                                                    - 착한가게, 착한가정, 연합모금<br>
                                                    - 사랑의계좌모금(일반/지정)<br>
                                                    - 신규기부자개발(창원시진해구, 사천, 양산, 고성, 하동, 남해),<br>
                                                    - 나눔봉사단관리<br>
                                                    - 모금함관리
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6712</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>sin6107@chest.or.kr</p> -->
                                                </dd>
                                                <dt class="fake-table-th">주임 정진혁</dt>
                                                <dd class="fake-table-td">
                                                    <p>- CSR기업관리(NC다이노스, LG세이커스)<br>
                                                    - 현물모금 및 배분(경남은행, 크린랩, 리클라인, 롯데워터파크 등)
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6728</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>cjy@chest.or.kr</p> -->
                                                </dd>
                                            </dl>
                                        </div>
                                        <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                        <div class="fake-table-box">
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">팀장 이은경</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 배분사업 총괄<br>
                                                    - 팀관리 및 예산관리 <br>  
                                                    - 위원회 운영 및 관리(배분분과실행위원회)<br>  
                                                    - 중앙회 기획사업                                                       
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6720</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>cuty313@chest.or.kr</p> -->
                                                </dd>
                                                <dt class="fake-table-th">대리 권효정</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 신청사업, 기획사업(소규모 지원사업)<br>
                                                    - 특별성금 배분<br>
                                                    - 배분사업 실적/통계<br>
                                                    - 배분사례 발굴 및 실적관리
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6723</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>jesuslovehj@chest.or.kr</p> -->
                                                </dd>
                                            </dl> 
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">대리 이미숙</dt>
                                                <dd class="fake-table-td">
                                                    <p>- CSR기업배분(현대위아, 남동발전, 삼성중공업, 토지주택공사) <br>
                                                    - 기획사업(지역연계협약사업)
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6722</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>leems@chest.or.kr</p> -->
                                                </dd>
                                                <dt class="fake-table-th">대리 정혜빈</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 기획사업<br>
                                                    - 지역사회욕구조사(협회장/배분기관 간담회, 기획사업 소위원회, F.G.I) 
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6721</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>sunny@chest.or.kr</p> -->
                                                </dd>
                                            </dl>
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">대리 이희은</dt>
                                                <dd class="fake-table-td">
                                                    <p>- CSR기업배분(두산중공업, 한국항공우주, 마사회)<br>
                                                    - 지정기탁사업(총괄 및 잔액관리, 기관정기, 전입금),<br>
                                                    - 배분사업평가관리(평가지원단/회계법인, 배분사업평가 총괄)                              
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6724</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>he.lee@chest.or.kr</p> -->
                                                </dd>
                                                <dt class="fake-table-th">주임 강성민</dt>
                                                <dd class="fake-table-td">
                                                    <p>- CSR기업배분(한국지엠, 세플러, 센트랄)<br>
                                                    - 연합모금(슬레이트지붕개량, 람사르재단)
                                                    - 기획사업(연합모금)<br>
                                                    - 지정기탁사업(기관 일시)
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6725</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>kang0630@chest.or.kr</p> -->
                                                </dd>
                                            </dl>
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">주임 최은미</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 기획사업(명절/월동난방비 지원)<br>
                                                    - 긴급지원사업 
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6726</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>cem@chest.or.kr</p> -->
                                                </dd>
                                                <dt class="fake-table-th">주임 박지연</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 지정기탁사업(개인 일시/정기)<br>
                                                    - 지정기탁사업(지역사회보장협의체, 지자체연계모금)
                                                    </p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6727</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>jm100@chest.or.kr</p> -->
                                                </dd>
                                            </dl>
                                            <dl class="fake-table-item">
                                                <dt class="fake-table-th">주임 하예지</dt>
                                                <dd class="fake-table-td">
                                                    <p>- 복권기금사업, 차량관리, 서무</p>
                                                    <p><i class="sprite-group-tel"></i>055-270-6729</p>
                                                    <!-- <p><i class="sprite-group-mail"></i>hyj@chest.or.kr</p> -->
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
                                            <p class="person-position">10대 회장</p>
                                            <p class="person-time">현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman1_16_1.jpg" alt=""></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">강기철</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>1957년 1월 21일</dt>
                                                    <dd>출생<br>마산상고(현 용마고) 졸업<br>창신대학교 일본어학과 졸업<br>경남대학교 경영대학원 수료</dd>
                                                    <dt>[경 력]</dt>
                                                    <dd>대일전기(주) 대표이사(현)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>창원상공회의소 상임위원(현)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>한국전기공사협회 장학회 이사장(현)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>한국전기공사 공제조합 감사(현)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>한국전기공사협회 경남도회 제15대 회장(전)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>창원신촌공단협의회 회장(현)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>국제로타리 3722지구 동마산로타리클럽 회장(전)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>국제로타리 3722지구 2017-18년도 총재</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>국제로타리 3722지구 재단 위원장(현)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>마산 3·15 기념 사업회 감사(현)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>마산용마고등학교 총동창회 부회장(현)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>마산월포초등학교 총동창회 회장(전)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>KBS창원방송총국 시청자 위원(전)</dd>
                                                    <dt>&nbsp;</dt>
                                                    <dd>사랑의열매 경남사회복지공동모금회장(현)</dd>
                                                </dl>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 
                                    <div class="btn-area mg-t-l">
                                        <a href="" class="btn-base-imp">역대회장</a>
                                    </div>
                                    -->
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
                                                <td class="td-point">강기철</td>
                                                <td colspan="3">㈜대일전기 대표</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="7">위 원</th>
                                                <td class="td-point">강외숙</td>
                                                <td>경상남도사회복지협의회장</td>
                                                <td class="td-point">구주모</td>
                                                <td>경남도민일보 대표이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김은경</td>
                                                <td>창원대학교 가족복지학과 교수</td>
                                                <td class="td-point">신종우</td>
                                                <td>경상남도 복지보건국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박윤규</td>
                                                <td>박윤규치과의원 원장</td>
                                                <td class="td-point">정대균</td>
                                                <td>(주)MBC경남 대표이사 사장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최광주</td>
                                                <td>경남신문 대표이사 회장</td>
                                                <td class="td-point">하원</td>
                                                <td>KBS창원방송총국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최광주</td>
                                                <td>경남신문 대표이사 회장</td>
                                                <td class="td-point">하원</td>
                                                <td>KBS창원방송총국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">하춘광</td>
                                                <td>경남대학교 사회복지학과 교수</td>
                                                <td class="td-point">김은철</td>
                                                <td>우덕회계법인 회계사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">황진한</td>
                                                <td colspan="3">변호사 황진한 법률사무소</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 운영위원회 -->
                        <!-- S : 분과실행위원회 -->
                        <section class="ui-tab-pnl"  id ="pnl3" >
                            <div class="tab-contents">
                                <h4 class="title-heading_a mg-t-m">배분분과실행위원회</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="배분분과실행위원회">
                                            <caption>배분분과실행위원회 정보입니다.</caption>
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
                                                <td class="td-point">김은경</td>
                                                <td colspan="3">창원대학교 가족복지학과 교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">정민화</td>
                                                <td colspan="3">경남종합사회복지관 관장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="7" class="no-line">위원</th>
                                                <td class="td-point">정영민</td>
                                                <td>문성대학교 사회복지과 교수</td>
                                                <td class="td-point">김경호</td>
                                                <td>경남과학기술대학교 사회복지학과</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김용태</td>
                                                <td>인 건축사사무소 소장</td>
                                                <td class="td-point">문수열</td>
                                                <td>진주보건대학교 사회복지계열 부교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">백종규</td>
                                                <td>창신대학교 사회복지학과 교수</td>
                                                <td class="td-point">윤일근</td>
                                                <td>안경회계법인경남본부 회계사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이수경A</td>
                                                <td>거제대학교 사회복지학과 교수</td>
                                                <td class="td-point">이수경B</td>
                                                <td>이수경 법률사무소 변호사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이온유</td>
                                                <td>한국이주여성인권지원센터 경남지부장</td>
                                                <td class="td-point">이인숙</td>
                                                <td>부산장신대학교 사회복지상담학과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">유정제</td>
                                                <td>경상남도 복지정책담당 사무관</td>
                                                <td class="td-point">장윤정</td>
                                                <td>경남대학교 사회복지학과 교수</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <h4 class="title-heading_a mg-t-m">모금분과실행위원회</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="모금분과실행위원회">
                                            <caption>모금분과실행위원회 정보입니다.</caption>
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
                                                <td class="td-point">강기철</td>
                                                <td colspan="3">㈜대일전기 대표</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="2">부위원장</th>
                                                <td class="td-point">김충환</td> 
                                                <td colspan="3">부산대학교 스포츠과학부 교수</td> 
                                            </tr> 
                                            <tr>
                                                <td class="td-point">심창민</td>
                                                <td colspan="3">창원문성대학 광고디자인과 교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="6" class="no-line">위원</th>
                                                <td class="td-point">김두용</td>
                                                <td>BNK금융그룹 경남은행사회공헌팀장</td>
                                                <td class="td-point">김정우</td>
                                                <td>농협은행 경남본부 공공지원단장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김해문</td>
                                                <td>경상남도자원봉사센터 사무국장</td>
                                                <td class="td-point">권양근 </td>
                                                <td>경상남도 복지정책과장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박영기</td>
                                                <td>LG헬로비전 경남방송 PD</td>
                                                <td class="td-point">신용우</td>
                                                <td>창원상공회의소 경영지원본부장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이병선</td>
                                                <td>KBS창원방송총국 총무부장</td>
                                                <td class="td-point">이상규</td>
                                                <td>경남신문사 사회부장</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <h4 class="title-heading_a mg-t-m">배분사업평가지원단</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="배분사업평가지원단">
                                            <caption>배분사업평가지원단 정보입니다.</caption>
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
                                                <td class="td-point">박현태</td>
                                                <td colspan="3">사회복지단체 두리나리 사무국장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="8" class="no-line">단원</th>
                                                <td class="td-point">김득건</td>
                                                <td>창녕군장애인근로사업장 사무국장</td>
                                                <td class="td-point">김윤경</td>
                                                <td>거제시종합사회복지관 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김윤정</td>
                                                <td>경상남도사회서비스원 시설운영팀</td>
                                                <td class="td-point">김학천</td>
                                                <td>창녕군장애인종합복지관 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">서수정</td>
                                                <td>경남노인보호전문기관 관장</td>
                                                <td class="td-point">유기용</td>
                                                <td>미래직업재활원 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">조성환</td>
                                                <td>성산노인종합복지관 과장</td>
                                                <td class="td-point">주용수</td>
                                                <td>창원시진해노인종합복지관 부관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최문경</td>
                                                <td>경남장애인종합복지관팀장</td>
                                                <td class="td-point">강미정</td>
                                                <td>창원여성의집 관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김보나</td>
                                                <td>지역아동센터경상남도지원단 단장</td>
                                                <td class="td-point">김지현</td>
                                                <td>사회복지법인 한얼진주요양원 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">류학기</td>
                                                <td>산엔청복지관 사무국장</td>
                                                <td class="td-point">정민규</td>
                                                <td>통영시종합사회복지관 과장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">조정혜</td>
                                                <td>로뎀의집 관장</td>
                                                <td class="td-point">최혜숙</td>
                                                <td>고성정신요양원 사무국장</td>
                                            </tr>
<!--                                             <tr> -->
<!--                                                 <td class="td-point">최문경</td> -->
<!--                                                 <td colspan="3">경남장애인종합복지관팀장</td> -->
<!--                                             </tr> -->
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
        
