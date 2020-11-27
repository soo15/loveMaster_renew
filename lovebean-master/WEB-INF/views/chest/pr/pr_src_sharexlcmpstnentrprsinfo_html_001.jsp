<!--
 ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [하단메뉴] 기부자그룹 > 나눔명문기업
 * Author      :
 * Description :
                 1. 기부자 상담신청 하기  클릭시  기부 > 기업사회공헌 >  나눔명문기업   페이지로 링크
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
var _reqstManageTy = "${reqstManageTy}";  // 기부신청관리유형
var param={};
$(document).ready(function(){

});

/*===========================================================
 * 기부자상담신청 하기 버튼 클릭시 Function !!
 *===========================================================*/
$(document).on("click", "#btnRegist", function(e){

    // 기부상담 구분코드
    param = "&ftCntr="+_reqstManageTy;
    // 기부 > 기업사회공헌 >  나눔명문기업  으로 Move
    gf_submitMovePage("<c:url value='/ct/entcntrb/initSharexlcmpstnentrprs.do' />", param);

});

</script>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">나눔명문기업이란</h2>
        <p class="title-sub-txt">대한민국의 나눔을 이끄는 나눔명문기업을 소개합니다.</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>나눔명문기업이란</strong><span>대한민국의 나눔을 이끄는, 나눔명문기업</span></h3>
            <div class="contents-menu-nav"></div>
        </div>

        <div class="seo-box">
            <div class="area-type-a">
                <img src="/common/img/contents/cpl_logo.png" alt="나눔명문기업 corporate philanthropy leader" >
                <p><strong>대한민국의 나눔을 이끄는, 나눔명문기업</strong></p>
                <p>나눔명문 기업은 1억 원 이상을 기부하였거나 3년 이내 기부를 약정한 고액 기업 기부 프로그램입니다.</p>
                <p>사회문제에 대한 관심을 바탕으로 지속가능한 경영을 통해 사회적 책임을 다하며,</p>
                <p>사회를 이루는 구성원으로서 사회가치 창출과 공익에 기여함으로 더 나은 세상을 만들고자 하는 기업들이 참여합니다.</p>
                <p>대한민국의 나눔문화를 이끌고, 기업사회공헌의 바람직한 롤 모델을 제시하는 대한민국 대표 고액 기업 기부자 모임입니다.</p>
            </div>

            <div class="donation-section">
                <h4 class="table-tit">회원설명</h4>
                <ul class="donation-desc">
                    <li>정회원 : 누적기부금(현물 제외) 1억 원 이상인 법인 기부자<span>(누적기부금에 따라 그린, 실버, 골드회원으로 구분)</span></li>
                    <li>약정회원 : 1억 원 이상의 기부금을 3년 이내에 납부하기로 약정하고 가입 시에 2천만 원 이상의 기부금을 일시납부한 법인기부자</li>
                </ul>

                <div class="tb-type_b not-head">
                    <table summary="게회원설명">
                        <caption>회원설명 입니다.</caption>
                        <colgroup>
                            <col class="col-w01 only-pc">
                            <col class="col-w04">
                            <col class="col-auto">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col" class="only-pc">구분</th>
                            <th scope="col">약정회원</th>
                            <th scope="col">정회원</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="only-pc"><strong>기준금액</strong></td>
                            <td class="th-member1">1억원<br>(가입시: 2천만원)</td>
                            <td class="th-member2">
                                <ul class="donation-member-list">
                                    <li class="green">1억원 이상</li>
                                    <li class="silver">3억원 이상</li>
                                    <li class="gold">5억원 이상</li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <h4 class="table-tit">예우방법</h4>
                <div class="donation-article type2">
                    <ul class="donation-desc type2">
                        <li>
                            <p>회원 가입식 및 기부금 전달식 진행</p>
                            <p>맞춤형 사회공헌사업 진행 및 결과보고</p>
                        </li>
                        <li>
                            <p>현판 및 인증패 전달<span>※ 현판, 인증패 이미지 넣기(추후 전달 예정)</span></p>
                            <p>정부 유공자 훈/포장 및 대내외 사회봉사상 추천</p>
                        </li>
                        <li>
                            <p>사랑의열매 홈페이지 참여기업 명단 게재</p>
                            <p>회보, 연간보고서 등 주요 간행물 등재</p>
                        </li>
                        <li>
                            <p>참여기업 네트워크 모임 참석</p>
                            <p>기타 회원의 명예를 높이기 위한 홍보활동 등</p>
                        </li>
                    </ul>

                    <div class="btn-area">
                        <button type="button" class="btn-base-imp" id="btnRegist">기부자 상담신청 하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


