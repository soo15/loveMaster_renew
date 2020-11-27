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
                                <div class="group-imgbox"><img src="/common/img/contents/group_img10.jpg" alt=""></div>
                                <h4 class="title-heading_a mg-t-l">회장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">유계식</dt>
                                        <dd class="fake-table-td">
                                            <p>강원지회 총괄</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-1727</p>
                                           <!--  <p><i class="sprite-group-mail"></i>mansuk2013@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">사무처장</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">김동극</dt>
                                        <dd class="fake-table-td">
                                            <p>사무국 총괄 </p>
                                            <p><i class="sprite-group-tel"></i>033-244-0661</p>
                                           <!--  <p><i class="sprite-group-mail"></i>kdk0913@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">경영관리팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 노진석</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 경영관리 업무총괄<br>
											  - 경영관리 계획수립 <br>
                                              - 연간사업계획 및 예산 수립</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-1728</p>
                                            <!-- <p><i class="sprite-group-mail"></i>nogija@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 유원영</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 총무/구매계약 등 실무업무<br>
											 ○ 세무/회계 등 실무 업무<br>
											 ○ 인사 실무업무 <br>
											 ○ 위원회(운영위원회, 시민감시위원회) 관리</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-0306</p>
                                           <!--  <p><i class="sprite-group-mail"></i>ywy7140@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>
                                <h4 class="title-heading_a mg-t-l">배분사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 노진석</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 배분사업 업무총괄<br>
											 - 연간 배분계획 및 전략수립 <br>
											 - 배분사업 관리 / 배분실적 집계 및 통계자료 작성 </p>
                                            <p><i class="sprite-group-tel"></i>070-4323-1728</p>
                                            <!-- <p><i class="sprite-group-mail"></i>nogija@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 홍현준</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 기업사회공헌 모금·배분
												  (강원랜드, 원주혁신도시 소재 공기업 등)<br>
												○ 전국 기획사업<br>
												○ 2020년 신규기획사업<br>
												○ 총무업무</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-1726</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hjhong@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 김희은</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 지역연계 배분사업<br>
												○ 소규모복지기관지원사업<br>
												○ 배분사업평가관리</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-5990</p>
                                            <!-- <p><i class="sprite-group-mail"></i>haein5073@chest.or.kr</p> -->
                                        </dd>
                                        
                                        <dt class="fake-table-th">주임 신새롬</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 신청사업<br>
												○ 지정기탁사업 (개인일시, 기관)<br>
												○ 배분사업 평가관리<br>
												○ 배분분과실행위원회 및 평가지원단 관리</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-1729</p>
                                            <!-- <p><i class="sprite-group-mail"></i>srshin@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 홍성이</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 긴급지원사업<br>
												○ 명절지원사업, 월동난방비지원사업, 2018년 기획사업<br>
												○ 연합모금 배분사업<br>
												○ 지정기탁사업(기업사회공헌)</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-1725</p>
                                            <!-- <p><i class="sprite-group-mail"></i>srshin@chest.or.kr</p> -->
                                        </dd>
                                        
                                        <dt class="fake-table-th">주임 심귀범</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 복권기금사업<br>
												○ 지정기탁사업 (정기지정기탁, 프로카)<br>
												○ 배분차량 관리
                                            <p><i class="sprite-group-tel"></i>033-244-1661</p>
                                            <!-- <p><i class="sprite-group-mail"></i>srshin@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                </div>                      
                                <h4 class="title-heading_a mg-t-l">모금사업팀</h4>
                                <div class="fake-table-box">
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">팀장 박선욱</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 모금사업 업무총괄<br>
											  - 모금계획 및 전략 수립<br>
											  - 모금사업 관리/ 모금실적 집계 및 통계자료 작성</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-0294</p>
                                            <!-- <p><i class="sprite-group-mail"></i>adventist@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">대리 오세광</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 아너소사이어티<br>
												 ○ 나눔봉사단<br>
												 ○ 기업사회공헌  <br>
												 ○ 모금행사기획(정)</p>
                                            <p><i class="sprite-group-tel"></i>033-243-1664</p>
                                            <!-- <p><i class="sprite-group-mail"></i>skpark2009@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 서정현</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 원주지역 모금총괄(원주, 횡성, 태백, 영월, 정선, 평창)<br>
											 ○ 나눔리더/나눔리더스클럽 <br>
											 ○ 착한일터<br>
											 ○ 모금행사기획(부)</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-2868</p>
                                            <!-- <p><i class="sprite-group-mail"></i>dgyjtjhy@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 홍이슬</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 강릉지역 모금총괄(강릉, 동해, 삼척, 속초, 고성, 양양)<br>
											 ○ 연합모금/ 이벤트·특별모금<br>
											 ○ 착한가게/ 착한가정<br>
											 ○ 도보조금 정산 및 관리</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-0050</p>
                                            <!-- <p><i class="sprite-group-mail"></i>hys0605@chest.or.kr</p> -->
                                        </dd>
                                    </dl>
                                    <dl class="fake-table-item">
                                        <dt class="fake-table-th">주임 정진솔</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 춘천지역 모금총괄(춘천, 홍천, 철원, 화천, 양구, 인제)<br>
												 ○ 대외홍보/ 홍보물 제작 및 홈페이지 관리<br>
												 ○ 미디어 모금 및 언론사 모니터링<br>
												 ○ 나눔교육/ 학교모금</p>
                                            <p><i class="sprite-group-tel"></i>070-4323-6435</p>
                                            <!-- <p><i class="sprite-group-mail"></i>jinsol93@chest.or.kr</p> -->
                                        </dd>
                                        <dt class="fake-table-th">주임 이서빈</dt>
                                        <dd class="fake-table-td">
                                            <p>○ 현물 모금 및 배분 <br>
												 ○ 기부자관리<br>
												 ○ 이니시스/CMS/아웃바운드/간행물 관리</p>
                                            <p><i class="sprite-group-tel"></i>033-244-1662</p>
                                            <!-- <p><i class="sprite-group-mail"></i>yjh1993@chest.or.kr</p> -->
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
                                            <p class="person-position">제7대 회장</p>
                                            <p class="person-time">2020.07 ~ 현재</p>
                                        </div>
                                        <div class="person-col-photo">
                                            <div class="photo-box"><img src="/common/img/contents/group_person_chairman2_10.jpg" alt="한만우 프로필 이미지"></div>
                                        </div>
                                        <div class="person-col-info">
                                            <p class="person-name">유계식</p>
                                            <div class="person-profile">
                                                <p class="person-profile-tit">[주요 약력]</p>
                                                <dl class="person-profile-item">
                                                    <dt>1953년</dt>
                                                    <dd>춘천생</dd>
                                                    <dt>2001년</dt>
                                                    <dd>춘천문화방송㈜ 보도국장</dd>
                                                    <dt>2004년</dt>
                                                    <dd>춘천문화방송㈜ 상임이사<br/>
                                                         한국기자협회 부회장<br/>
                               한강생명포럼 공동대표 ∙ 이사장</dd>
                                                    <dt>2012년</dt>
                                                    <dd>
                                                          강원도사회복지공동모금회 부회장
                                                    </dd>
                                                </dl>
                                                <!-- <p class="person-profile-tit">[수상]]</p>
                                                <div class="person-profile-item">
                                                    <ul>
                                                        <li>중소기업 품질혁신전진대회 석탑산업훈장 수훈(2012년)</li>
                                                        <li>중소기업 품질혁신전진대회 대통령 표창(2004년)</li>
                                                        <li>모범 중소기업인 국무총리 표창(2009년)</li>
                                                        <li>모범 성실납세자 재경부장관 표창(2011년)</li>
                                                        <li>강원도사회공헌장(2016년)</li>
                                                        <li>제1회 강원경제인 대상 수상</li>
                                                        <li>제6회 강원유망중소기업 대상 수상</li>
                                                    </ul>
                                                </div> -->
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
                                            <td class="td-point">유계식</td>
                                            <td>前춘천문화방송이사</td>
                                        </tr>
                                        </tbody>
                                    </table>
									<!--
                                    <table summary="부회장">
                                        <caption>부회장 정보입니다.</caption>
                                        <colgroup>
                                            <col class="col-w01">
                                            <col class="col-w02">
                                            <col>
                                        </colgroup>
                                        <tbody>
										<tr>
                                            <th class="no-line">부회장</th>
                                            <td class="td-point">박주선</td>
                                            <td>홍천문화원장 / 前강원도의회의원</td>
                                        </tr>
                                        </tbody>
                                    </table>-->
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
	                                            <td class="td-point">경민현</td>
	                                            <td>강원도민일보 전무이사</td>
                                                <td class="td-point">고정배</td>
                                                <td>강원도청 보건복지여성국장</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">김영래</td>
                                                <td>강원일보 상무이사</td>
                                                <td class="td-point">박지영</td>
                                                <td>상지대학교 사회복지학과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">양홍춘</td>
                                                <td>강원여성경영인협회장</td>
												<td class="td-point">이상욱</td>
                                                <td>강원사회복지공동모금회 아너소사이어티 강릉권역 회장</td>
                                            </tr>
                                            <tr>
												<td class="td-point">이해균</td>
                                                <td>한림대 글로벌협력대학원 객원교수</td>
                                                <td class="td-point">정경인</td>
                                                <td>前 한국여성경제인협회 강원지회장</td>
                                            </tr>
                                            <tr>
												<td class="td-point">정대현</td>
                                                <td>정대현법률사무소 변호사</td>
												<td class="td-point">홍기종</td>
                                                <td>강원도사회복지협의회 회장</td>
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
                                            <td class="td-point">강영희</td>
                                            <td>한림대학교 식품영양학과 교수</td>
                                        </tr>
                                        <tr>
                                            <td class="td-point">김대영</td>
                                            <td>김대영세무회계사무소 대표</td>
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
                                <h4 class="title-heading_a mg-t-m">배분위원회</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="배분위원회">
                                            <caption>배분위원회 정보입니다.</caption>
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
                                                <td class="td-point">이해균</td>
                                                <td colspan="3">한림대 글로벌협력대학원 객원교수</td>
                                            </tr>
                                            <tr>
                                            <tr>
                                                <th scope="row" rowspan="2">부위원장</th>
                                                <td class="td-point">박선남</td>
                                                <td colspan="3">W아너소사이어티 강원도 대표</td>
                                            </tr>
                                                <td class="td-point">조주복</td>
                                                <td colspan="3">강릉원주대학교 사회복지학과 교수</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" rowspan="5" class="no-line">위원</th>
                                                <td class="td-point">김인</td>
                                                <td>강원국제개발협력센터장</td>
												<td class="td-point">김종상</td>
                                                <td>강릉영동대학교 사회복지과 교수</td>
                                            </tr>
											<tr>
                                                <td class="td-point">문익기</td>
                                                <td>강원일보 마케팅본부장</td>
												<td class="td-point">박병선</td>
                                                <td colspan="3">강릉원주대학교 사회복지학과 교수</td>
                                            <tr>
												<td class="td-point">이은영</td>
												<td>사회복지법 계명복지재단 참사랑의 집 원장</td>
												<td class="td-point">장은석</td>
												<td>세경대학교 사회복지과 교수</td>
                                            </tr>
                                            <tr>
                                                <td class="td-point">전동일</td>
                                                <td>강원대학교 사회복지학과 교수</td>
                                                <td class="td-point">최경일</td>
                                                <td>한라대학교 사회복지학과 교수</td>
                                            </tr>
											<tr>
												<td class="td-point">최영민</td>
												<td>강원도사회복지사협회 사무처장</td>
												<td class="td-point">허남우</td>
												<td>강원도민일보 출판국장</td>
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
        
