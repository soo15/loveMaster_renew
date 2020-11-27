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
                        <button type="button" class="ui-tab-btn" id ="btn1" onclick="javascript:goTabDisplay(1);"><i>지회장</i></button>
                        <button type="button" class="ui-tab-btn" id ="btn2" onclick="javascript:goTabDisplay(2);"><i>운영위원회</i></button>
                        <button type="button" class="ui-tab-btn" id ="btn3" onclick="javascript:goTabDisplay(3);"><i>분과실행위원회</i></button>
                    </div>
                    <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                        <!-- S : 조직도 -->
                        <section class="ui-tab-pnl" id ="pnl0" >
                            <div class="tab-contents">
                                <div class="group-imgbox"><img src="/common/img/contents/group_img18.jpg" alt=""></div>
                                
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">김동후</dt>
                                        <dd class="fake-table-td">
                                            <p>사무국 운영총괄</p>
                                           <!--  <p><i class="sprite-group-mail"></i>kdh1221@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>                                
                                <h4 class="title-heading_a mg-t-l">사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김은영</dt>
                                        <dd class="fake-table-td">
                                            <p>사업팀 업무총괄, 아너소사이어티, 유산기부</p>
                                            <p><i class="sprite-group-tel"></i>070-4269-0567</p>
                                           <!--  <p><i class="sprite-group-mail"></i>powersw@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 이상덕(휴직)</dt>
                                        <dd class="fake-table-td">
                                            <!--<p></p>
                                            <p><i class="sprite-group-tel"></i>-</p>
                                            <p><i class="sprite-group-mail"></i>-</p>-->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 김서영</dt>
                                        <dd class="fake-table-td">
                                            <p>물품모금 및 배분, 소규모지원사업, 기획사업 (민관협력, 복지현안문제 우선지원, 신규기획 등)</p>
                                            <p><i class="sprite-group-tel"></i>070-4269-0572</p>
                                            <!-- <p><i class="sprite-group-mail"></i>pop3017@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 김설아</dt>
                                        <dd class="fake-table-td">
                                            <p>복권기금사업, 긴급지원사업, 지정기탁배분사업, 기획사업 (재난적의료비, 지역연계 등) </p>
                                            <p><i class="sprite-group-tel"></i>070-4269-0569</p>
                                            <!-- <p><i class="sprite-group-mail"></i>chestkim@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 송제윤</dt>
                                        <dd class="fake-table-td">
                                            <p>연합모금 및 배분, 지역사회보장협의체 모금 및 배분, 기업모금, 착한일터, 나눔봉사단</p>
                                            <p><i class="sprite-group-tel"></i>070-4269-0565</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yoon94@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 권선두</dt>
                                        <dd class="fake-table-td">
                                            <p>착한가게, 착한가정, 학교·어린이집 모금, 나눔리더·리더스클럽, 홍보업무</p>
                                            <p><i class="sprite-group-tel"></i>070-4269-0571</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yoon94@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김은영</dt>
                                        <dd class="fake-table-td">
                                            <p>경영관리 업무 총괄, 운영위원회 운영</p>
                                            <p><i class="sprite-group-tel"></i>070-4269-0567</p>
                                            <!-- <p><i class="sprite-group-mail"></i>powersw@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 최상미</dt>
                                        <dd class="fake-table-td">
                                            <p>총무·회계업무, 신청사업 배분분과실행위원회 운영, 기획사업 (기관지원 등)</p>
                                            <p><i class="sprite-group-tel"></i>070-4269-0564 </p>
                                            <!-- <p><i class="sprite-group-mail"></i>tkdal@chest.or.kr</p> -->
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
                                            <p class="person-position">지회장</p>
                                            <p class="person-time">현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman1_18.jpg" alt=""></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">홍영섭</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[학 력]</p>
                                                <dl class="person-profile-item">
                                                    <dt></dt>
                                                    <dd>금호중학교<br>대전농업고등전문학교 5년 (現 우송공업대학 농과)</dd>
                                                </dl>

                                              <p class="person-profile-tit">[경 력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>2014. 7 ~2016. 12</dt>
                                                    <dd>충청남도 연기군<br>(의회사무과장, 사회진흥과장, 재무과장, 지역경제과장, 문화공보실장, 기획감사실장)
                                                    <br>前 세종특별자치시 정무부시장(2014. 7 ~2016. 12)
                                                    <br>前 세종시정(2기) 시민참여위원장
                                                    <br>충청남도 연기군청 (1968년~ 2007년)<br>(의회사무과장, 사회진흥과장, 재무과장, 지역경제과장, 문화공보실장, 기획감사실장 역임) </dd>
                        
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
                                                <td class="td-point">홍영섭</td>
                                                <td colspan="3">前 세종시 정무부시장</td>
                                            </tr>

                                            <tr>
                                                <th scope="row" rowspan="5">위 원</th>
                                                <td class="td-point">송두범</td>
                                                <td>충남발전연구원 미래전략연구단장</td>
                                                <td class="td-point">신광수</td>
                                                <td>세종요양병원 상임이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">안신일</td>
                                                <td>현대해상 세종행복대리점팀장</td>
                                                <td class="td-point">오시영</td>
                                                <td>청원그린식품 CEO</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이영선</td>
                                                <td>이영선법률사무소 대표</td>
                                                <td class="td-point">이범구</td>
                                                <td>NH농협은행 세종영업본부 본부장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">조혜영</td>
                                                <td>세종시 인사위원회 위원<br>세종모금회 시민참여위원회 위원장</td>
                                                <td class="td-point">김윤회</td>
                                                <td>흥덕산업주식회사 대표<br> 세종모금회 아너소사이어티 회원대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김일순</td>
                                                <td colspan="3">충청투데이 부장</td>
                                            </tr>

                                            <tr>
                                                <th scope="row" rowspan="3" class="no-line">감사</th>
                                                <td class="td-point">문수원</td>
                                                <td colspan="3">신화회계법인 충청지점 회계사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">홍영표</td>
                                                <td colspan="3">민주평화통일자문회 위원</td>
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
                                <h4 class="title-heading_a mg-t-m">분과실행위원회</h4>
                                <div class="tb-type_c">
                                    <table summary="분과실행위원회">
                                        <caption>분과실행위원회 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">위원장</th>
                                            <td class="td-point">송두범</td>
                                            <td>충남연구원 정책사업지원단장</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="2">부위원장</th>
                                            <td class="td-point">김봉순</td>
                                            <td>한국영상대학교 사회복지과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">유병구</td>
                                            <td>(주)씨엔유건축사무소 대표</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" rowspan="8">위원</th>
                                            <td class="td-point">황미영</td>
                                            <td>충청대학교 사회복지학부 교수</td>
                                        </tr>
                                        <tr>

                                            <td class="td-point">안재승</td>
                                            <td>세종시소상공인연합회 회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이지숙</td>
                                            <td>단국대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>

                                            <td class="td-point">김지혜</td>
                                            <td>남서울대학교 사회복지학과 교수</td>
                                        </tr>
                                        <tr>

                                            <td class="td-point">권지훈</td>
                                            <td>사회적협동조합 마을과복지연구소 이사장</td>
                                        </tr>
                                        <tr>
                    
                                            <td class="td-point">양승걸</td>
                                            <td> 미래세움 건축사 사무소 대표</td>
                                        </tr>
                                        <tr>
               
                                            <td class="td-point">오창근</td>
                                            <td>삼성전기(주) 세종사업장 사회공헌부서 부장</td>
                                        </tr>
                                        <tr>
                         
                                            <td class="td-point">정혜원</td>
                                            <td>배재대학교 실버보건학과 교수</td>
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
        
