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
<!--                         <button type="button" class="ui-tab-btn" id ="btn1" onclick="javascript:goTabDisplay(1);"><i>명예회장</i></button> -->
                        <button type="button" class="ui-tab-btn" id ="btn2" onclick="javascript:goTabDisplay(2);"><i>회장</i></button>
                        <button type="button" class="ui-tab-btn" id ="btn3" onclick="javascript:goTabDisplay(3);"><i>운영위원회</i></button>
                        <button type="button" class="ui-tab-btn" id ="btn4" onclick="javascript:goTabDisplay(4);"><i>분과실행위원회</i></button>
                    </div>
                    <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                        <!-- S : 조직도 -->
                        <section class="ui-tab-pnl" id ="pnl0" >
                            <div class="tab-contents">
                                <div class="group-imgbox"><img src="/common/img/contents/group_img17.jpg" alt=""></div>
                                
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">심정미</dt>
                                        <dd class="fake-table-td">
                                            <p>사무국 운영총괄 </p>
                                            <!-- <p><i class="sprite-group-mail"></i>jmsim@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>                                

                                <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 유철호</dt>
                                        <dd class="fake-table-td">
                                            <p>모금사업 총괄 </p>
                                            <p><i class="sprite-group-tel"></i>064-759-9020</p>
                                            <!-- <p><i class="sprite-group-mail"></i>naouri@chest.or.kr</p> -->
                                        </dd>
                                         <!--<dt class="fake-table-th">대리 김동훈</dt>
                                        <dd class="fake-table-td">
                                            <p>착한가게, 착한일터, 나눔리더, 읍면동 모금사업, 모금행사, 모금실적관리</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9021</p>
                                            <p><i class="sprite-group-mail"></i>kdh@chest.or.kr</p>
                                        </dd> -->
                                    </dl>
                                    <dl class="fake-table-item">
                                        <!-- <dt class="fake-table-th">담당 양재영</dt>
                                        <dd class="fake-table-td">
                                            <p>CMS입력 및 관리, 기부자관리, 읍면동 모금사업, 현물모금보조</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9023</p>
                                            <p><i class="sprite-group-mail"></i>jy10@chest.or.kr</p>
                                        </dd> -->
                                        <dt class="fake-table-th">담당 김지연</dt>
                                        <dd class="fake-table-td">
                                            <p>법인모금, 기관지정기탁사업, CMS관리, 기부자CS, 모금행사, 유공자관리</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9021</p>
                                            <!-- <p><i class="sprite-group-mail"></i>eun@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 김상우</dt>
                                        <dd class="fake-table-td">
                                            <p>개인모금, 아너 소사이어티, 착한가게, 착한가정, 착한일터, 나눔리더(클럽), 읍면동모금사업, 모금함관리, 나눔봉사단</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9022</p>
                                            <!-- <p><i class="sprite-group-mail"></i>sw8095@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 이승미</dt>
                                        <dd class="fake-table-td">
                                            <p>홍보사업, 미디어/이벤트모금</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9023</p>
                                            <!-- <p><i class="sprite-group-mail"></i>seung12@chest.or.kr</p> -->
                                        </dd>
                                        
                                        <dt class="fake-table-th">담당 윤진수</dt>
                                        <dd class="fake-table-td">
                                            <p>기관지정기탁사업 보조, 물품지정기탁, 제주특별자치도개발공사 사회공헌사업, 온라인홍보</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9024</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yj0901@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                <h4 class="title-heading_a mg-t-l">나눔사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김성율</dt>
                                        <dd class="fake-table-td">
                                            <p>나눔사업 총괄</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9060</p>
                                            <!-- <p><i class="sprite-group-mail"></i>7575486@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 변은정</dt>
                                        <dd class="fake-table-td">
                                            <p>기관기획사업, 읍면동 배분사업, 제주농협 희망Dream 사업</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9061</p>
                                            <!-- <p><i class="sprite-group-mail"></i>dreamy80@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 강예진</dt>
                                        <dd class="fake-table-td">
                                            <p>신청사업, 개인기획사업, 카카오인터넷하는돌하르방 지원사업</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9062</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jih99109@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 임수연</dt>
                                        <dd class="fake-table-td">
                                            <p>개인지정기탁사업, 기관지정기탁사업 보조 </p>
                                            <p><i class="sprite-group-tel"></i>064-759-9064</p>
                                            <!-- <p><i class="sprite-group-mail"></i>lsy@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 곽현지</dt>
                                        <dd class="fake-table-td">
                                            <p>복권사업, 긴급지원사업, 기초복지개인지원사업, 배분차량관리</p>
                                            <p><i class="sprite-group-tel"></i>064-759-9063</p>
                                            <!-- <p><i class="sprite-group-mail"></i>khj@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>                                
                                <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김성율</dt>
                                        <dd class="fake-table-td">
                                            <p> 경영관리 총괄, 회계·인사 업무 총괄 </p>
                                            <p><i class="sprite-group-tel"></i>064-759-9060</p>
                                            <!-- <p><i class="sprite-group-mail"></i>naouri@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 김동훈</dt>
                                        <dd class="fake-table-td">
                                            <p>회계 및 인사 업무 담당 </p>
                                            <p><i class="sprite-group-tel"></i>064-759-9081</p>
                                            <!-- <p><i class="sprite-group-mail"></i>kdh@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </section>
                        <!-- E : 조직도 -->
<!--                         S : 명예회장 -->
<!--                         <section class="ui-tab-pnl" id ="pnl1" > -->
<!--                             <div class="tab-contents"> -->
<!--                                 <div class="person-area"> -->
<!--                                     <div class="person-item"> -->
<!--                                         <div class="person-col-tit"> -->
<!--                                             <p class="person-position">제 1대 회장</p> -->
<!--                                             <p class="person-time">1998.08.21 ~ 1999.02.26</p> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-photo"> -->
<!--                                             <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt=""></div> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-info"> -->
<!--                                             <p class="person-name">한창영</p> -->
<!--                                             <p class="person-txt"></p> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                 </div> -->

<!--                                 <div class="person-area"> -->
<!--                                     <div class="person-item"> -->
<!--                                         <div class="person-col-tit"> -->
<!--                                             <p class="person-position">제 2대 회장</p> -->
<!--                                             <p class="person-time">1999.02.27 ~ 1999.06.29</p> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-photo"> -->
<!--                                             <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt=""></div> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-info"> -->
<!--                                             <p class="person-name">현태식</p> -->
<!--                                             <p class="person-txt"></p> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                 </div> -->


<!--                                 <div class="person-area"> -->
<!--                                     <div class="person-item"> -->
<!--                                         <div class="person-col-tit"> -->
<!--                                             <p class="person-position">제 3대 회장</p> -->
<!--                                             <p class="person-time">1999.07.26 ~ 2002.11.12</p> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-photo"> -->
<!--                                             <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt=""></div> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-info"> -->
<!--                                             <p class="person-name">김두운</p> -->
<!--                                             <p class="person-txt"></p> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->


<!--                                 <div class="person-area"> -->
<!--                                     <div class="person-item"> -->
<!--                                         <div class="person-col-tit"> -->
<!--                                             <p class="person-position">제 4대 회장</p> -->
<!--                                             <p class="person-time">2002.11.13 ~ 2004.11.12</p> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-photo"> -->
<!--                                             <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt=""></div> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-info"> -->
<!--                                             <p class="person-name">홍경선</p> -->
<!--                                             <p class="person-txt"></p> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->



<!--                                 <div class="person-area"> -->
<!--                                     <div class="person-item"> -->
<!--                                         <div class="person-col-tit"> -->
<!--                                             <p class="person-position">제 5대 회장</p> -->
<!--                                             <p class="person-time">2004.11.13 ~ 2008.11.12</p> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-photo"> -->
<!--                                             <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt=""></div> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-info"> -->
<!--                                             <p class="person-name">한동휴</p> -->
<!--                                             <p class="person-txt"></p> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->


<!--                                 <div class="person-area"> -->
<!--                                     <div class="person-item"> -->
<!--                                         <div class="person-col-tit"> -->
<!--                                             <p class="person-position">제 6대 회장</p> -->
<!--                                             <p class="person-time">2008.11.13 ~ 2010.11.12 </p> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-photo"> -->
<!--                                             <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt=""></div> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-info"> -->
<!--                                             <p class="person-name">박찬식</p> -->
<!--                                             <p class="person-txt"></p> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->


<!--                                 <div class="person-area"> -->
<!--                                     <div class="person-item"> -->
<!--                                         <div class="person-col-tit"> -->
<!--                                             <p class="person-position">제 7대 회장</p> -->
<!--                                             <p class="person-time">2010.11.13 ~ 2013.11.12 </p> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-photo"> -->
<!--                                             <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt=""></div> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-info"> -->
<!--                                             <p class="person-name">김순두</p> -->
<!--                                             <p class="person-txt"></p> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->


<!--                                 <div class="person-area"> -->
<!--                                     <div class="person-item"> -->
<!--                                         <div class="person-col-tit"> -->
<!--                                             <p class="person-position">제 8대 회장</p> -->
<!--                                             <p class="person-time">2013.11.13 ~ 2018.10.30</p> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-photo"> -->
<!--                                             <div class="photo-box"><img src="/common/img/contents/group_person_chairman.jpg" alt=""></div> -->
<!--                                         </div> -->
<!--                                         <div class="person-col-info"> -->
<!--                                             <p class="person-name">고승화</p> -->
<!--                                             <p class="person-txt"></p> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                             </div> -->
<!--                         </section> -->
<!--                         E : 명예회장 -->
                        <!-- S : 회장 -->
                        <section class="ui-tab-pnl" id ="pnl2" >
                            <div class="tab-contents">
                                <div class="person-area">
                                    <div class="person-item">
                                        <div class="person-col-tit">
                                            <p class="person-position">제9대 회장</p>
                                            <p class="person-time">2018.10 ~ 현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman1_17.jpg" alt=""></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">김남식</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>2007</dt>
                                                    <dd>(주)청봉환경 대표이사</dd>
                                                    <dt>2009</dt>
                                                    <dd>제주대학교 친환경해양산업 뉴트론티어 전문이력 양성사업단 컨설팅 위원</dd>
                                                    <dt>2009</dt>
                                                    <dd>제주대학교 토목환경공학과 겸임교수</dd>
                                                    <dt>2015</dt>
                                                    <dd>제주특별자치도 제주시 복지위원</dd>
                                                    <dt>2015</dt>
                                                    <dd>유성건설(주) 대표이사</dd>
                                                    <dt>2017</dt>
                                                    <dd>제주특별자치도 장애인지원협의회 수석부회장</dd>
                                                    <dt>2018</dt>
                                                    <dd>대통령 표창</dd>
                                                    <dt>2020</dt>
                                                    <dd>국제로타리 초아의 봉사상</dd>
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
                        <section class="ui-tab-pnl" id ="pnl3" >
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
                                                <td class="td-point">김남식</td>
                                                <td colspan="3">제주사회복지공동모금회 회장 </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부회장</th>
                                                <td class="td-point">신영민</td>
                                                <td colspan="3">상익건설(주) 대표 </td>
                                            </tr>

                                            <tr>
                                                <th scope="row" rowspan="7">위원</th>
                                                <td class="td-point">강승표</td>
                                                <td>농협은행제주영업본부 본부장</td>
                                                <td class="td-point">고광준</td>
                                                <td>제주케이라인 부사장 </td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">강성훈</td>
                                                <td>주원종합건설(주) 대표이사</td>
                                                <td class="td-point">김봉옥</td>
                                                <td>현대종합블루핸즈세기자동차공업사 대표 </td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김형준</td>
                                                <td>탑동365병원 원장 </td>
                                                <td class="td-point">문성원</td>
                                                <td>델문도 대표이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박경란</td>
                                                <td>(주)신동아문구 대표</td>
                                                <td class="td-point">양영철</td>
                                                <td>부웅주택 대표 </td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이인철</td>
                                                <td>㈜동서시스템 대표 </td>
                                                <td class="td-point">장승남</td>
                                                <td>(주)아라온제주 대표이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">진관훈</td>
                                                <td>제주대학교 행정학과 겸임교수 </td>
                                                <td class="td-point">한희섭</td>
                                                <td>금나종합건설(주) 대표 </td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">현동수</td>
                                                <td colspan="3">(주)동민건설 대표</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="3" class="no-line">감사</th>
                                                <td class="td-point">고영민</td>
                                                <td colspan="3">회계법인 길인 공인회계사 </td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">현창곤</td>
                                                <td colspan="3">현창곤법률사무소 대표</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- E : 운영위원회 -->
                        <!-- S : 분과실행위원회 -->
                        <section class="ui-tab-pnl" id ="pnl4" >
                            <div class="tab-contents">
                                <h4 class="title-heading_a mg-t-m">홍보분과실행위원</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="홍보분과실행위원">
                                            <caption>홍보분과실행위원 정보입니다.</caption>
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
                                                <td class="td-point">문성원</td>
                                                <td colspan="3">델문도 대표이사</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">김석주</td>
                                                <td colspan="3">제주매일 편집국장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="5" class="no-line">위원</th>
                                                <td class="td-point">고창일</td>
                                                <td>이슈제주 편집국장</td>
                                                <td class="td-point">김석범</td>
                                                <td>KCTV제주방송 보도국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김성진</td>
                                                <td>제주의소리 편집국장</td>
                                                <td class="td-point">김태윤</td>
                                                <td>제주투데이 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김형훈 </td>
                                                <td>미디어제주 편집국장 </td>
                                                <td class="td-point">윤철수 </td>
                                                <td>헤드라인제주 대표이사 </td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">조상윤 </td>
                                                <td>한라일보 편집국장 </td>
                                                <td class="td-point">채병수 </td>
                                                <td>JIBS제주방송 경영관리이사 </td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">고미 </td>
                                                <td colspan="3">제민일보 편집국장 </td>
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
                                                <td class="td-point">한희섭</td>
                                                <td colspan="3">금나종합건설(주) 대표</td>
                                            </tr>
                                            <!-- 
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">김명희</td>
                                                <td colspan="3">바위수산 대표</td>
                                            </tr>
                                            -->
                                            <tr>
                                                <th scope="row" rowspan="8" class="no-line">위원</th>
                                                <td class="td-point">고경남</td>
                                                <td>탑학원 원장</td>
                                                <td class="td-point">고규진 </td>
                                                <td>대한건설협회제주특별자치도회 사무처장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김남혁 </td>
                                                <td>가람영산건축사무소 대표</td>
                                                <td class="td-point">김병희</td>
                                                <td>창신주택 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김우철 </td>
                                                <td>용우종합건설 대표이사</td>
                                                <td class="td-point">김정익</td>
                                                <td>농협중앙회제주지역본부 상호금융지원단 단장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">신명환</td>
                                                <td>현대자동차 일도대리점 대표</td>
                                                <td class="td-point">양성우</td>
                                                <td>제주특별자치도관광협회 제주종합관광안내센터장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">양헌수</td>
                                                <td>대한전문건설협회제주특별자치도회 사무처장</td>
                                                <td class="td-point">이정희</td>
                                                <td>농업회사법인(주)농업제주특화사업단 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">조광희</td>
                                                <td>아이비장식 대표</td>
                                                <td class="td-point">홍권일</td>
                                                <td>그린마트 대표</td>
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
                                                <td class="td-point">진관훈</td>
                                                <td colspan="3">제주대학교 행정학과 겸임교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">고수희</td>
                                                <td colspan="3">평안전문요양원 원장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="8" class="no-line">위원</th>
                                                <td class="td-point">강세현</td>
                                                <td>제주한라대학교 사회복지과 교수</td>
                                                <td class="td-point">고보선</td>
                                                <td>제주국제대학교 사회복지학과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">고봉운</td>
                                                <td>홍익영아원 원장</td>
                                                <td class="td-point">김진우 </td>
                                                <td>제주양로원 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김찬수</td>
                                                <td>제주시각장애인복지관 사무국장</td>
                                                <td class="td-point">문복심 </td>
                                                <td>드림요양원 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">부현철</td>
                                                <td>제주특별자치도수어통역센터 사무국장</td>
                                                <td class="td-point">오지만</td>
                                                <td>더희망제주 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">유진의</td>
                                                <td>前제주특별자치도의회 의원</td>
                                                <td class="td-point">윤보철</td>
                                                <td>서귀포시장애인종합복지관 관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이신선</td>
                                                <td>서귀포YWCA사무총장</td>
                                                    <td class="td-point">임정민</td>
                                                <td>국제가정문화원 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">허명숙</td>
                                                <td>예어린이집 원장</td>
                                                <td class="td-point">홍영진</td>
                                                <td>제주장애인평생교육센터 센터장</td>
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
                                                <col class="col-w02">
                                                <col>
                                                <col class="col-w02">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <td class="td-point">고수희</td>
                                                <td>평안전문요양원 원장</td>
                                                <td class="td-point">김명열</td>
                                                <td>탐라장애인종합복지관 팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김미리</td>
                                                <td>제주가정위탁지원센터 사무국장</td>
                                                <td class="td-point">김미아</td>
                                                <td>애서원 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김민범</td>
                                                <td>무지개마을 사무국장</td>
                                                <td class="td-point">김홍철</td>
                                                <td>제주연구원 전문연구원</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김효선 </td>
                                                <td>창암재활원 사무국장</td>
                                                <td class="td-point">민은화</td>
                                                <td>청소년활동진흥센터 팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">신현학</td>
                                                <td>서귀포시장애인종합복지관 팀장</td>
                                                <td class="td-point">안소연</td>
                                                <td>뜨락 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">양권철</td>
                                                <td>동제주종합사회복지관 조천읍센터 센터장</td>
                                                <td class="td-point">오창석</td>
                                                <td>평안전문요양원 팀장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이미정</td>
                                                <td>제주케어하우스 원장</td>
                                                <td class="td-point">이선희</td>
                                                <td>국제가정문화원 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이은주</td>
                                                <td>서부종합사회복지관 과장</td>
                                                <td class="td-point">장윤성</td>
                                                <td>동부종합사회복지관 과장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">전순심</td>
                                                <td colspan="3">홍익아동복지센터 사무국장</td>
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
        
