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
                                <div class="group-imgbox"><img src="/common/img/contents/group_img04.jpg" alt=""></div>
                                
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">이희정</dt>
                                        <dd class="fake-table-td">
                                            <p>사무국 운영총괄</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hj@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                
                                <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김용수</dt>
                                        <dd class="fake-table-td">
                                            <p>경영관리 업무 총괄(모금사업팀장 겸임)</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1003</p>
                                            <!-- <p><i class="sprite-group-mail"></i>dydtn78@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 배찬주</dt>
                                        <dd class="fake-table-td">
                                            <p>총무/회계 담당</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1021</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jackal@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 김용수</dt>
                                        <dd class="fake-table-td">
                                            <p>모금사업 업무 총괄(경영관리팀장 겸임)</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1003</p>
                                            <!-- <p><i class="sprite-group-mail"></i>dydtn78@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 김찬희</dt>
                                        <dd class="fake-table-td">
                                            <p>기업모금, 아너소사이어티, 언론홍보</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1004</p>
                                            <!-- <p><i class="sprite-group-mail"></i>chanhee33@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 김혁준</dt>
                                        <dd class="fake-table-td">
                                            <p>물품지정기탁(기업/지자체-서구,남구,북구,수성구,달서구), 개인지정기탁</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1022</p>
                                            <!-- <p><i class="sprite-group-mail"></i>wellos@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 홍순지</dt>
                                        <dd class="fake-table-td">
                                            <p>물품지정기탁(지자체-중구,동구,달서구), 착한대구캠페인(총괄/가게/일터), 나눔봉사단 운영</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1006</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hsj9585@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 이혜인</dt>
                                        <dd class="fake-table-td">
                                            <p>기업모금, 홍보업무, 나눔리더·나눔리더스클럽, 학교모금</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1052</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hyein.lee@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 이정근</dt>
                                        <dd class="fake-table-td">
                                            <p>배분사업 업무총괄</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1012</p>
                                            <!-- <p><i class="sprite-group-mail"></i>j5863892@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 장경화</dt>
                                        <dd class="fake-table-td">
                                            <p>기획사업, 유관기관 FGI, 지정기탁사업(아너·기업)</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1005</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jkhcoco@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">대리 류기흠</dt>
                                        <dd class="fake-table-td">
                                            <p>신청사업, 배분사업평가, 지정기탁사업(기업)</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1051</p>
                                            <!-- <p><i class="sprite-group-mail"></i>ryu5704123@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 김보배</dt>
                                        <dd class="fake-table-td">
                                            <p>지역연계사업, 지역사회보장협의체사업</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1011</p>
                                            <!-- <p><i class="sprite-group-mail"></i>bb1004@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">담당 정서현</dt>
                                        <dd class="fake-table-td">
                                            <p>지정기탁사업(기관·월정기), 차량지원사업</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1053</p>
                                            <!-- <p><i class="sprite-group-mail"></i>sh615@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">담당 최유경</dt>
                                        <dd class="fake-table-td">
                                            <p>복권기금사업, 긴급지원사업, 기획사업(재난적 의료비)</p>
                                            <p><i class="sprite-group-tel"></i>053-667-1010</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yk33@chest.or.kr </p> -->
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
                                            <p class="person-position">제13대 회장</p>
                                            <p class="person-time">2019.04 ~ 현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_04.jpg" alt="김수학 프로필 이미지"></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">김수학</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>1954</dt>
                                                    <dd>
                                                        대구 출생<br>
                                                        경북고등학교 졸업<br>
                                                        서울대학교 법과대학 졸업
                                                    </dd>
                                                    <dt>1977</dt>
                                                    <dd>제 19회 사업시험 합격</dd>
                                                    <dt>1982 ~ 1994</dt>
                                                    <dd>대구지방법원 및 대구고등법원 판사</dd>
                                                    <dt>1994 ~ 2001</dt>
                                                    <dd>대구지방법원 부장판사</dd>
                                                    <dt>2001 ~ 2005</dt>
                                                    <dd>대구고등법원 부장판사</dd>
                                                    <dt>2005 ~ 2008</dt>
                                                    <dd>대구지방법원 및 대구고등법원 수석부장판사</dd>
                                                    <dt>2008 ~ 2012</dt>
                                                    <dd>울산지방법원장, 대구지방법원장, 대구고등법원장</dd>
                                                    <dt>2012 ~ 2019</dt>
                                                    <dd>법무법인 중원 대표변호사</dd>
                                                    <dt>2017 ~ 2019</dt>
                                                    <dd>前 대구사랑의열매 부회장 및 배분분과실행위원장</dd>
                                                    <dt>2019 ~</dt>
                                                    <dd>
                                                        법무법인 중원 고문변호사<br>
                                                        제 13대 대구사랑의열매 회장
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
                                            <td class="td-point">김수학</td>
                                            <td>법무법인 중원 고문변호사</td>
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
                                            <th scope="row" rowspan="2">부회장</th>
                                            <td class="td-point">이재경</td>
                                            <td>대구상공회의소 상근부회장</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">손원조</td>
                                            <td>대경회계법인 대표이사</td>
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
                                                <td class="td-point">박윤규</td>
                                                <td>영남일보 편집국장</td>
                                                <td class="td-point">서연경</td>
                                                <td>다나소아과 원장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">신홍식</td>
                                                <td>(사)아트빌리지 대표</td>
                                                <td class="td-point">이성훈</td>
                                                <td>대구MBC 사업국</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">이종선</td>
                                                <td>대구KBS 총무국장</td>
                                                <td class="td-point">임길포</td>
                                                <td>(주)우리텍 대표</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">정연욱</td>
                                                <td>대구사회복지사협회 회장</td>
                                                <td class="td-point">정석헌</td>
                                                <td>TBC 보도국장</td>
                                            <tr>
                                                <td class="td-point">정창룡</td>
                                                <td>매일신문 논설주간</td>
                                                <td class="td-point">최태곤</td>
                                                <td >DGB금융지주 상무(지속가능경영총괄)</td>
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
                                            <td class="td-point">이성림</td>
                                            <td>이성림법률사무소 대표</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">우호정</td>
                                            <td>안경회계법인 상무이사</td>
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
                                                <td class="td-point">손원조</td>
                                                <td colspan="3">대경회계법인 대표이사</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">부위원장</th>
                                                <td class="td-point">김정엽</td>
                                                <td colspan="3">대구한의대학교 노인복지학과 교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="5">위원</th>
                                                <td class="td-point">김수용</td>
                                                <td>매일신문 편집부국장 </td>
                                                <td class="td-point">박진필</td>
                                                <td>대구달서시니어클럽 관장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">안윤정</td>
                                                <td>영남대학교병원 사회사업팀 팀원</td>
                                                <td class="td-point">이창호</td>
                                                <td>영남일보 편집부국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">엄태영</td>
                                                <td>경일대학교 사회복지학과 교수</td>
                                                <td class="td-point">여인숙</td>
                                                <td>경운대학교 상담복지학과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">정한교</td>
                                                <td>대구광역시 복지정책관</td>
                                                <td class="td-point">조상현</td>
                                                <td>안경회계법인 이사</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">최운돈</td>
                                                <td>前)대구상공회의소 사무처장</td>
                                                <td class="td-point">하경환</td>
                                                <td>하경환 법률사무소 대표</td>
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
        
