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
                                <div class="group-imgbox"><img src="/common/img/contents/group_img09.jpg" alt=""></div>
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">최은숙</dt>
                                        <dd class="fake-table-td">
                                            <p>사무국 운영총괄</p>
                                            <!-- <p><i class="sprite-group-mail"></i>cess902@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>       
                                <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 강영진</dt>
                                        <dd class="fake-table-td">
                                            <p>경영관리팀 업무총괄</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7912</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jini922@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 이상애</dt>
                                        <dd class="fake-table-td">
                                            <p>사업계획 및 예산, 구매, 계약, 인사, 복리후생, 언론홍보, 이벤트홍보</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7915</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hory0612@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 이수진B</dt>
                                        <dd class="fake-table-td">
                                            <p>출납업무, 결산, 법인카드 정산 및 관리, 자금관리</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7913</p>
                                            <!-- <p><i class="sprite-group-mail"></i>sujin25@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 박상민</dt>
                                        <dd class="fake-table-td">
                                            <p>재물관리, 경상지출, 업무용 차량관리, 직원출장 및 당직자 관리, 온라인홍보(페이스북, 홈페이지 등), 홍보물제작 및 관리</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7916</p>
                                            <!-- <p><i class="sprite-group-mail"></i>b940930@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">기획모금팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 이범열</dt>
                                        <dd class="fake-table-td">
                                            <p>기획모금팀 업무총괄, 모금분과위원회 운영</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7931</p>
                                            <!-- <p><i class="sprite-group-mail"></i>worker74@chest.or.kr</p> -->
                                        </dd>	
                                        <dt class="fake-table-th">과장 위승구</dt>
                                        <dd class="fake-table-td">
                                            <p>화성·하남 모금 및 배분, 모금실적 및 평가관리, 나눔봉사단, 카드단말기 관리, 이웃돕기설명회 책자제작, 착한가게, 기부자관리</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7932</p>
                                            <!-- <p><i class="sprite-group-mail"></i>weesk02@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 김효진</dt>
                                        <dd class="fake-table-td">
                                            <p>경기도·수원 모금 및 배분, 유공자포상식 등 도청관련 업무</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7937</p>
                                            <!-- <p><i class="sprite-group-mail"></i>me0321@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 이지수</dt>
                                        <dd class="fake-table-td">
                                            <p>부천·군포 모금 및 배분, 착한가정, 학교모금</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7933</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yongseungko@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 고승용</dt>
                                        <dd class="fake-table-td">
                                            <p>김포 모금 및 배분, 착한일터, CSR(나눔명문기업), 연합모금(공모)</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7934</p>
                                            <!-- <p><i class="sprite-group-mail"></i>bs007@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 임정연</dt>
                                        <dd class="fake-table-td">
                                            <p>이천·광명·의왕 모금 및 배분, 무한돌봄 열매나누기 및 배분 </p>
                                            <p><i class="sprite-group-tel"></i>031-220-7935</p>
                                            <!-- <p><i class="sprite-group-mail"></i>lsh8973@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 이윤옥</dt>
                                        <dd class="fake-table-td">
                                            <p>평택 모금 및 배분, 연합모금(푸드뱅크)</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7936</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yunoklee@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 김준해</dt>
                                        <dd class="fake-table-td">
                                            <p>시군현물모금 및 배분(경기도, 부천, 수원, 하남, 의왕, 화성) / 기업현물모금</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7938</p>
                                            <!-- <p><i class="sprite-group-mail"></i>kyh4470@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">전략모금팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김선경</dt>
                                        <dd class="fake-table-td">
                                            <p>전략모금팀 업무총괄, 계획(유산/부동산)기부</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7941</p>
                                            <!-- <p><i class="sprite-group-mail"></i>kkk0427@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">과장 천상영</dt>
                                        <dd class="fake-table-td">
                                            <p>성남 모금 및 배분, 아너소사이어티1, 기관배분대장 관리</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7942</p>
                                            <!-- <p><i class="sprite-group-mail"></i>csy1003@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 이수진A</dt>
                                        <dd class="fake-table-td">
                                            <p>용인·시흥 모금 및 배분, 아너소사이어티2(W아너)</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7943</p>
                                            <!-- <p><i class="sprite-group-mail"></i>sjin0509@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 김준혁</dt>
                                        <dd class="fake-table-td">
                                            <p>안양·과천 모금 및 배분, 특별모금 </p>
                                            <p><i class="sprite-group-tel"></i>031-220-7944</p>
                                            <!-- <p><i class="sprite-group-mail"></i>kppkpp@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 김도영</dt>
                                        <dd class="fake-table-td">
                                            <p>안산·오산 모금 및 배분, 미디어모금(CMS/신용카드 등)</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7945</p>
                                            <!-- <p><i class="sprite-group-mail"></i>kdy@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 김태호</dt>
                                        <dd class="fake-table-td">
                                            <p>광주·안성 모금 및 배분, 모금함모금, 이벤트모금</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7946</p>
                                            <!-- <p><i class="sprite-group-mail"></i>taeho8907@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 임성환</dt>
                                        <dd class="fake-table-td">
                                            <p>여주 모금 및 배분, 나눔리더 및 리더스클럽, 성남시 현물 모금 및 배분</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7947</p>
                                            <!-- <p><i class="sprite-group-mail"></i>concon07@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 김민지</dt>
                                        <dd class="fake-table-td">
                                            <p>양평 모금 및 배분, 용인·안양·안산 현물 모금 및 배분, 사랑의계좌 모금 </p>
                                            <p><i class="sprite-group-tel"></i>031-220-7947</p>
                                            <!-- <p><i class="sprite-group-mail"></i>top@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 지윤진</dt> 			
                                        <dd class="fake-table-td">
                                            <p>배분사업팀 업무총괄</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7921</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jyj@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 김태희</dt>	
                                        <dd class="fake-table-td">
                                            <p>배분분과실행위원회  / 지정기탁소위원회 / 배분 사업계획 및 예산 /실적관리/ 특별모금배분 / 전국기획사업 /  기획사업(2015-2016) / 대기업 사회공헌 (SK하이닉스, SKC, SK하이이엔지, KCC)</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7922</p>
                                            <!-- <p><i class="sprite-group-mail"></i>lao33@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                     <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 김동현</dt>	
                                        <dd class="fake-table-td">
                                            <p>신청사업  / 기획사업(복지현안 우선지원, 소규모복지지원) / Choi's haapy fund / 평가지원단 / 차량지원사업(기지원 차량관리 포함)</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7924</p>
                                            <!-- <p><i class="sprite-group-mail"></i>lao33@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 정재민</dt>
                                        <dd class="fake-table-td">
                                            <p>기획사업(아동청소년  경제 및 인성교육지원) / 긴급지원사업 / 연합모금 배분사업(중앙회 매칭금) / 2020 신규기획사업 / 회계법인 관리</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7927</p>
                                            <!-- <p><i class="sprite-group-mail"></i>ruths1730@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 최승균</dt>
                                        <dd class="fake-table-td">
                                            <p>대기업  사회공헌(삼성전자DC,삼성전자DS,삼성전자종합기술원, 삼성전기, 삼성물산㈜에버랜드, 기아자동차 화성공장, 현대자동차 남양연구소, 한샘,  경기도시공사, 한국마사회)</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7923</p>
                                            <!-- <p><i class="sprite-group-mail"></i>cjm0113@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 김용우</dt>
                                        <dd class="fake-table-td">
                                            <p>복권기금사업  / CSR 지정기탁 배분 / 복권소위원회</p>
                                            <p><i class="sprite-group-tel"></i>031-220-7926</p>
                                            <!-- <p><i class="sprite-group-mail"></i>choi89131@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                
                                <h4 class="title-heading_a mg-t-l">경기북부사업본부</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">본부장 강주현</dt>
                                        <dd class="fake-table-td">
                                            <p>북부사업본부 운영 총괄</p>
                                            <!-- <p><i class="sprite-group-tel"></i>-</p>
                                            <p><i class="sprite-group-mail"></i>-</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 정소영</dt>
                                        <dd class="fake-table-td">
                                            <p>총괄지원(캠페인 출범, 대외협력, 유공자포상, 실적관리 등) </p>
                                            <p><i class="sprite-group-tel"></i>031-906-4022</p>
                                            <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                        </dd>
                                        <dt class="fake-table-th">과장 정현주</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계(가평, 포천), 사회공헌(CSR), 신규 및 전국 기획사업, 배분소위원회, 평가지원단 </p>
                                            <p><i class="sprite-group-tel"></i>031-906-4026</p>
                                            <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">과장 이용진</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계(남양주, 양주), 아너 소사이어티, 착한가정, 연합모금, 학교모금, 시군 협의체 교육</p>
                                            <p><i class="sprite-group-tel"></i>031-906-4023</p>
                                            <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 박한나</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계(의정부, 연천), 홍보, 나눔리더/리더스클럽, 신청사업, 배분사업설명회</p>
                                            <p><i class="sprite-group-tel"></i>031-906-4027</p>
                                            <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 이규진</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계(고양, 구리), 착한일터, 긴급지원사업</p>
                                            <p><i class="sprite-group-tel"></i>031-906-4028</p>
                                            <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 이진후</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계(동두천, 파주), 착한가게, 기획(차량지원사업), 총무</p>
                                            <p><i class="sprite-group-tel"></i>031-906-4024</p>
                                            <!-- <p><i class="sprite-group-mail"></i>-</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 유지현</dt>
                                        <dd class="fake-table-td">
                                            <p>복권사업, 기획(소규모복지기관지원사업) </p>
                                            <p><i class="sprite-group-tel"></i>031-906-4025</p>
                                            <!-- <p><i class="sprite-group-mail"></i>-</p> -->
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
                                            <p class="person-time">현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_09.jpg" alt="이순선 프로필 이미지"></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">이순선</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>1946.01.28</dt>
                                                    <dd>대구출생</dd>
                                                    <dt>1962.02</dt>
                                                    <dd>대구 효성여고 졸업</dd>
                                                    <dt>2003.12</dt>
                                                    <dd>이화여자대학교 최고경영자과정 수료</dd>
                                                    <dt>2004.08</dt>
                                                    <dd>순천향대학교 건강과학CEO과정 수료</dd>
                                                    <dt>2005.05</dt>
                                                    <dd>중국칭화대학교 최고경영자과정 수료</dd>
                                                    <dt>1986</dt>
                                                    <dd>성창금속 설립</dd>
                                                    <dt>2001.03</dt>
                                                    <dd>
                                                        ㈜성창베네피나로 상호변경<br>
                                                        민주평화통일자문회의 상임이사 및 서초구협의회 부회장<br>
                                                        (재)평통여성장학재단 후원회<br>
                                                        용인여성기업인협의회 회장
                                                    </dd>
                                                    <dt>2012.03</dt>
                                                    <dd>용인상공회의소 회장 취임</dd>
                                                    <dt>2015.03</dt>
                                                    <dd>경기도상공회의소연합회 부회장 취임</dd>
                                                </dl>
                                                <p class="person-profile-tit">[상훈]</p>
                                                <dl class="person-profile-item">
                                                    <dt>1994년</dt>
                                                    <dd>500만불 수출의 탑 (한국무역협회)</dd>
                                                    <dt>1996년</dt>
                                                    <dd>1,000만불 수출의탑 (한국무역협회)</dd>
                                                    <dt>2005년</dt>
                                                    <dd>한국최고브랜드대상 (한국언론인연합회)</dd>
                                                    <dt>2005년</dt>
                                                    <dd>
                                                        독일국제발명신제품전시회 금상‧특별상 (IENA)<br>
                                                        대한민국특허기술대전 은상‧장려상 (특허청)
                                                    </dd>
                                                    <dt>2006~2013년</dt>
                                                    <dd>
                                                        표창장 (용인시장 ‧ 서울특별시장‧중소기업청장 ‧ 중부지방국세청장 ‧ 대한상공회의소)
                                                    </dd>
                                                    <dt>2013년</dt>
                                                    <dd>대통령상</dd>
                                                    <dt>2017년</dt>
                                                    <dd>제44회 상공의날 철탑산업훈장</dd>
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
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">회장</th>
                                            <td class="td-point">이순선</td>
                                            <td>성창베네피나 대표</td>
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
                                            <td class="td-point">이정호</td>
                                            <td>경기중앙지방변호사회 회장 / 변호사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">권인욱</td>
                                            <td>파주상공회의소 회장 / ㈜피유시스 대표이사</td>
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
                                                <th scope="row" rowspan="5" class="no-line">위원</th>
                                                <td class="td-point">홍지호</td>
                                                <td>수원상공회의소 회장</td>
                                                <td class="td-point">이근홍</td>
                                                <td>협성대학교 사회복지학과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김영진</td>
                                                <td>단국대학교 경영대학원 교수</td>
                                                <td class="td-point">박광재</td>
                                                <td>유익 E&C 대표이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김용목</td>
                                                <td>한국노총 경기지역본부 의장</td>
                                                <td class="td-point">공봉애</td>
                                                <td>아너소사이어티 회원</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">유복순</td>
                                                <td>㈜시크리티스 대표이사</td>
                                                <td class="td-point">선계훈</td>
                                                <td>경기중앙교육도서관 관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김도묵</td>
                                                <td>사회복지법인 휴먼복지회 이사장</td>
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
                                            <th scope="row" rowspan="1" class="no-line">감사</th>
                                            <td class="td-point">황민석</td>
                                            <td>황산회계사무소 대표</td>
                                            <td class="td-point">최선호</td>
                                            <td>최선호변호사 사무소 대표</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <!-- E : 운영위원회 -->
                        <!-- S : 분과실행위원회 -->
                        <section class="ui-tab-pnl" id ="pnl3" >
                            <!-- <div class="tab-contents">
                                <h4 class="title-heading_a mg-t-m">기획홍보 분과실행위원회</h4>
                                <div class="tb-type_c">
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
                                                <th scope="row" rowspan="5" class="no-line">위원</th>
                                                <td class="td-point">국원표</td>
                                                <td>씨앤엠 경기보도 제작국장</td>
                                                <td class="td-point">김경호</td>
                                                <td>뉴시스 경기남부취재본부 취재1부 팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">문용식</td>
                                                <td>경기도마을버스운송사업조합 이사장</td>
                                                <td class="td-point">문철수</td>
                                                <td>한신대학교 미디어영상광고홍보학부 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김성규</td>
                                                <td>경인일보 광고국장</td>
                                                <td class="td-point">박영만</td>
                                                <td>마케팅홍보연구소 소장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">심언규</td>
                                                <td>기호일보 사회체육부 부장</td>
                                                <td class="td-point">엄득호</td>
                                                <td>중부일보 정치부 부장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">정숭환</td>
                                                <td>뉴스윗미디어 대표</td>
                                                <td class="td-point">최영재</td>
                                                <td>경기신문 사회부 부장</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> -->
                                <h4 class="title-heading_a mg-t-m">모금분과 실행위원회</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="실행위원회">
                                            <caption>실행위원회 정보입니다.</caption>
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
                                                <td class="td-point">이정호</td>
                                                <td colspan="3">경기중앙지방변호사회 회장 겸 본회 운영위원회 부회장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">최운주</td>
                                                <td colspan="3">수원상공회의소 사무처장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="6" class="no-line">위원</th>
                                                <td class="td-point">이형식</td>
                                                <td>㈜아름방송네트워크 보도제작국장</td>
                                                <td class="td-point">정우진</td>
                                                <td>(사)중소기업융합경기연합회 상근부회장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">심정애</td>
                                                <td>미래꿈 하우스 소장</td>
                                                <td class="td-point">이영애</td>
                                                <td>나눔과 비움 상임이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">정종국</td>
                                                <td>안성시 노인복지관장</td>
                                                <td class="td-point">최성일</td>
                                                <td>수원시 농구협회장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김종진</td>
                                                <td>경기콘텐츠진흥원 이사/ 한국창업진흥협회 부회장</td>
                                                <td class="td-point">민소영</td>
                                                <td>경기대학교 휴먼서비스학부 사회복지전공 교수</td>
                                            <tr>
                                                <td class="td-point">신원우</td>
                                                <td>협성대 사회복지학과 교수</td>
                                                <td class="td-point">김은경</td>
                                                <td>한림대학교 성심병원 사회사업팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이애련</td>
                                                <td colspan="3">산남초등학교 교장</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <h4 class="title-heading_a mg-t-m">배분분과 실행위원회</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="배분분과">
                                            <caption>배분분과 정보입니다.</caption>
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
                                                <td class="td-point">이근홍</td>
                                                <td colspan="3">협성대학교 사회복지학과</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">임원균</td>
                                                <td>신안산대학교 사회복지과</td>
                                                <td class="td-point">손신</td>
                                                <td>아세아연합신학대학교</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="6" class="no-line">위원</th>
                                                <td class="td-point">이상무</td>
                                                <td>평택대학교 사회복지학과</td>
                                                <td class="td-point">임원선</td>
                                                <td>신한대학교 사회복지과</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">간호옥</td>
                                                <td>연성대학교 사회복지과</td>
                                                <td class="td-point">김정근</td>
                                                <td>강남대학교 실버산업학부</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김형모</td>
                                                <td>경기대학교 사회복지학과</td>
                                                <td class="td-point">이영순</td>
                                                <td>경기대학교 사회과학연구소</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">류승용</td>
                                                <td >비산종합사회복지관</td>
                                                <td class="td-point">박용오</td>
                                                <td>서정대학교 사회복지상담과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">선지영</td>
                                                <td >다산인권센터 상임활동가</td>
                                                <td class="td-point">윤주희</td>
                                                <td>하트하트재단 인터내셔널 사무총장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이은애</td>
                                                <td colspan="3">사단법인 시즈 이사장</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <h4 class="title-heading_a mg-t-m">경기북부 배분분과소위원회</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="배분분과소위원회">
                                            <caption>배분분과소위원회 정보입니다.</caption>
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
                                                <td class="td-point">임원선</td>
                                                <td colspan="3">신한대학교 사회복지학과(배분위원)</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">윤연희</td>
                                                <td colspan="3">의정부종합사회복지관</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="4" class="no-line">위원</th>
                                                <td class="td-point">김형모</td>
                                                <td>경기대학교사회복지학과(배분위원)</td>
                                                <td class="td-point">이금룡</td>
                                                <td>상명대학교 가족복지학과</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">홍희석</td>
                                                <td>김포대학교 사회복지학과</td>
                                                <td class="td-point">김혜리</td>
                                                <td>중부대학교 사회복지학과</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">문정화</td>
                                                <td>고양시정연구원 연구위원</td>
                                                <td class="td-point">정지영</td>
                                                <td>일산백병원 사회사업팀</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">심재경</td>
                                                <td colspan="3">흰돌종합사회복지관</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <h4 class="title-heading_a mg-t-m">나눔봉사단</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="나눔봉사단">
                                            <caption>나눔봉사단 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w02">
                                                <col>
                                                <col class="col-w02">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <td class="td-point">정양순</td>
                                                <td>경기도 나눔봉사단장</td>
                                                <td class="td-point">양인석</td>
                                                <td>가톨릭대학교 의정부성모병원 사회사업팀 팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최수봉</td>
                                                <td>안성시 나눔봉사단장</td>
                                                <td class="td-point">이현호</td>
                                                <td>안양시 나눔봉사단장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">정병관</td>
                                                <td>여주군 나눔봉사단장</td>
                                                <td class="td-point">하재봉</td>
                                                <td>용인시 나눔봉사단장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이정은</td>
                                                <td>성남시 나눔봉사단장</td>
                                                <td class="td-point">이재오</td>
                                                <td>평택시 나눔봉사단장</td>
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
    </main>
</div>
        
