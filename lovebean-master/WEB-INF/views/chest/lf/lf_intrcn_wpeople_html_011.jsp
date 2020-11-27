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
                        <section class="ui-tab-pnl"  id ="pnl0" >
                            <div class="tab-contents">
                                <div class="group-imgbox"><img src="/common/img/contents/group_img11.jpg" alt=""></div>
                                
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">이상익</dt>
                                        <dd class="fake-table-td">
                                            <p>사무국 운영총괄</p>
                                            <!-- <p><i class="sprite-group-mail"></i>silee@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 박상덕</dt>
                                        <dd class="fake-table-td">
                                            <p>경영관리 총괄</p>
                                            <p><i class="sprite-group-tel"></i>043-238-9101</p>
                                            <!-- <p><i class="sprite-group-mail"></i>whddkgo@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 송진화</dt>
                                        <dd class="fake-table-td">
                                            <p>총무/회계</p>
                                            <p><i class="sprite-group-tel"></i>043-238-2316</p>
                                            <!-- <p><i class="sprite-group-mail"></i>chonguy@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                                                
                                <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 박상덕</dt>
                                        <dd class="fake-table-td">
                                            <p>모금업무 총괄, 홍보업무 총괄, 지역연계모금(충청북도)</p>
                                            <p><i class="sprite-group-tel"></i>043-238-9101</p>
                                            <!-- <p><i class="sprite-group-mail"></i>whddkgo@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">과장 이희정</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계모금(청주시,서원구,보은군,옥천군,영동군), 학교모금관리</p>
                                            <p><i class="sprite-group-tel"></i>043-238-8023</p>
                                            <!-- <p><i class="sprite-group-mail"></i>lhj0715@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 홍상표</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계모금(청원구,충주시,음성군,단양군), 나눔봉사단관리, 착한일터관리</p>
                                            <p><i class="sprite-group-tel"></i>043-238-8025</p>
                                            <!-- <p><i class="sprite-group-mail"></i>ranger6@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 이양재</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계모금(흥덕구,제천시,진천군,괴산군),현물관리</p>
                                            <p><i class="sprite-group-tel"></i>043-238-8024</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yjfile@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 민예은</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계모금(상당구,증평군), 아너소사이어티관리, 나눔리더/리더스클럽관리, 홍보</p>
                                            <p><i class="sprite-group-tel"></i>043-238-8026</p>
                                            <!-- <p><i class="sprite-group-mail"></i>staryeny@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 송단비</dt>
                                        <dd class="fake-table-td">
                                            <p>모금데이터 관리, 착한가게/착한가정관리</p>
                                            <p><i class="sprite-group-tel"></i>043-238-8027</p>
                                            <!-- <p><i class="sprite-group-mail"></i>song4063@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 장성일</dt>
                                        <dd class="fake-table-td">
                                            <p>배분사업 업무총괄</p>
                                            <p><i class="sprite-group-tel"></i>043-238-9102</p>
                                            <!-- <p><i class="sprite-group-mail"></i>tonysi2@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 한주희</dt>
                                        <dd class="fake-table-td">
                                            <p>긴급지원,지정기탁(개인), 기획사업(중앙기획,월동난방비,명절지원,충북교직원제자사랑,배분의제사례발굴)</p>
                                            <p><i class="sprite-group-tel"></i>043-238-2317</p>
                                            <!-- <p><i class="sprite-group-mail"></i>marshan@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 안종철</dt>
                                        <dd class="fake-table-td">
                                            <p>신청사업,지정기탁사업(기관), 기획사업(충주사랑행복나눔,차량지원사업관리)</p>
                                            <p><i class="sprite-group-tel"></i>043-238-8028</p>
                                            <!-- <p><i class="sprite-group-mail"></i>anjc@chest.or.kr </p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 이보람</dt>
                                        <dd class="fake-table-td">
                                            <p>SK하이닉스, 기획사업(연합모금), 지정기탁(협의체)</p>
                                            <p><i class="sprite-group-tel"></i>043-238-8029</p>
                                            <!-- <p><i class="sprite-group-mail"></i>boram210@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 김보연</dt>
                                        <dd class="fake-table-td">
                                            <p>복권기금사업, 기획사업(치매예방,인프라구축,정신건강증진,발달장애인,돌봄종사자,지역복지현안) </p>
                                            <p><i class="sprite-group-tel"></i>043-238-2315</p>
                                            <!-- <p><i class="sprite-group-mail"></i>qhdus1017@chest.or.kr </p> -->
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </section>
                        <!-- E : 조직도 -->
                        <!-- S : 회장 -->
                        <section class="ui-tab-pnl"  id ="pnl1" >
                            <div class="tab-contents">
                                <div class="person-area">
                                    <div class="person-item">
                                        <div class="person-col-tit">
                                            <p class="person-position">제10대 회장</p>
                                            <p class="person-time">2019.11 ~ 현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/owner_11.jpg" alt="노영수 프로필 이미지"></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">노영수</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>2003</dt>
                                                    <dd>청주상공회의소 18대 의원<br></dd>
                                                    <dt>2006</dt>
                                                    <dd>청주산업단지관리공단 부이사장<br>
                                                                                                                              청주지방법원 민사 및 가사 조정위원<br>
                                                                                                                              청주상공회의소 19대 상임의원 
                                                    </dd>
                                                    <dt>2013</dt>
                                                    <dd>목요경제회의 위원<br>
                                                                                                                              충청북도 노사민정협의회 위원<br>
                                                                                                                              충청북도상공회의소협의회 회장<br> 
                                                                                                                              충청북도체육회 부회장<br>
                                                                                                                              기업사랑농촌사랑운동본부 부회장
                                                    </dd>
                                                    <dt>2012~2018</dt>
                                                    <dd>CJB 시청자 운영위원</dd>
                                                    <dt>2013~2018</dt>
                                                    <dd>충북사회복지공동모금회 운영위원 <br>
                                                                                                                              제21대, 22대 청주상공회의소 회장
                                                    </dd>
                                                    <dt>現</dt>
                                                    <dd>
                                                        법무부 법사랑위원 청주지역연합회 부회장<br>
                                                    </dd>
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
                        <section class="ui-tab-pnl"  id ="pnl2" >
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
                                            <td class="td-point">노영수</td>
                                            <td>(주)동화 대표이사</td>
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
                                            <td class="td-point">유재풍</td>
                                            <td>법무법인 청주로 대표변호사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">이두영</td>
                                            <td>청주상공회의소 회장</td>
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
                                                <th scope="row" rowspan="4" class="no-line">위원</th>
                                                <td class="td-point">김준환</td>
                                                <td>충청대학교 사회복지학과 교수</td>
                                                <td class="td-point">박광민</td>
                                                <td>세일하이텍(주) 대표이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박상윤</td>
                                                <td>새한프라텍(주) 대표이사</td>
                                                <td class="td-point">안치석</td>
                                                <td>안치석 VOM여성의원 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">염기동</td>
                                                <td>농협중앙회 충북지역본부장</td>
                                                <td class="td-point">전정애</td>
                                                <td>충청북도보건복지국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최정묵</td>
                                                <td>천주교 청주교구사회복지국장</td>
                                                <td class="td-point">최정옥</td>
                                                <td>충청북도자원봉사센터장</td>
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
                                            <td class="td-point">권태호</td>
                                            <td>법무법인 청주로 대표변호사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김동완</td>
                                            <td>김동완세무회계사무소 회계사</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <!-- E : 운영위원회 -->
                        <!-- S : 분과실행위원회 -->
                        <section class="ui-tab-pnl"  id ="pnl3" >
                            <div class="tab-contents">
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
                                                <td class="td-point">이민성</td>
                                                <td colspan="3">무영종합건설 대표</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">김윤모</td>
                                                <td  colspan="3">유스투게더  상임이사</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="5" class="no-line">위원</th>
                                                <td class="td-point">김응식</td>
                                                <td>임광토건  충청지역본부장</td>
                                                <td class="td-point">박노일</td>
                                                <td>前  충청북도도민홍보대사 사무총장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박인배</td>
                                                <td>한국청소년화랑단연맹본부장</td>
                                                <td class="td-point">어효수</td>
                                                <td>충청북도의사회  사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">유재곤</td>
                                                <td>나스콤  대표이사</td>
                                                <td class="td-point">이인수</td>
                                                <td>충청북도여성정책  포럼 운영위원</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이재영</td>
                                                <td>충청측량기술사사무소  대표이사</td>
                                                <td class="td-point">조영인</td>
                                                <td>前  사랑의열매 어머니봉사단장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최충진</td>
                                                <td colspan="3">청주시의회 의장</td>
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
                                                <td class="td-point">김준환</td>
                                                <td colspan="3">충청대학교 사회복지학부 교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="6" class="no-line">위원</th>
                                                <td class="td-point">김래은</td>
                                                <td>유원대학교 사회복지상담학부 교수</td>
                                                <td class="td-point">김학실</td>
                                                <td>충북대학교 행정학과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">남미옥</td>
                                                <td>정주복지재단 상임이사</td>
                                                <td class="td-point">문은주</td>
                                                <td>충북청소년활동진흥센터 센터장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박보영</td>
                                                <td>극동대학교 사회복지학과 교수</td>
                                                <td class="td-point">손재환</td>
                                                <td>꽃동네대학교 사회복지학과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">염지혜</td>
                                                <td>중원대학교 교양학부 교수</td>
                                                <td class="td-point">장영은</td>
                                                <td>서원대학교 비적학부 사회복지학 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">전용해</td>
                                                <td>Ace-중앙건축사사무소</td>
                                                <td class="td-point">홍석호</td>
                                                <td>청주대학교 사회복지학과 교수</td>
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
        
