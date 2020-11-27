<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사랑의 열매 > 신뢰와투명성 > 시민참여위원회 
 * Author      : 
 * Description : 
 *************************************************************************************************
-->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
$(document).ready(function() { 
}); 
</script>

<div class="sub-visual visual04_03">
	<div class="sub-title-area">
		<h2 class="heading-title-a">신뢰와 투명성</h2>
		<p class="title-sub-txt">사랑의열매는 소중한 성금을 투명하고 공정하게 집행하고 있습니다.</p>
	</div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
 <div class="contents-area">
                <div class="contents-hd">
                    <h3>
                        <strong>시민참여위원회</strong><span>투명성을 위해 더욱 노력하겠습니다</span>
                    </h3>
                    <div class="contents-menu-nav"></div>
                </div>
                        
                <div class="seo-box">
		                        

								<!-- text 추가 -->
								
		                	      <h4 class="title-heading_b mg-b-m ">설립배경</h4>
						            <div class="camp_info mgb-xs">
						                <p class="camp-info-txt">사회복지공동모금회 운영의 투명성 제고</p>
						                <p class="camp-info-txt">시민참여위원들의 참여를 통한 조직신뢰성 및 책임성 강화</p>
						            </div>
						            <h4 class="title-heading_b mg-b-m">구성</h4>
						            <div class="camp_info mgb-xs">
						                <p class="camp-info-txt">설치 : 중앙회 및 17개 시•도 지회</p>
						                <p class="camp-info-txt">인원 : 10~20명 내외(지회는 10인 이내로 구성 가능)</p>
						                <p class="camp-info-txt">위원임기 : 2년</p>
						                <p class="camp-info-txt">대상 : 기부자, 배분대상자, 전문가, 일반시민 등</p>
						            </div>
						            <h4 class="title-heading_b mg-b-m">활동내용</h4>
						            <div class="camp_info mgb-xs">
						                <p class="camp-info-txt">조직운영 및 모금•배분사업에 대한 적정성, 투명성 검토를 위한 활동</p>
						                <p class="camp-info-txt">모금회 사업 및 정책에 관련한 개선 건의 등</p>
						            </div>
								<!--//  -->
                        <!--200214:시민참여위원회(추가)table-->
                        
                            <!--중앙회-->
                                
                                
<c:choose>
<c:when test="${branchCd eq '001'}">
   								<h4 class="title-heading_a mg-t-m">중앙회 시민참여위원</h4>
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
                                                    <td class="td-point">박점식</td>
                                                    <td >천지세무법인 회장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="2">부위원장</th>
                                                    <td class="td-point">성미선</td>
                                                    <td >서울시립 강동노인종합복지관장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">제훈호</td>
                                                    <td >친선고속 대표</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="12">위원</th>
                                                    <td class="td-point">김봉수</td>
                                                    <td >효성 CSR팀 부장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">강근민</td>
                                                    <td >Tampa Sandwich bar 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김광수</td>
                                                    <td >성동노인종합복지관 관장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김연은</td>
                                                    <td >생명의전화 종합사회복지관장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김태경</td>
                                                    <td >경기남부일시아동보호소 소장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김영훈</td>
                                                    <td >서울대치과병원 공공의료사업팀장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">정천기</td>
                                                    <td >연합뉴스 미래전략실 부실장 </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이강곤</td>
                                                    <td >한국전광방송광고협회 사무총장 </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">송시현</td>
                                                    <td >재단법인 동천NPO법센터 변호사</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">오윤숙</td>
                                                    <td >오킴스 세무회계사무소 대표 공인회계사</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">윤주희</td>
                                                    <td >사단법인 하트하트재단 인터내셔널 사무총장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박자영</td>
                                                    <td >서울특별시동북권NPO지원센터 사무국장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//중앙회-->
</c:when>  
</c:choose>

<c:choose>
<c:when test="${branchCd eq '002'}">                                  
                            <!--서울-->

                                <h4 class="title-heading_a mg-t-m">서울지회 시민참여위원</h4>
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
                                                    <td class="td-point">김종식</td>
                                                    <td >민주평화통일자문회의 자문위원</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="6">위원</th>
                                                    <td class="td-point">옥경원</td>
                                                    <td >한국지역아동센터연합회 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">기순임</td>
                                                    <td >NPO지원센터 경영기획 실장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이정호</td>
                                                    <td >녹번종합사회복지관 부장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">임혜진</td>
                                                    <td >서울시청 서울민주주의위원회 협치지원관 </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">유영미</td>
                                                    <td >서윤 플라워 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김은미</td>
                                                    <td >유한양행 CSR팀 부장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//서울-->
</c:when>  
</c:choose>                        
                                
<c:choose>
<c:when test="${branchCd eq '005'}">                                  
                            <!--인천-->

							
                                <h4 class="title-heading_a mg-t-m">인천지회 시민참여위원</h4>
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
                                                    <td class="td-point">송석만</td>
                                                    <td >재단법인송이 이사장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="9">위원</th>
                                                    <td class="td-point">홍덕종</td>
                                                    <td >대한건축사협회 인천광역시건축사회 사무처장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">오수진</td>
                                                    <td >인천도시공사 팀장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">서장열</td>
                                                    <td >인천모래내전통시장 상인회장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김명희</td>
                                                    <td >인천주민참여예산지원센터 팀장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">성은혜</td>
                                                    <td >녹색연합 부설 '생태교육센터 이랑' 사무국장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김태희</td>
                                                    <td >협성대학교 국제통상학과 재학</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">조세은</td>
                                                    <td >인천이주여성센터 살러온 부소장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이진희</td>
                                                    <td >인천광역자활센터 사무국장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김정태</td>
                                                    <td >인천정신재활시설협회장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//인천-->
</c:when>  
</c:choose>     
 <c:choose>
<c:when test="${branchCd eq '008'}">                              
                            <!--울산-->

								
                                <h4 class="title-heading_a mg-t-m">울산지회 시민참여위원</h4>
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
                                                    <td >지산정보통신㈜ 대표이사</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="2">부위원장</th>
                                                    <td class="td-point">이재경</td>
                                                    <td >보령약국 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">최금열</td>
                                                    <td >경남은행 시청지점 지점장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="4">위원</th>
                                                    <td class="td-point">김태남</td>
                                                    <td >울산광역시 시각장애인복지관 관장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이상식</td>
                                                    <td >바르게살기운동 울산시협의회 사무처장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">조재훈</td>
                                                    <td >울산 남구 공보특보</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">최주익</td>
                                                    <td >세무법인 텍스테크 대표</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//울산-->
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '010'}">                             
                                
                            <!--강원-->

								
                                <h4 class="title-heading_a mg-t-m">강원지회 시민참여위원</h4>
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
                                                    <td class="td-point">김금주</td>
                                                    <td >홍천환경산업대표<br/>&nbsp;前) 강원W아너대표</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="3">위원</th>
                                                    <td class="td-point">이상민</td>
                                                    <td >철원군지역사회보장협의체 사무국장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">송영순</td>
                                                    <td >강원도청 복지정책과 계장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">최은예</td>
                                                    <td >춘천시민연대 사무국장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//강원-->
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '016'}">                             
                            <!--경남-->

								
                                <h4 class="title-heading_a mg-t-m">경남지회 시민참여위원</h4>
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
                                                    <td class="td-point">공상민</td>
                                                    <td >대흥사무기상사 대표</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="6">위원</th>
                                                    <td class="td-point">이영주</td>
                                                    <td >푸와차이나 성주점 시티세븐점 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">남호근</td>
                                                    <td >한국토지주택공사 총무고객처 차장 </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">한지선</td>
                                                    <td >경남시민사회단체연대회의 사무국장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">조유묵</td>
                                                    <td >마창진참여자치시민연대 사무처장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">정민교</td>
                                                    <td >한국시니어클럽 경남지회장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">승해경</td>
                                                    <td >경상남도다문화가족지원센터장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//경남-->
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '015'}">                             
                            <!--경북-->

							
                                <h4 class="title-heading_a mg-t-m">경북지회 시민참여위원</h4>
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
                                                    <td class="td-point">조현숙</td>
                                                    <td >前) 경산시 복지문화국장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="2">부위원장</th>
                                                    <td class="td-point">김송희</td>
                                                    <td >헵시바 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김일출</td>
                                                    <td >前) 울진군사회보장협의체 대표</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="4">위원</th>
                                                    <td class="td-point">권수정</td>
                                                    <td >前) 청도군 나눔봉사단장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김성수</td>
                                                    <td >경산시노인종합복지관장 </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">방규열</td>
                                                    <td >前)  대구도시철도건설본부 과장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이진우</td>
                                                    <td >성요셉요양원장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//경북-->
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '006'}">                            
                            
                            <!--광주-->

							
                                <h4 class="title-heading_a mg-t-m">광주지회 시민참여위원</h4>
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
                                                    <td class="td-point">김재규</td>
                                                    <td >광주자원봉사센터 이사장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="9">위원</th>
                                                    <td class="td-point">김성수</td>
                                                    <td >전남일보 차장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김예복</td>
                                                    <td >(사)다문화가정행복울타리 이사장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김지현</td>
                                                    <td >일반시민</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박지선</td>
                                                    <td >㈜워킹맘 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">신성수</td>
                                                    <td >광주은행 노동조합 사무국장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">임미란</td>
                                                    <td >광주광역시의회 부의장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">장은미</td>
                                                    <td >지역아동센터 광주지원단 단장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">정석윤</td>
                                                    <td >광주상록교회 담임목사</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">천나리</td>
                                                    <td >법무법인 감동으로 소속변호사</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//광주-->                            
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '007'}">                                  
                            <!--대전-->

                                <h4 class="title-heading_a mg-t-m">대전지회 시민참여위원</h4>
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
                                                    <td class="td-point">강사돈</td>
                                                    <td >㈜예람 대표</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="2">부위원장</th>
                                                    <td class="td-point">박미숙</td>
                                                    <td >㈜비앤비컴퍼니 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박수진</td>
                                                    <td >대전광역시 사회복지사협회 사무처장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="3">위원</th>
                                                    <td class="td-point">권주영</td>
                                                    <td >대전광역시 사회복지협의회 부장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">윤건원</td>
                                                    <td >계룡건설산업㈜ 홍보실장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이승현</td>
                                                    <td >산군법률사무소</td>
                                                </tr>
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//대전-->
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '003'}">                              
                            <!--부산-->

                                <h4 class="title-heading_a mg-t-m">부산지회 시민참여위원</h4>
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
                                                    <td class="td-point">이춘성</td>
                                                    <td >부산재가노인복지협회장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">부위원장</th>
                                                    <td class="td-point">송연익</td>
                                                    <td >에스엠개발</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="8">위원</th>
                                                    <td class="td-point">이녕근</td>
                                                    <td >이녕근세무회계사무소</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김소연</td>
                                                    <td >변호사</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이인숙</td>
                                                    <td >법무사</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박종건</td>
                                                    <td >하나연합의원</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">오상훈</td>
                                                    <td >정현정기물류</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박상복</td>
                                                    <td >메리츠금융 영업이사/경성대 교육학 교수</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">석산스님(문호성)</td>
                                                    <td >안국선원</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이주은</td>
                                                    <td >부산장애인복지관협회장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//부산-->
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '018'}">                              
                            <!--세종-->

								
                                <h4 class="title-heading_a mg-t-m">세종지회 시민참여위원</h4>
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
                                                    <td class="td-point">조혜영</td>
                                                    <td>전) 세종시 여성가족과 과장<br/>
                                                            현) 세종시 인사위원회 위원</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="4">위원</th>
                                                    <td class="td-point">한미희</td>
                                                    <td>전) 세종시나눔봉사단 단장<br/>
                                                            현) 평안의집 원장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">조형권</td>
                                                    <td>낙지한마당 대표이사<br/>
                                                            ㈜현선 대표이사<br/>
                                                            아너소사이어티 회원</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">안우상</td>
                                                    <td>전) 배분분과실행위원회 위원<br/>
                                                        현)한국영상대학교 사회복지학과 교수</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">성은정</td>
                                                    <td>세종시 복지재단 비상임 이사<br/>
                                                            세종참여자치시민연대 사무처장<br/>
                                                            세조시민사회연구소 협조조합 조합원</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//세종-->
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '014'}">                              
                            
                            <!--전남-->

							
                                <h4 class="title-heading_a mg-t-m">전남지회 시민참여위원</h4>
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
                                                    <td class="td-point">이송자</td>
                                                    <td>(사) 소비자교육중앙회 전라남도지부 회장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="8">위원</th>
                                                    <td class="td-point">김종근</td>
                                                    <td>장흥님프만 대표 아너소사이어티 회원</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김종식</td>
                                                    <td>전남다문화가족지원센터연합회 회장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김춘수</td>
                                                    <td>현대삼호중공업 총무부 차장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박경래</td>
                                                    <td>목포과학대학교 취업창업지원센터 처장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이경수</td>
                                                    <td>광주매일신문 상무</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">정행식</td>
                                                    <td>전라남도사회복지사협회 회장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">홍현주</td>
                                                    <td>광주은행전남영업부 부부장 </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이남형</td>
                                                    <td>한국수자원공사 영산강섬진강유역본부 시설관리부장 </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//전남-->
</c:when>
</c:choose>

<c:choose>
<c:when test="${branchCd eq '013'}">   
                            <!--전북-->

                                <h4 class="title-heading_a mg-t-m">전남지회 시민참여위원</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="시민참여위원">
                                            <caption>시민참여위원 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">위원장</th>
                                                    <td class="td-point">김병구</td>
                                                    <!-- <td>전주시노인취업지원센터 센터장</td> -->
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="2">부위원장</th>
                                                    <td class="td-point">노시형</td>
                                                    <!--<td>한빛원자력본부 지역협력팀 사회공헌파트 차장</td>-->
                                                </tr>
                                                <tr>
                                                    <td class="td-point">김병구</td>
                                                    <!--<td>전북은행 진북동지점장</td>-->
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="4">위원</th>
                                                    <td class="td-point">김정치</td>
                                                    <!--<td>현대자동차 전주공장 총무팀 책임매니저</td>-->
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박성희</td>
                                                    <!--<td>전주YWCA프로그램, 취업사업 부장</td>-->
                                                </tr>
                                                <tr>
                                                    <td class="td-point">백경한</td>
                                                    <!--<td>전주시약사회 회장</td>-->
                                                </tr>
                                                <tr>
                                                    <td class="td-point">이정민</td>
                                                    <!--<td>전주만돌린오케스트라 단장</td>-->
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//전북-->
</c:when>
</c:choose> 



<c:choose>
<c:when test="${branchCd eq '017'}">   
                            <!--제주-->

                                <h4 class="title-heading_a mg-t-m">제주지회 시민참여위원</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="시민참여위원">
                                            <caption>시민참여위원 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">위원장</th>
                                                    <td class="td-point">김정연</td>
                                                    <td>반석어린이집 원장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">부위원장</th>
                                                    <td class="td-point">김종래</td>
                                                    <td>제주시홀로사는노인지원센터 센터장</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="5">위원</th>
                                                    <td class="td-point">고경준</td>
                                                    <td>제일농장 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">고진석</td>
                                                    <td>제주희망협동조합 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">윤철교</td>
                                                    <td>파스쿠찌한라병원점 대표</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">전내망</td>
                                                    <td>공생하우스 원장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">조경호</td>
                                                    <td>제주특별자치도장애인생활이동지원센터 사무국장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//제주-->
</c:when>
</c:choose>       


<c:choose>
<c:when test="${branchCd eq '012'}">   
                            <!--충남-->

                                <h4 class="title-heading_a mg-t-m">전남지회 시민참여위원</h4>
                                <div class="tb-type_c">
                                    <div class="wide-scroll members">
                                        <table summary="시민참여위원">
                                            <caption>시민참여위원 정보입니다.</caption>
                                            <colgroup>
                                                <col class="col-w01">
                                                <col>
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">위원장</th>
                                                    <td class="td-point">신정용</td>
                                                    <td>신기산업 대표</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" rowspan="5">위원</th>
                                                    <td class="td-point">김관중</td>
                                                    <td>삼성전자 온양캠퍼스 부장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">최비비안</td>
                                                    <td>향림원 원장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">노연선</td>
                                                    <td>사회복귀시설 좋은이웃 국장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박정숙</td>
                                                    <td>충남사랑의열매 도단장</td>
                                                </tr>
                                                <tr>
                                                    <td class="td-point">박성순</td>
                                                    <td>충남자원봉사센터장</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <!--//충남-->
</c:when>
</c:choose>                        
                        <!--// 200214:시민참여위원회(추가)table -->
                        
                </div>
            </div>
	<!--// 컨텐츠 시끝 -->
</main>