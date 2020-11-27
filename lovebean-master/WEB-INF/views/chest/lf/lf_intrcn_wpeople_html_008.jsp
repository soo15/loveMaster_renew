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
                                <div class="group-imgbox"><img src="/common/img/contents/group_img08.jpg" alt=""></div>
                                
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">강학봉</dt>
                                        <dd class="fake-table-td">
                                            <p>- 사무처 총괄</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hbkang1245@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>                                
                                
                                <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 윤희철</dt>
                                        <dd class="fake-table-td">
                                            <p>- 경영관리팀 업무총괄</p>
											<p>- 나눔봉사단</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9020</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yunhc@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 우길산</dt>
                                        <dd class="fake-table-td">
                                            <p>- 회계, 총무<br>
												- 시보조금 운영<br>
												- 나눔봉사단</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9021</p>
                                            <!-- <p><i class="sprite-group-mail"></i>kimsujin0417@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김미정</dt>
                                        <dd class="fake-table-td">
                                            <p>- 모금사업팀 업무 총괄</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9010</p>
                                            <!-- <p><i class="sprite-group-mail"></i>junga96@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 김홍재</dt>
                                        <dd class="fake-table-td">
                                            <p>- 아너소사이어티<br>
												- 나눔리더, 리더스클럽<br>
												- 기업모금</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9012</p>
                                            <!-- <p><i class="sprite-group-mail"></i>shvpya@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 임다은</dt>
                                        <dd class="fake-table-td">
                                            <p>- 현금지정기탁(개인)<br>
												- 홍보<br>
												- 기부자관리</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9011</p>
                                            <!-- <p><i class="sprite-group-mail"></i>ster245@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 최형선</dt>
                                        <dd class="fake-table-td">
                                            <p>- 착한일터, 가게, 가정<br>
											- 천사계좌</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9013</p>
                                            <!-- <p><i class="sprite-group-mail"></i>qhtjr3410@chset.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 송정은</dt>
                                        <dd class="fake-table-td">
                                            <p>- 현물사업<br>
- 연합모금<br>
- 학교모금</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9014</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jessong@chset.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김현정</dt>
                                        <dd class="fake-table-td">
                                            <p>- 배분사업팀 업무 총괄</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9030</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yes@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 김진한</dt>
                                        <dd class="fake-table-td">
                                            <p>- 고려아연, S-OIL<br>
												- 현금지정기탁(기관)</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9031</p>
                                            <!-- <p><i class="sprite-group-mail"></i>k9530008@chest.or.kr </p> -->
                                        </dd>
                                    </dl>                                        
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 김지숙</dt>
                                        <dd class="fake-table-td">
                                            <p>- 대한유화, 롯데삼동<br>
											- 신청사업<br>
											- 기획사업</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9034</p>
                                            <!-- <p><i class="sprite-group-mail"></i>kjsook@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 박균우</dt>
                                        <dd class="fake-table-td">
                                            <p>- SK<br>
											- 긴급·의료비지원 사업<br>
											- 기획사업(기초복지)</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9032</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hanb2277@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 이선진</dt>
                                        <dd class="fake-table-td">
                                            <p>- 복권기금사업<br>
											- 현대자동차·중공업, 삼성<br>
											- 나눔천사 배분(기관)</p>
                                            <p><i class="sprite-group-tel"></i>052-270-9033</p>
                                            <!-- <p><i class="sprite-group-mail"></i>tjswls5687@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </section>
                        <!-- E : 조직도 -->
                        <!-- S : 회장 -->
                        <section class="ui-tab-pnl" id ="pnl1">
                            <div class="tab-contents">
                                <div class="person-area">
                                    <div class="person-item">
                                        <div class="person-col-tit">
                                            <p class="person-position">제10대 회장</p>
                                            <p class="person-time">2018.10 ~ 현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_08.jpg" alt="한시준 프로필 이미지"></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">한시준</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>~ 2019</dt>
                                                    <dd>
                                                        울산 로타리클럽 회장<br>
                                                        국제로타리 3721지구 총재<br>
                                                        (사)한국로타리 총재단 의장<br>
                                                        울산시 의사회 회장<br>
                                                        울산지방법원 조정위원회 회장<br>
                                                        한시준 정형외과 원장
                                                    </dd>
                                                    <dt>2019 ~</dt>
                                                    <dd>
                                                        뉴스타트 병원 이사장<br>
                                                        (재)행파장학재단 이사장
                                                </dl>
                                                <p class="person-profile-tit">[상훈]</p>
                                                <div class="person-profile-item">
                                                    <ul>
                                                        <li>국민훈장 모란장</li>
                                                        <li>노동부 장관 표창</li>
                                                        <li>국세청장 표창</li>
                                                        <li>국제로타리 회장상</li>
                                                    </ul>
                                                </div>
                                                <p class="person-profile-tit">[자랑스런 동문상]</p>
                                                <div class="person-profile-item">
                                                    <ul>
                                                        <li>부산대학교 의과대학 동창회</li>
                                                    </ul>
                                                </div>
                                                <p class="person-profile-tit">[행림대상]</p>
                                                <div class="person-profile-item">
                                                    <ul>
                                                        <li>울산광역시 의사회</li>
                                                    </ul>
                                                </div>
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
                        <section class="ui-tab-pnl" id ="pnl2">
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
                                            <td class="td-point">한시준</td>
                                            <td>사회복지공동모금회 회장 </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                <table summary="실행위원장">
                                    <caption>실행위원장 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row">모금분과<br> / <br>실행위원장</th>
                                            <td class="td-point">이진용</td>
                                            <td>(주)하나공업 대표이사</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">배분분과<br> / <br>실행위원장</th>
                                            <td class="td-point">김지찬</td>
                                            <td>울산과학대학교 물류유통경영학과 교수</td>
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
                                                <th scope="row" rowspan="6" class="no-line">위원</th>
                                                <td class="td-point">김광명</td>
                                                <td>울산광역시 복지여성건강국장</td>
                                                <td class="td-point">김승석</td>
                                                <td>근로복지공단 상임감사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김종걸</td>
                                                <td>ubc울산방송 사장</td>
                                                <td class="td-point">박정희</td>
                                                <td>OK안전물산 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">백순흠</td>
                                                <td>고려아연㈜온산제련소장</td>
                                                <td class="td-point">엄주호</td>
                                                <td>경상일보 대표이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">오승환</td>
                                                <td>한국사회복지사협회장</td>
                                                <td class="td-point">이치윤</td>
                                                <td>(주)덕양 회장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">임채일</td>
                                                <td>울산제일일보 대표이사</td>
                                                <td class="td-point">이형우</td>
                                                <td>울산광역시 복지여성건강국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">전영도</td>
                                                <td>울산상공회의소 회장</td>
                                                <td class="td-point">정재오</td>
                                                <td>울산광역시교육청 교육국장</td>
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
                                            <td class="td-point">김병수</td>
                                            <td>법무법인 삼성 변호사</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">최근호</td>
                                            <td>대주회계법인 회계사</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <!-- E : 운영위원회 -->
                        <!-- S : 분과실행위원회 -->
                        <section class="ui-tab-pnl" id ="pnl3">
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
                                                <td class="td-point">이진용</td>
                                                <td colspan="3">(주)하나공업 회장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="2">부위원장</th>
                                                <td class="td-point">문병원</td>
                                                <td colspan="3">원한약건재방 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이강수</td>
                                                <td colspan="3">SK텔레콤 지산대리점 대표이사</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="9">위원</th>
                                                <td class="td-point">고평자</td>
                                                <td>사)한국여성지도자울산연합회</td>
                                                <td class="td-point">김윤봉</td>
                                                <td>민주평화통일자문회의 울산중구협의회장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김진영</td>
                                                <td>울산신문 편집이사</td>
                                                <td class="td-point">김현숙</td>
                                                <td>울산어린이집연합회 회장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박보봉</td>
                                                <td>(사)소비자교육중앙회울산광역시지부 회장</td>
                                                <td class="td-point">박준영</td>
                                                <td>학교종이땡땡땡 사장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">박진술</td>
                                                <td>전)국제라이온스355-D지구 재무총장</td>
                                                <td class="td-point">백운찬</td>
                                                <td>울산광역시의회 보육정책 특별위원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">서상용</td>
                                                <td>JCN울산중앙방송 보도본부장</td>
                                                <td class="td-point">송귀홍</td>
                                                <td>경상일보 전무이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">신성봉</td>
                                                <td>울산광역시중구의회 의장</td>
                                                <td class="td-point">윤영선</td>
                                                <td>아이윤메디컬센터 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이홍섭</td>
                                                <td>사)아름다운 다문화공동체 재단이사장</td>
                                                <td class="td-point">이희자</td>
                                                <td>사)아이누리 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">전우수</td>
                                                <td>극단 푸른가시 대표</td>
                                                <td class="td-point">정해조</td>
                                                <td>울산제대로알기연구소 소장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">조영상</td>
                                                <td>(주)오양 대표</td>
                                                <td class="td-point">진철호</td>
                                                <td>전, 한국외식중앙회울산지회장</td>
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
                                                <td class="td-point">김지찬</td>
                                                <td colspan="3">울산과학대학교 물류유통경영학과 교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="2">부위원장</th>
                                                <td class="td-point">이경신</td>
                                                <td colspan="3">울산동구청소년상담복지센터 소장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김재인</td>
                                                <td colspan="3">한국노총울산지역본부 정책기획실장</td>
                                            </tr>
                                                <th scope="row" rowspan="5">위원</th>
                                                <td class="td-point">강병완</td>
                                                <td>울산청맥외과병원 원장</td>
                                                <td class="td-point">권구배</td>
                                                <td>법률사무소 우덕 변호사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김미주</td>
                                                <td>울산과학대학교 사회복지학과 교수</td>
                                                <td class="td-point">박홍주</td>
                                                <td>박홍주세무회계사무소 대표(세무사)</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">서찬수</td>
                                                <td>경상일보편집국장</td>
                                                <td class="td-point">시진욱</td>
                                                <td>부강종합건축사사무소 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이동렬</td>
                                                <td>북구자원봉사센터장</td>
                                                <td class="td-point">정주태</td>
                                                <td>S&C엔지니어링 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최정자</td>
                                                <td colspan="3">울산광역시청 복지인구정책과장</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <h4 class="title-heading_a mg-t-m">배분평가지원단</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="배분평가지원단">
                                            <caption>배분평가지원단 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col class="col-w02">
                                                <col>
                                                <col class="col-w02">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <!-- <tr>
                                                <th scope="row">위원장</th>
                                                <td class="td-point">이강수</td>
                                                <td colspan="3">지산정보통신㈜ 대표이사</td>
                                            </tr> -->
                                            <tr>
                                                <th scope="row">부단장</th>
                                                <td class="td-point">김태한</td>
                                                <td colspan="3">울산광역시노인복지관 관장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="7">단원</th>
                                                <td class="td-point">김민경</td>
                                                <td>울산광역시발달장애인지원센터 센터장</td>
                                                <td class="td-point">김현주</td>
                                                <td>울산남구여자중장기청소년쉼터 소장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김민정</td>
                                                <td>울산중구종합사회복지관 부장</td>
                                                <td class="td-point">김종훈</td>
                                                <td>울산장애인자립생활센터 소장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김창열</td>
                                                <td>남목청소년문화의집 관장</td>
                                                <td class="td-point">남정주</td>
                                                <td>울산광역시노인보호전문기관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">장은희</td>
                                                <td>울산광역시장애인종합복지관 사무국장</td>
                                                <td class="td-point">오곡단</td>
                                                <td>북구자원봉사센터 사무국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김복희</td>
                                                <td>울산사회복지사협회 사무처장</td>
                                                <td class="td-point">이진명</td>
                                                <td>울산남구종합사회복지관 총괄과장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이선희</td>
                                                <td colspan="3">울산광역시시각장애인복지관 국장</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <h4 class="title-heading_a mg-t-m">시민참여위원</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="시민참여위원">
                                            <caption>시민참여위원 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col class="col-w02">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row">위원장</th>
                                                <td class="td-point">이강수</td>
                                                <td>지산정보통신㈜ 대표이사</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="2">부위원장</th>
                                                <td class="td-point">이재경</td>
                                                <td>보령약국 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최금열</td>
                                                <td>경남은행 시청지점 지점장</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="4">위원</th>
                                                <td class="td-point">김태남</td>
                                                <td>울산광역시 시각장애인복지관 관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이상식</td>
                                                <td>바르게살기운동 울산시협의회 사무처장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">조재훈</td>
                                                <td>울산 남구청 공보특보</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최주익</td>
                                                <td>세무법인 텍스테크 대표</td>
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
        
