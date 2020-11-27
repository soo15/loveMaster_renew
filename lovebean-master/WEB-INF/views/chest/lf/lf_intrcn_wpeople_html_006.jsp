
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
                            <div class="group-imgbox"><img src="/common/img/contents/group_img06.jpg" alt=""></div>
                            <h4 class="title-heading_a mg-t-l">사무처장</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">이성도</dt>
                                    <dd class="fake-table-td">
                                        <p>운영 총괄</p>
                                        <p><i class="sprite-group-tel"></i>062-654-9077</p>
                                        <!-- <p><i class="sprite-group-mail"></i>lsdmars@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 박동영</dt>
                                    <dd class="fake-table-td">
                                        <p>모금사업팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>062-654-9078</p>
                                        <!-- <p><i class="sprite-group-mail"></i>riopark@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김광희</dt>
                                    <dd class="fake-table-td">
                                        <p>아너 소사이어티, 나눔리더스 및 리더스클럽, 현물모금</p>
                                        <p><i class="sprite-group-tel"></i>062-222-3562</p>
                                        <!-- <p><i class="sprite-group-mail"></i>skw@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김지희</dt>
                                    <dd class="fake-table-td">
                                        <p>법인모금, 착한일터, 연합모금, 특별모금, 홍보</p>
                                        <p><i class="sprite-group-tel"></i>062-222-3567</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kjh3526@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">주임 오유진</dt>
                                    <dd class="fake-table-td">
                                        <p>CMS모금, 동연합모금, 착한가게, 착한가정</p>
                                        <p><i class="sprite-group-tel"></i>062-222-3569</p>
                                        <!-- <p><i class="sprite-group-mail"></i>onlysun@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 배정봉</dt>
                                    <dd class="fake-table-td">
                                        <p>배분사업팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>062-654-9079</p>
                                        <!-- <p><i class="sprite-group-mail"></i>bjbdsm@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 염지형</dt>
                                    <dd class="fake-table-td">
                                        <p>육아휴직</p>
<!--                                         <p><i class="sprite-group-tel"></i>062-222-3551</p> -->
<!--                                         <p><i class="sprite-group-mail"></i>westside7683@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 김보미</dt>
                                    <dd class="fake-table-td">
                                        <p>육아휴직</p>
                                        <p><i class="sprite-group-tel"></i>062-222-3572</p>
                                        <!-- <p><i class="sprite-group-mail"></i>borage@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">대리 김지선</dt>
                                    <dd class="fake-table-td">
                                        <p>공모형지정, 비정기지정배분</p>
                                        <p><i class="sprite-group-tel"></i>062-222-3561</p>
                                        <!-- <p><i class="sprite-group-mail"></i>mooneey@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">대리 이초희</dt>
                                    <dd class="fake-table-td">
                                        <p>신청,기획</p>
                                        <p><i class="sprite-group-tel"></i>062-222-3554</p>
                                        <!-- <p><i class="sprite-group-mail"></i>saen8265@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">주임 문서영</dt>
                                    <dd class="fake-table-td">
                                        <p>복권기금사업</p>
                                        <p><i class="sprite-group-tel"></i>062-222-1885</p>
                                        <!-- <p><i class="sprite-group-mail"></i>mooneey@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">주임 윤새진</dt>
                                    <dd class="fake-table-td">
                                        <p>동단위, 정기지정배분</p>
                                        <p><i class="sprite-group-tel"></i>062-222-3552</p>
                                        <!-- <p><i class="sprite-group-mail"></i>saen8265@chest.or.kr</p> -->
                                    </dd>
                                </dl>
                            </div>
                            <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                            <div class="fake-table-box">
                                <dl class="fake-table-item">
                                    <dt class="fake-table-th">팀장 배정봉</dt>
                                    <dd class="fake-table-td">
                                        <p>경영관리팀 총괄</p>
                                        <p><i class="sprite-group-tel"></i>062-654-9079</p>
                                        <!-- <p><i class="sprite-group-mail"></i>bjbdsm@chest.or.kr</p> -->
                                    </dd>
                                    <dt class="fake-table-th">주임 양현서</dt>
                                    <dd class="fake-table-td">
                                        <p>회계, 총무</p>
                                        <p><i class="sprite-group-tel"></i>062-222-3551</p>
                                        <!-- <p><i class="sprite-group-mail"></i>kbm@chest.or.kr</p> -->
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
                                        <p class="person-position">제11대 회장</p>
                                        <p class="person-time">2018.05 ~ 현재</p>
                                    </div>
                                    <div class="person-col-photo">
                                        <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_06.jpg" alt="한상원 프로필 이미지"></div>
                                    </div>
                                    <div class="person-col-info">
                                        <p class="person-name">한상원</p>
                                        <div class="person-profile">
                                            <p class="person-profile-tit">[주요 약력]</p>
                                            <dl class="person-profile-item">
                                                <dt>현재</dt>
                                                <dd>
                                                    다스코(주), 세라코(회장)<br>
                                                    법무부 범죄예방협의회 보호관찰위원회 위원장<br>
                                                    전남경찰발전위원회 회장
                                                </dd>
                                                <dt>~ 2018</dt>
                                                <dd>
                                                    동아에스텍(주) 대표이사<br>
                                                    광주상공회의소 제18대~20대 의원<br>
                                                    광주상공회의소 부회장<br>
                                                    민주평화통일자문회 자문위원<br>
                                                    전문건설공제조합 제7대~13대 대의원
                                                </dd>
                                            </dl>
                                            <p class="person-profile-tit">[상훈]</p>
                                            <div class="person-profile-item">
                                                <ul>
                                                    <li>제38회 발명의 날 "철탑산업훈장" 수훈</li>
                                                    <li>2010 건설의 날 "은탑산업훈장" 수훈</li>
                                                    <li>민주평화통일 자문회 대통령 표창</li>
                                                    <li>중소기업 경영인대상 "국회의장상" 수상</li>
                                                </ul>
                                            </div>
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
                                <table summary="홍보분과실행위원">
                                    <caption>홍보분과실행위원 정보입니다.</caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">회장</th>
                                        <td class="td-point">한상원</td>
                                        <td>다스코㈜, 세라코㈜ 회장</td>
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
                                        <th scope="row" class="no-line">부회장</th>
                                        <td class="td-point">박철홍</td>
                                        <td>골드클래스㈜ 대표이사</td>
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
                                            <td class="td-point">강형구</td>
                                            <td>농협중앙회 광주지역본부장</td>
                                            <td class="td-point">김명군</td>
                                            <td>㈜금호주택 대표이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김태봉</td>
                                            <td>전남대학교 법학전문대학원 교수</td>
                                            <td class="td-point">리종기</td>
                                            <td>광주기독교교단협의회 대표회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박상철</td>
                                            <td>호남대학교 총장</td>
                                            <td class="td-point">이평형</td>
                                            <td>前, 광주광역시 복지건강국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박향</td>
                                            <td>광주광역시 복지건강국장</td>
                                            <td class="td-point">조광철</td>
                                            <td>코비코㈜ 대표이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">조억헌</td>
                                            <td>kbc광주방송 대표이사</td>
                                            <td class="td-point">조영훈</td>
                                            <td>- ㈜대광이엔씨 대표이사<br>
                                            - ㈜대광건영 부회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">최갑렬</td>
                                            <td>삼일건설 주식회사 대표이사 회장</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <table>
                                    <caption><p class="ui-caption">직급, 이름, 경력</p></caption>
                                    <colgroup>
                                        <col class="col-w01">
                                        <col class="col-w02">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" rowspan="2" class="no-line">감사</th>
                                        <td class="td-point">김성후</td>
                                        <td>세무법인 동반 / 대표세무사</td>
                                    </tr>
                                    <tr>
                                        <td class="td-point">서일석</td>
                                        <td>공증인가 법무법인 21세기 종합법률사무소 / 대표변호사</td>
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
                            <h4 class="title-heading_a mg-t-m">모금분과위원</h4>
                            <div class="tb-type_c">
                                <div class="wide-scroll members">
                                    <table summary="모금분과위원">
                                        <caption>모금분과위원 정보입니다.</caption>
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
                                            <td class="td-point">조억헌</td>
                                            <td colspan="3">KBC광주방송 대표이사</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">부위원장</th>
                                            <td class="td-point">나종운</td>
                                            <td colspan="3">한국투자증권호남지역본부 본부장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="8">위원</th>
                                            <td class="td-point">김영춘</td>
                                            <td>광주전남지방법무사회 사무국장</td>
                                            <td class="td-point">김원규</td>
                                            <td>광주지방변호사회 사무국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김창희</td>
                                            <td>기아자동차(주)광주공장 총무팀장</td>
                                            <td class="td-point">박장호</td>
                                            <td>광주광역시의사회 사무국장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">박상태</td>
                                            <td>일신교회 대표목사</td>
                                            <td class="td-point">오광호</td>
                                            <td>해양에너지 전무이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">오승준</td>
                                            <td>(재)광주경제고용진흥원 이사</td>
                                            <td class="td-point">이병근</td>
                                            <td>광주경영자총협회 상임이사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">임현철</td>
                                            <td>중흥건설 총무부 상무이사</td>
                                            <td class="td-point">임환수</td>
                                            <td>골드클래스 총무팀 이사</td>
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
                                            <td class="td-point">김태봉</td>
                                            <td colspan="3">전남대학교 법학전문대학원 교수</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="6">위원</th>
                                            <td class="td-point">김경열</td>
                                            <td>광신대학교 사회복지상담학과 교수</td>
                                            <td class="td-point">류미수</td>
                                            <td>광주광역시 사회복지과장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">류성봉</td>
                                            <td>광주노인보호전문기관 관장</td>
                                            <td class="td-point">박일연</td>
                                            <td>호남신학대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">유승주</td>
                                            <td>보건대학교 사회복지학과 교수</td>
                                            <td class="td-point">박병훈</td>
                                            <td>톡톡브레인 심리발달 연구소장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이형하</td>
                                            <td>광주여자대학교 사회복지학과 교수</td>
                                            <td class="td-point">정성배</td>
                                            <td>조선대학교 행정복지학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">정용욱</td>
                                            <td>광주MBC 보도국 차장</td>
                                            <td class="td-point">정희경</td>
                                            <td>광주대학교 사회복지전문대학원 교수</td>
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
                                            <th scope="row" rowspan="4">위원</th>
                                            <td class="td-point">김요셉</td>
                                            <td>광주광역시 아동복지협회장</td>
                                            <td class="td-point">이동건</td>
                                            <td>빛고을아동보호전문기관 관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">서상원</td>
                                            <td>광주복지공감플러스 사무처장</td>
                                            <td class="td-point">김경옥</td>
                                            <td>광산구행복나루노인복지관 관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김부나</td>
                                            <td>광주광역시 남구장애인복지관 관장</td>
                                            <td class="td-point">이선미</td>
                                            <td>인애종합사회복지관 관장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">문미선</td>
                                            <td colspan="3">북구건강가정다문화가족지원센터 센터장</td>
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
        
