
<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 캠페인 > 특별모금 > 코로나19 
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    
    $(document).ready(function(){
    	
    });
    
    /*===========================================================
     * 힘내라 대한민국  이벤트 페이지 이동 버튼 클릭시 Function !!
     *===========================================================*/
    $(document).on("click", "#btnMore", function(e){

        var param = "";
        
        <c:choose>
        <c:when test="${__branchCd eq '001'}">
  		 param = "&mysspecleSn=39";
	   </c:when>
	   <c:when test="${__branchCd eq '002'}">
	       param = "&mysspecleSn=28";
	   </c:when>
	   <c:when test="${__branchCd eq '003'}">
	       param = "&mysspecleSn=29";
	   </c:when>
	   <c:when test="${__branchCd eq '004'}">
	   param = "&mysspecleSn=23";
	   </c:when>
	   <c:when test="${__branchCd eq '005'}">
	   param = "&mysspecleSn=24";
	   </c:when>
	   <c:when test="${__branchCd eq '006'}">
	   param = "&mysspecleSn=30";
	   </c:when>
	   <c:when test="${__branchCd eq '007'}">
	   param = "&mysspecleSn=25";
	   </c:when>
	   <c:when test="${__branchCd eq '008'}">
	   param = "&mysspecleSn=26";
	   </c:when>
	   <c:when test="${__branchCd eq '010'}">
	   param = "&mysspecleSn=31";
	   </c:when>
	   <c:when test="${__branchCd eq '011'}">
	   param = "&mysspecleSn=32";
	   </c:when>
	   <c:when test="${__branchCd eq '012'}">
	   param = "&mysspecleSn=33";
	   </c:when>
	   <c:when test="${__branchCd eq '013'}">
	   param = "&mysspecleSn=34";
	   </c:when>
	   <c:when test="${__branchCd eq '014'}">
	   param = "&mysspecleSn=35";
	   </c:when>
	   <c:when test="${__branchCd eq '015'}">
	   param = "&mysspecleSn=36";
	   </c:when>
	   <c:when test="${__branchCd eq '016'}">
	   param = "&mysspecleSn=27";
	   </c:when>
	   <c:when test="${__branchCd eq '017'}">
	   param = "&mysspecleSn=37";
	   </c:when>
	   <c:when test="${__branchCd eq '018'}">
	   param = "&mysspecleSn=38";
	   </c:when>
        </c:choose>
        gf_submitMovePage("<c:url value='/ca/speclmys/initSpeclmysDetail.do' />", param );

    });


    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/

</script>


<div class="base-body type-sub" id="baseBody">
	<div class="sub-visual visual00_01">
	    <div class="sub-title-area">
	        <h2 class="heading-title-a">특별모금</h2>
	        <p class="title-sub-txt">사랑의 열매는 연중 다양한 주제로 모금을 진행하고 있습니다.</p>
	    </div>
	</div>
    
	<%@ include file="../../layout/breadcrumbs.jsp"%>

			<main class="base-main" id="baseMain">
				<div class="contents-area" id="pageTop">
                    <div class="contents-hd">
                        <h3><strong>코로나19 특별모금</strong><span>코로나19 극복에 앞장서겠습니다.</span></h3>
                        <div class="contents-menu-nav">
                        </div>
                    </div>
            
                    <div class="seo-box" id="searchArea">
                        <div class="area-type-a type5">
                        	<a class="fixbtn" href="#pageTop"><img src="/common/img/contents/covid/top.png" alt="상단이동버튼"></a>
                             <!--코로나19_캠페인-->
                                <div class="Covid-container">
                                     <article class="Covid-visual" >
                                        <div class="visual_txt">
                                            <h2 >코로나19 <span style=" white-space: nowrap;">#힘내라&nbsp;대한민국</span> 함께 이겨내요!
                                                <em class="stit">우리가 함께라면 이겨낼 수 있습니다.
사랑의열매가 여러분과 함께 코로나19 극복에 앞장서겠습니다.</em>
                                            </h2>
                                        </div>
                                    </article>

                                        
                                    <!-- 코로나탭 -->
                                    <div class="covid_tab">
                                        <ul id="menu">
                                            <li><a href="#t1">코로나19 성금, 잘&nbsp;나누겠습니다</a></li>
                                            <li><a href="#t2">코로나19 성금, 잘&nbsp;모으겠습니다</a></li>
                                            <li><a href="#t3">함께 해주신 분들</a></li>
                                            <li><a href="#t4">생생한 현장 소식</a></li>
                                            <li><a href="#t5">언론보도 살펴보기</a></li>
                                            <li><a href="#t6">해외사례</a></li>
                                        </ul>
                                   <!--  </div>-->

                                     <!-- 코로나19 성금, 잘 나누겠습니다 -->
                                    <div  id ="t1">	
						                <div class="page_head">
						                    <h2>코로나19 성금, 잘 나누겠습니다</h2>
						                </div>
                                        <!--  -->
                                        <div class="title_wrap">
                                        <h4 class="title-heading_d">총 1,133.0억 (2020.10.12. 기준)</h4>
                                        <span class="text_unit"> (단위: 원)</span>
                                        </div>
                                        <div class="tb-type_a">
                                            <div class="wide-scroll">
                                                <table style="width:100%;" summary="연도별 희망캠페인 모금실적">
                                                    <caption>연도별 희망캠페인 모금실적</caption>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">구분</th>
                                                            <th scope="col">지원완료 </th>
                                                            <th scope="col">지원진행</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row" class="sub_th">현금</th>
                                                            <td>94,919,369,049</td>
                                                            <td>5,500,060,763</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">현물</th>
                                                            <td>12,884,296,208</td>
                                                            <td>-</td>
                                                        </tr>
                                                        
                                                        <tr class="total">
                                                            <th scope="row">계</th>
                                                            <td>107,803,665,257</td>
                                                            <td>5,500,060,763</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            
                                           <!--  <p>※ 지원 예정금액 11,591,564,732원은 별도</p> -->
                                        </div>
                                    
                                    
                                        <!--  -->


                                        <div class="part ">
                                            <div class="txt_wrap">
                                                <div class="row width50">
                                                    <div class="column">
                                                        <figure>
                                                            <img src="/common/img/contents/covid/g1.jpg" alt="분야별 지원금액 그래프">
                                                        </figure>
                                                    </div>
                                                    <div class="column">
                                                        <!--  -->
                                                        <div class="tb-type_a">
                                                            <div class="wide-scroll">
                                                                <table summary="연도별 희망캠페인 모금실적" style="width:100%; margin-top:20px;">
                                                                    <caption>연도별 희망캠페인 모금실적</caption>
                                                                    <thead>
                                                                        <tr>
                                                                            <th scope="col">분야</th>
                                                                            <th scope="col">금액  </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <th scope="row" class="sub_th">방역 및 위생관리</th>
                                                                            <td>54,633,165,970 </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row" class="sub_th">취약계층 생계지원</th>
                                                                            <td>28,859,706,320 </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row" class="sub_th">복지서비스 공백지원 </th>
                                                                            <td>10,536,573,158 </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row" class="sub_th">의료진·자원봉사자·확진자등지원</th>
                                                                            <td>13,774,219,809 </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <!--  -->
                                                    </div>
                    
                                                </div>
                                            </div>
                                        </div>

                                        <div class="part">
                                            <div class="txt_wrap">
                                                <div class="row width50">
                                                    <div class="column">
                                                        <p>사랑의열매에서는 코로나19 피해지원을 위해 10월 12일 기준, 지원완료한 금액이 총 1,133억여만원으로, 마스크 24,804,394장과 손 세정・소독제 1,927,929개를 지원했습니다.</p>
                                                        <p>지원 분야별로는 위기가정 생계비 지원에 8,815,922,634원, 식료품 지원에 9,205,408,900원, 생필품 지원에 5,953,147,026원, 기타 취약계층 생계지원에 4,885,227,760원, 의료진・자원봉사자・확진자 등 지원에 13,774,219,809원, 복지서비스 공백지원에 10,536,573,158원 등을 지원 완료했습니다.</p>
                                                        <p>이번에 모금한 성금은 정부 및 관계 기관과의 조율을 통해 지역 내 확진자·격리자 비중이 높은 지역을 우선으로 단계적·체계적으로 지원했습니다. 또한 신속한 현장 지원을 위해 사랑의열매 배분 파트너인 민관 기관들과의 네트워크를 통해 노인, 장애인, 노숙인 등 취약하고 감염 위험이 높은 대상과 사각지대를 우선으로 긴급 지원 계획을 마련해 적극 대응했습니다.</p>
                                                        <!-- <div class="btn-area btn-area-l">
										                        <a class="btn-base-imp" href="/ct/lmpscntr/initIndvdl.do">코로나19 기부하기</a>
								                         </div> -->
                                                    </div>
                                                    <div class="column mgt-s">
                                                            <img src="/common/img/contents/covid/img2.png"  alt="지원물품 이미지">
                                                    </div>
                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //코로나19 성금, 잘 나누겠습니다 -->
                                    
                                    
                                    
                                    <!-- 코로나19 성금, 잘 모으겠습니다 -->
                                     <div   id ="t2">	
                                     <div class="page_head">
						                    <h2>코로나19 성금, 잘 모으겠습니다</h2>
						                </div>
                                        <!--  -->
                                        <div class="title_wrap mg-t-m">
                                             <h4 class="title-heading_d">모금현황 : 총 1084.2억 (2020.10.12. 기준)</h4>
                                             <span class="text_unit">(단위: 원)</span>
                                         </div>
                                         <div class="tb-type_d">
                                             <div class="wide-scroll">
                                                 <table summary="연도별 희망캠페인 모금실적" style="width:100%;">
                                                     <caption>연도별 희망캠페인 모금실적</caption>
                                                     <thead>
                                                         <tr>
                                                             <th scope="col">합계</th>
                                                             <th scope="col">현금 </th>
                                                             <th scope="col">현물</th>
                                                         </tr>
                                                     </thead>
                                                     <tbody>
                                                         <tr>
                                                             <td>108,415,985,087</td>
                                                             <td>95,531,688,879</td>
                                                             <td>12,884,296,208 </td>
                                                         </tr>
                                                     </tbody>
                                                 </table>
                                              </div> 
                                         </div>
                         
                                        <!--  -->
                                        <div class="title_wrap mg-t-m">
                                        <h4 class="title-heading_d">코로나19 지회별 모금현황</h4>
                                        <span class="text_unit"></span>
                                        </div>
                                        <div class="tb-type_b">
                                            <div class="wide-scroll">
                                                <table summary="코로나19 지회별 모금현황" style="width:100%;">
                                                    <caption>코로나19 지회별 모금현황</caption>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" style="width:20%">순번</th>
                                                            <th scope="col">지회명 </th>
                                                            <th scope="col">합계</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row" class="sub_th"></th>
                                                            <td class="total">합계</td>
                                                            <td>108,415,985,087</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">1</th>
                                                            <td>중앙회</td>
                                                            <td>34,596,806,013 </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th"></th>
                                                            <td>지회계</td>
                                                            <td>73,819,179,074</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">2</th>
                                                            <td>서울</td>
                                                            <td>4,238,191,320 </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">3</th>
                                                            <td>부산</td>
                                                            <td>5,815,205,854 </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">4</th>
                                                            <td>대구</td>
                                                            <td>24,543,840,865</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">5</th>
                                                            <td>인천</td>
                                                            <td>1,622,671,943 </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">6</th>
                                                            <td>광주</td>
                                                            <td>864,968,530</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">7</th>
                                                            <td>대전</td>
                                                            <td>1,486,692,982</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">8</th>
                                                            <td>울산</td>
                                                            <td>2,275,414,699</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" rowspan="2" class="sub_th">9</th>
                                                            <td>경기</td>
                                                            <td>2,487,265,238</td>
                                                        </tr>
                                                        <tr>
                                                            <td>경기북부</td>
                                                            <td>1,347,792,230</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">10</th>
                                                            <td>강원</td>
                                                            <td>3,324,976,016</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">11</th>
                                                            <td>충북</td>
                                                            <td>1,832,229,949</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">12</th>
                                                            <td>충남</td>
                                                            <td>2,697,442,306</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">13</th>
                                                            <td>전북</td>
                                                            <td>1,653,567,990</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">14</th>
                                                            <td>전남</td>
                                                            <td>1,804,773,565</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">15</th>
                                                            <td>경북</td>
                                                            <td>12,118,122,822</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">16</th>
                                                            <td>경남</td>
                                                            <td>4,811,865,821</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">17</th>
                                                            <td>제주</td>
                                                            <td>563,575,106</td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" class="sub_th">18</th>
                                                            <td>세종</td>
                                                            <td>330,581,838</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="coviddata__map">
                                            	<figure>
			                                    	<img src="https://upload.chest.or.kr/newsletter/001/202005_special/assets/images/img/sub3_img5.jpg" alt="">
			                                    </figure>
                                           </div>
                                    </div>
                                    <!--//코로나19 성금, 잘 모으겠습니다  -->
                                    
                                    
                                    <!--  -->
                                    <div   id ="t3">
						                <div class="page_head">
                                           <h2>함께 해주신 분들</h2>
						                </div>	
                                        <!--  -->
                                        <div class="title_wrap mg-t-m">
                                            <h4 class="title-heading_d">개인기부자</h4>
                                        </div>
                                        <div class="tb-type_a">
                                            <div>
                                                <table summary="연도별 희망캠페인 모금실적" style="width:100%;">
                                                    <caption>연도별 희망캠페인 모금실적</caption>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" width="20%">금액</th>
                                                            <th scope="col">명단</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th>1억원 이상</th>
                                                            <td>이준용, 김범수, 이재섭, 권오록, 익명, 육군본부, 현빈, 추신수, 해군장병일동, KAN OLEG, 충남소방본부 직원일동, 태안군청 공직자 일동, 이병헌, 신민아, 최신원, 정우성, 공유, 조해숙, 설경구, 송윤아, 
레드벨벳 웬디, 김승석, 
박효신, 프로미즈, 이정재, 김영철, 이선재, 설민석, 김우빈, 임윤아, 전현무, 심상균, 손예진, 이서진, 정해인, 박철, 김수현, 박건영, 마동석, 곽동협, 김문기, 박준영, 을지대학교 총장, 이재섭, 김문기, 최대성, 위호철</td>
                                                           
                                                        </tr>
                                                        <tr>
                                                        	<th>1천만원 이상</th>
                                                        	 <td>박보영, 이수, 김범수, 우규민, 다현(트와이스), 쯔위(트와이스), 임나연(트와이스), 엑소 수호, 최성우, 김구라, 차인표, 신애라, 박영택, 을지재단 회장, 유노윤호, 박효신 소울트리, 지코, ㈜대광건영 임직원일동, 이연복, 우종수, 박정원, 임시완, 슈퍼주니어, 이용섭, 오광호, 김종선, 최지영, 정기선, 김형순, 광주광역시의원일동, 서구청공무원일동, 황지연, 미라클의원, 이광은, 
서산시장 맹정호, 서산시청 공무원일동,
광주초등학교/중학교 교장단성금, 한국공인중개사협회 세종지부, 세종시의사회, 세종시불교사암연합회,
충남도청공무원일동, 충남도출연기관 단체장, 충남체육회, 충남보령시청 공직자 일동, 충남도청 직속기관 직원 일동, 충남도내 사업소 직원 일동</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                             </div>
                                        
                                        </div>
                                                                            <!-- 셀럽 -->
                                    <div class="covidcel__boxs">
                                        <ul class="covidcel__box">
                                            <li>
                                                <figure><img src="/common/img/contents/covid/sub2_img1.png" alt="">
                                                </figure>
                                                <div class="covidcel__box--people">
                                                    <span class="name">가수 유노윤호 </span>
                                                    <p>
                                                        코로나19로 인한 어려운 상황이 빨리 끝났으면 좋겠습니다. 모든분이 좀 더 힘내시길 바라요.
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <figure><img src="/common/img/contents/covid/sub2_img2.png" alt="">
                                                </figure>
                                                <div class="covidcel__box--people">
                                                    <span class="name">설민석 역사 강사</span>
                                                    <p>
                                                        우리는 역사적으로 어려운 일이 있을 때마다 온 국민이 하나되어 위기를 극복해냈습니다. 이번에도 두려움을 용기로
                                                        이겨내기를 간절히 기도합니다.
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <figure><img src="/common/img/contents/covid/sub2_img3.png" alt="">
                                                </figure>
                                                <div class="covidcel__box--people">
                                                    <span class="name">배우 김영철 </span>
                                                    <p>
                                                        어려울 때 다 함께 극복해 온 지역이 활짝 웃을 수 있는 날이 하루빨리 오기를 바랍니다.
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <figure><img src="/common/img/contents/covid/sub2_img4.png" alt="">
                                                </figure>
                                                <div class="covidcel__box--people">
                                                    <span class="name">가수 트와이스<br><span class="small">(쯔위, 다현,
                                                            나연)</span> </span>
                                                    <p>
                                                        코로나19로 인해 어려움을 겪고 계신 분들에게 힘이 되었으면 좋겠습니다.
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <figure><img src="/common/img/contents/covid/sub2_img5.png" alt="">
                                                </figure>
                                                <div class="covidcel__box--people">
                                                    <span class="name">배우 김사랑</span>
                                                    <p>
                                                        코로나19로 인한 어려운 상황이 빨리 끝났으면 좋겠습니다. 모든분이 좀 더 힘내시길 바라요.
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <figure><img src="/common/img/contents/covid/sub2_img6.png" alt="">
                                                </figure>
                                                <div class="covidcel__box--people">
                                                    <span class="name">방송인 박나래</span>
                                                    <p>
                                                        우리는 역사적으로 어려운 일이 있을 때마다 온 국민이 하나되어 위기를 극복해냈습니다. 이번에도 두려움을 용기로
                                                        이겨내기를 간절히 기도합니다.
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <figure><img src="/common/img/contents/covid/sub2_img7.png" alt="">
                                                </figure>
                                                <div class="covidcel__box--people">
                                                    <span class="name">이승엽 <span class="small">이승엽야구장학재단이사장</span>
                                                    </span>
                                                    <p>
                                                        어려울 때 다 함께 극복해 온 지역이 활짝 웃을 수 있는 날이 하루빨리 오기를 바랍니다.
                                                    </p>
                                                </div>
                                            </li>
                                            <li>
                                                <figure><img src="/common/img/contents/covid/sub2_img8.png" alt="">
                                                </figure>
                                                <div class="covidcel__box--people">
                                                    <span class="name">배우 현빈</span>
                                                    <p>
                                                        코로나19로 인해 어려움을 겪고 계신 분들에게 힘이 되었으면 좋겠습니다.
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!--  -->
                                        <div class="title_wrap mg-t-m">
                                            <h4 class="title-heading_d">법인기부자</h4>
                                        </div>
                                        <div class="tb-type_a">
                                            <div>
                                                <table summary="연도별 희망캠페인 모금실적">
                                                    <caption>연도별 희망캠페인 모금실적</caption>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col" width="20%">금액</th>
                                                            <th scope="col">명단</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th>10억원 이상</th>
                                                            <td>SK그룹, LG그룹, 네이버, 신한금융그룹, GS, 스마일게이트</td>
                                                        </tr>
                                                        <tr>
                                                        	<th>1억원 이상</th>
                                                        	<td>BMW 코리아 및 공식딜러사, 한국수력원자력(주), 롯데그룹, 육군본부, KCC, ㈜제이와이피엔터테인먼트, ㈜영원무역, ㈜피에이치씨, 고려아연㈜, 한국전력공사, 에스엘(주), 월드휴먼브리지, 두산그룹, 삼성생명임직원, LS그룹, 아모레퍼시픽, ㈜삼미디앤씨, (주)코렌스EM, 익명, 브레인자산운용, 한국야쿠르트, 경동나비엔, 평화오일씰, 한샘, ㈜코렌스, 한전KPS(주), 한국전력공사,  미래통합당, 한국토지주택공사, ㈜현대그린푸드, ㈜현대백화점, 한섬, 현대홈쇼핑, 에스티로더, 삼성생명임직원, 신전떡볶이, 한국건강관리협회, 성우하이텍, 대성에너지, 화성산업㈜, 서희건설, 서한, 도원개발, (주)SNI, ㈜세원정공, 한국석유공사, ㈜에스엠티, ㈜세원이엔아, 동서식품(주), 중국은행주식회사 서울지점, 한국가스공사 임직원, 소망교회, 온누리교회, 주안장로교회, BMW 코리아 파이낸스, 한국테크놀로지, 동양생명, 지원건설주식회사, ㈜쟈핑코리아, 대한민국공군, 
전국한우협회, 동서석유화학주식회사(아사히카세이), ㈜현대리바트, ㈜대저건설, ㈜인트로메딕, BNK금융그룹희망나눔재단, 태광산업, (주)대구은행 임직원, SK 이노베이션 임직원, 현대해상, SK증권, 경동제약, 에어프로덕츠코리아, 동아일렉콤, ㈜조선일보, ㈜에스더포, ㈜정샘물뷰티, ㈜세중, ㈜다나와, 한무쇼핑㈜, ㈜케이씨에프에이, ㈜아프로존, 네오팜, SBI저축은행, ㈜은민에스앤디, 익명, ㈜세정, ㈜우성종합건설, 대한제강㈜, 
동원개발, 사회복지법인동일, 와이씨텍, 쟈핑코리아, 케이알엑스국민행복재단, 파나시아, 한국주철관공업㈜, 해운대비치골프, 한국남부발전㈜, 화승그룹, 주식회사골든블루, 경동건설㈜, 수영로교회, 부산도시가스, ㈜협성건설, 애터미(주), 장보고식자재마트, 라온건설, 
대구농협, ㈜에이스컨트리클럽, 주식회사 카도야, ㈜멕시카나, 
삼익THK㈜, 검단중앙교회, ㈜금성침대, ㈜리즈케이, 두올, 한국감정원, ㈜네패스, 태성전기, ㈜테스, 달성복지재단, 한솔케미칼, 한영회계법인, 충청북도, ㈜삼정기업, 무림에스피(주), 부국증권, 에이플러스에셋, 희창물산, ㈜세경씨앤디, 진방스틸, 분당우리교회, ㈜뉴트리, ㈜세진, 풍국주정공업, ㈜에즈금융, 예스24, 천주교인천교구사제단, 보문복지재단, 골드클래스(주), ㈜동원개발, 주식회사 케이디엔씨(머큐어 엠배서더 울산호텔), 한국동서발전, ㈜경동도시가스, 세원테크, 서부발전, 아산성우하이텍, 디에스종합건설㈜, 징크옥사이드코퍼레이션, 수양해운(주), 한국도로공사, ㈜세아제강, 충북도청, 평화이엔지(주), 수협은행, ㈜영풍석포제련소, ㈜세원물산, 사회복지법인한마음국제복지재단,  한마음창원병원, 경남에너지㈜, 제주은행, 
한국마사회제주지역본부, 재단법인 삼라희망재단, 계룡건설산업주식회사, 솔젠트(주), 한국카카오은행, 우리금융그룹, 한화토탈</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                             </div>
                                        </div>
                                        <!--  -->
                                    </div>
                                    <!--//  -->

                                    
                                    <!--  -->
                                     <!--  -->
                                    <div   id ="t4">
                                    
						                <div class="page_head">
                                        <h2>생생한 현장 소식</h2>
                                        <h4>코로나19 지원 현장에서 전하는 "보내주신 성금 이렇게 쓰고 있습니다."</h4>
						                </div>
						                
                                        <div>
                                            <div class="part">
                                                <div class="txt_wrap">
                                                    <div class="video-area donation-video-area">
                                                       <div class="video-box">
                                                       <iframe src="https://www.youtube.com/embed/DnP4iqFQD0o" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen title="동영상"></iframe>
                                                       </div>
                                                    </div>
                                                    <div class="video-area donation-video-area">
                                                       <div class="video-box">
                                                       <iframe src="https://www.youtube.com/embed/VJLcadhA79w" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen title="동영상"></iframe>
                                                       </div>
                                                    </div>
                                             	</div>
                                             </div>
                                            
                                            <div class="part">
                                                <div class="txt_wrap">
                                                    <div class="row width50_1">
                                                        <div class="column">
                                                            <div class="box_wrap bg7 edge_tri orange2">
                                                                <div class="txt_wrap">
                                                                <h4 class="under"><span>의료진과 자원봉사자 지원</span><br>방호복, 식사·간식·건강식품 지원 </h4>
                                                                    <p class="txt">
                                                                        “대구에 긴급 투입되는 의료진은 마스크, 방호복도 필요하지만 당장 
                                                                        갈아입을 여벌 옷과 생필품도 부족한 실정입니다. 의료진들의 어려움을 
                                                                        해결하기 위해 대구의사협회와 연계해 의료용품과 생필품 키트를 
                                                                        긴급히 지원하게 되었습니다.” 
                                                                    </p>
                                                                    <p>- 밀알복지재단 박경욱 팀장 -</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="column">
                                                            <div class="box_wrap bg7 edge_tri orange2">
                                                                <div class="txt_wrap">
                                                                <h4 class="under"><span>방역 및 위생 관리</span><br>마스크, 손 소독제, 체온계, 열감지 
                                                                    카메라, 공간 방역 지원</h4>
                                                                    <p class="txt">
                                                                        “저희 센터는 매일 100명이 넘는 노숙인이 이용하는 곳이라 
                                                                        어려움이 많았습니다. 이번 긴급 지원을 통해 열화상 
                                                                        감지 카메라를 설치했습니다. 항상 발열 상태를 확인할 수 있어 
                                                                        한결 맘이 놓입니다. 무엇보다 이용하시는 분들의 
                                                                        만족감이 아주 높습니다.”
                                                                    </p>
                                                                    <p>- 노숙인다시서기종합지원센터 김종대 팀장 -</p>
                                                                </div>
                                                            </div>
                                                            </div>
                                                    </div>
                                                 </div>
                                             </div>
                                            
                                             <div class="part">
                                                 <div class="txt_wrap">
                                                     <div class="row width50_1">
                                                         <div class="column">
                                                             <div class="box_wrap bg7 edge_tri orange2">
                                                                 <div class="txt_wrap">
                                                                 <h4 class="under"><span>복지 서비스 공백 지원</span><br>돌봄 대체 인력, 활동 지원, 생활 
                                                                    시설 확진자 임시 거처 등 지원</h4>
                                                                     <p class="txt">
                                                                        “장애인 또는 장애인을 돌보던 가족이 자가 격리자나 확진자가 되면 
                                                                        당장 현실적 어려움에 직면하게 됩니다. 이번 긴급 지원으로 
                                                                        장애인 돌봄에 공백이 없도록 추가 인력과 위생 물품, 검사비 등을 
                                                                        지원받게 되어 한시름 덜었습니다.”
                                                                     </p>
                                                                     <p>- 한국장애인자립생활센터협의회 임소연 사무총장 -</p>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                         <div class="column">
                                                             <div class="box_wrap bg7 edge_tri orange2">
                                                                 <div class="txt_wrap">
                                                                 <h4 class="under"><span>어려운 계층 생계 지원</span><br>위기 가정 생계비 및 대상자 
								                                                                    맞춤형 식료품, 생필품 키트 지원</h4>
								                                                                     <p class="txt">
								                                                                        “복지관 등에서 운영하던 무료 급식이 중단되면서 
								                                                                        취약 계층의 결식이 우려되는 상황이었습니다. 
								                                                                        기업에서 쌀국수와 생수 등 식료품을 지원해주어 사각지대에 
								                                                                        놓인 이웃에게 전달할 수 있었습니다.”
                                                                     </p>
                                                                     <p>- 희망을 나누는 사람들 김동우 부회장 -</p>
                                                                 </div>
                                                             </div>
                                                             </div>
                                                     </div>
                                                  </div>
                                              </div>
                                        </div>
										 <!-- 현장이야기 -->
                                    <div class="scenestory__boxs">
                                        <div class="scenestory__box">
                                            <h3 class="line">쪽방 지역 주민을 위한 방역 및 위생물품 지원</h3>
                                            <p class="txt">
                                                <strong>서울역 쪽방상담소 김갑록 소장</strong><br />
                                                쪽방촌에는 화장실이나 샤워실이 부족해 개인위생을 철저히 지키기가 힘들고, 고위험군인 기저질환자도 많다보니 철저한 감염대응이
                                                필요했습니다. 사랑의열매에서 빠르게 방역용 소독약과 주민들을 위한 개인위생용품(마스크·소독제)을 지원해주셔서 신속하게 코로나에
                                                대응할 수 있었습니다. 초기에는 답답하다고 마스크를 안 쓰는 분들이 많아 걱정했었는데 꾸준히 안내드린 결과, 지금은 마스크 착용은
                                                물론 방문 간호 서비스를 통해 매일 혈압과 당뇨 수치를 확인하는 등 주민들이 건강에 각별히 신경을 쓰고 있습니다. 또한 매일
                                                쪽방촌 복도와 화장실, 거리 등을 소독하며 확진자가 발생하지 않도록 방역활동에 힘쓰고 있습니다.
                                            </p>
                                            <div class="scenestory__box--photos">
                                                <figure>
                                                    <img src="/common/img/contents/covid/sub5_img1.jpg" alt="">
                                                </figure>
                                                <figure>
                                                    <img src="/common/img/contents/covid/sub5_img2.jpg" alt="">
                                                </figure>
                                            </div>
                                        </div>
                                        <div class="scenestory__box line">
                                            <h3 class="line">거리 노숙인을 위한 방역 및 위생물품 지원</h3>
                                            <p class="txt">
                                                <strong>서울역 다시서기종합지원센터 박상병 팀장</strong><br />
                                                다행히 서울역 인근 노숙인 중에서는 확진자가 나오지 않았습니다. 모두들 애써주시고 관심 가져준 덕분입니다. 제가 근무하는 서울역
                                                광장의 상담센터를 방문하는 모든 분들은 손소독과 체온을 재고 있습니다. 상담센터 내부 공간 청소와 방역은 매일 하고 있고요.
                                                코로나19 초기에는 한 동안 마스크와 손 소독제 수급이 원활하지 않아서 걱정이 많았는데, 지금은 사랑의열매와 서울시 등 많은
                                                곳에서 도움으로 한시름 덜었습니다. 한시도 긴장을 늦출 수는 없지만 많은 분들의 관심과 도움으로 잘 이겨내고 있습니다. 이 자리를
                                                빌려 감사의 인사를 전합니다.
                                            </p>
                                            <div class="scenestory__box--photos">
                                                <figure>
                                                    <img src="/common/img/contents/covid/sub5_img3.jpg" alt="">
                                                </figure>
                                                <figure>
                                                    <img src="/common/img/contents/covid/sub5_img4.jpg" alt="">
                                                </figure>
                                            </div>
                                        </div>
                                        <div class="scenestory__box line">
                                            <h3 class="line">지역 식당이 참여한 홀몸 어르신 도시락 지원</h3>
                                            <p class="txt">
                                                <strong>대구 안심종합사회복지관 황병윤 과장</strong><br />
                                                코로나19로 경로 식당 운영이 중단되면서 식사가 어려워진 어르신들을 돕고, 더불어 위축된 마을 경제를 활성화하기 위해 도시락 지원
                                                사업을 진행하게 되었습니다. 대구 9개 지역, 총 1,060세대의 홀몸 어르신 및 장애인 가정에 매일 지역 식당에서 만든 도시락을
                                                배달하며 어르신들의 안부를 확인하고 있습니다. 일반 식당에서 도시락을 만드니 메뉴가 풍성해져 어르신들의 만족감도 높고, 게다가
                                                어르신들과 정답게 안부를 주고받는 식당 사장님들을 통해 ‘지역이 지역을 돕는다’는 의미를 다시 한번 느끼고 있습니다.
                                            </p>
                                            <div class="scenestory__box--photos">
                                                <figure>
                                                    <img src="/common/img/contents/covid/sub5_img5.jpg" alt="">
                                                </figure>
                                                <figure>
                                                    <img src="/common/img/contents/covid/sub5_img6.jpg" alt="">
                                                </figure>
                                            </div>
                                        </div>
                                        <div class="scenestory__box line">
                                            <h3 class="line">코로나19 응급 환자를 위한 의료장비 및 물품 지원</h3>
                                            <p class="txt">
                                                <strong>대구 동산병원 남성일 기획실장·이비인후과 교수</strong><br />
                                                3월 초, 대구에 급격히 늘어나는 코로나19 확진자를 치료하기 위해 병상을 확대해야 하는 상황에서 의료 장비가 시급히
                                                필요했습니다. 그 때 사랑의열매에서 인공호흡기, 심전도기, 제세동기, 산소포화도 측정기 등 코로나19 치료에 필요한 장비와 기구를
                                                신속하게 지원해주어 정말 큰 도움이 되었습니다. 증상이 급격하게 진행되는 코로나19 확진 환자들에게 의료 장비 지원이 없었다면
                                                지금처럼 빠른 회복은 어려웠을 것입니다. 따뜻한 마음으로 성금을 모아주시고 지원해주신 국민들에게 감사드리며, 앞으로도 지금처럼
                                                ‘모든 국민이 저희와 함께한다’는 마음으로 환자들을 치료하겠습니다.
                                            </p>
                                            <div class="scenestory__box--photos">
                                                <figure>
                                                    <img src="/common/img/contents/covid/sub5_img7.jpg" alt="">
                                                </figure>
                                                <figure>
                                                    <img src="/common/img/contents/covid/sub5_img8.jpg" alt="">
                                                </figure>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- //현장이야기 -->

                                        </div>
                                    
                                    <!--//  -->
                                    
                                    <div   id ="t5" style="text-align:left;">
						                <div class="page_head">
                                        <h2>언론보도 살펴보기</h2>
						                </div>	
                                        <ul class="covid-news">
                                            <li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAwL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjI1OCZwQmhmQ29kZT0wMDE=" target="_blank">[연합뉴스 외] 한국배구연맹, 사랑의열매에 '코로나19' 성금 1억4천만원 기부 (2020.05.04.)</a></li>
                                            <li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAwL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjIyMyZwQmhmQ29kZT0wMDE=" target="_blank">[국민일보 외] 육·해·공군 군인교회, 코로나19 극복 위해 5천만원 기부 (2020.04.24.)</a></li>
                                            <li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAwL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjIxMiZwQmhmQ29kZT0wMDE=" target="_blank">[내일신문 외] 사랑의열매, 코로나19 지원에 723억원 (2020.04.23.)</a></li>
                                        	<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjIyMyZwQmhmQ29kZT0wMDE=" target="_blank">[국민일보 외] 육·해·공군 군인교회, 코로나19 극복 위해 5천만원 기부(2020.04.24.)</a></li>
                                        	<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjIxMiZwQmhmQ29kZT0wMDE=" target="_blank">[내일신문 외] 사랑의열매, 코로나19 지원에 723억원(2020.04.23.) </a></li>
                                            <li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjE5MCZwQmhmQ29kZT0wMDE=" target="_blank">[매일경제 외] 사랑의열매, 대구 의료진에 방호복 6만벌 지원 (2020.04.14.)</a></li>
                                        	<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjEwMCZwQmhmQ29kZT0wMDE=" target="_blank">[세정신문 외]딜로이트 안진회계법인 "성금 5천만원 코로나 극복 위해 써달라" (2020.04.13.)</a></li>
                                        	<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjA1OSZwQmhmQ29kZT0wMDE=" target="_blank">[매경닷컴 외]뷰티 유튜버 새벽, 미혼 한부모 가정·코로나19 피해지원 위해 기부 (2020.04.06.)</a> </li>
                                        	<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMjAxOSZwQmhmQ29kZT0wMDE=" target="_blank">[스포츠조선 외]한국로슈·한국로슈진단, 코로나19 피해 극복 성금 1억원 기부 (2020.03.31.)</a></li>
                                            <li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTk3NCZwQmhmQ29kZT0wMDE=" target="_blank">[동아일보 외]사랑의열매, 전국 4200개 지역아동센터에 안전강화비 20억 원 지원 (2020.03.27.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTk0OCZwQmhmQ29kZT0wMDE=" target="_blank">[연합뉴스 외]한국마사회 제주, 코로나19 생필품 키트 후원 (2020.03.25.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTk0MyZwQmhmQ29kZT0wMDE=" target="_blank">[조선일보 외]대림 이준용 명예회장, 코로나19 지원에 20억 원 기부 (2020.03.25.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTk0MiZwQmhmQ29kZT0wMDE=" target="_blank">[뉴스1 외]사랑의열매, 코로나10 특별지원 한 달... 22일 현재 349억원 완료 (2020.03.25.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg5OCZwQmhmQ29kZT0wMDE=" target="_blank">[스포츠서울 외]다나와, 코로나19 지원 위해 1억원 기부 동참 (2020.03.19.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg5NiZwQmhmQ29kZT0wMDE=" target="_blank">[연합뉴스 외]사랑의열매, 코로나19 취약계층 지원에 653억원 투입 (2020.03.17.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg5NSZwQmhmQ29kZT0wMDE=" target="_blank">[뉴시스 외]사랑의열매 특별모금 653억 원... 마스크 540만개 지원 (2020.03.17.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg5NCZwQmhmQ29kZT0wMDE=" target="_blank">[불교뉴스 외]한국저시력인협회, 코로나19 극복 자비나눔에 동참 (2020.03.18.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg5MiZwQmhmQ29kZT0wMDE=" target="_blank">[국민일보 외]신전떡볶이의 통큰 결정, ‘코로나19 극복’위해 2억 기부 (2020.03.17.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg3MiZwQmhmQ29kZT0wMDE=" target="_blank">[파이낸셜뉴스 외]OK저축銀 배구단, 팬·임직원 뜻모아 코로나19 기부동참 (2020.03.13.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg3MSZwQmhmQ29kZT0wMDE=" target="_blank">[서울신문 외]새문안교회 등 5개 대형교회 “대구·경북 소상공인·영세사업자 지원 써달라” 5억5천만원 기부 (2020.03.13.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg2OSZwQmhmQ29kZT0wMDE=" target="_blank">[매일경제 외]사랑의열매, 코로나 특별지원금 525억 원 투입 (2020.03.11.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg2OCZwQmhmQ29kZT0wMDE=" target="_blank">[중앙일보 외]테크로스, 관계사와 뜻 모아 코로나19 지원에 1억 원 기부 (2020.03.12.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg1OCZwQmhmQ29kZT0wMDE=" target="_blank">[조선일보 외]설민석, '코로나19' 극복 위해 1억 기부 "두려움을 용기로 이겨내길" (2020.03.10)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg0MiZwQmhmQ29kZT0wMDE=" target="_blank">[뉴시스 외]대구로 온정 쏟아진다, 공동모금회 성금 119억·지원 73억원 (2020.03.07.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTg0MSZwQmhmQ29kZT0wMDE=" target="_blank">[연합뉴스 외]코로나19 성금, 피해지역 사회적 약자 돌본다 (2020.03.04.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTgzNSZwQmhmQ29kZT0wMDE=" target="_blank">[조선일보 외]트와이스 다현,나연,쯔위, 가수 박효신, 가수 김범수, 배우 김영철, 배우 이정재, 엑소 수호, 배우 이민호, 이연복 셰프 코로나19 관련 기부 (2020.03.02.)</a></li>
											<li><a href="https://www.chest.or.kr/bridgelink.do?pBranchCd=001&bhfCode=001&_mid=03_01_00&_murl=L2Jicy8xMDAzL2luaXRQb3N0RGV0YWlsLmRvP2xpc3RTbj0xMTgzNCZwQmhmQ29kZT0wMDE=" target="_blank">[조선일보 외]유노윤호,레드벨벳 슬기‧예리‧조이,레드벨벳 웬디,설경구 송윤아 부부 코로나19 관련 기부 (2020.02.28.)</a></li>
                                        </ul>
                                     </div>
                                </div>
                                
                                
                                    
                                    <div   id ="t6" style="text-align:left;">
						                <div class="page_head">
                                        <h2>해외사례</h2>
                                        <p class="camp-info-txt1" style="text-align:left; padding-top:20px;">
                                        United Way Worldwide 는 2020 년 3 월 17 일, 코로나 대응 긴급캠페인을 론칭한 이래 현재 미국 3900 억원, 비미국 네트워크 1900 억원으로 총 5800 억원 모금하고 있습니다. 미국 트럼프 정부는 코로나 19 관련 긴급법안을 통과시키면서 지역사회가 붕괴되지 않도록 하는데 있어서의 United Way 네트워크의 중요성을 인지하여 United Way Worldwide 가 지역 재건사업에만 몰입할 수 있도록 인건비 및 행정비를 6 월 30 일까지 부담하기로 하였습니다. 테크놀로지 모금 플랫폼이 대두되던 흐름 속에서 사회적 거리 두기 캠페인으로 인해 비대면 테크놀로지의 유용성이 더욱 강조되고 있지만, 시민들과 호흡하고 직접 서비스 전달체계를 제시하는 지역사회 인프라도 더욱 중요해진 역설적인 상황입니다.
                                        </p>
                                        <!-- 자세히 보기 -->
					                    <div class="btn-area-r mg-t-m">
                                                <button type="button" class="btn-base-line" onclick="gf_genFileExport(this);">자세히보기</button>
                                                <input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/' escapeXml='false' />" />
                                                <input id="phycFileNm" name="phycFileNm" type="hidden" value="UWW COVID-19 Story Bank - April 27 upload.pdf" />
                                                <input id="logcFileNm" name="logcFileNm" type="hidden" value="UWW COVID-19 Story Bank - April 27 upload.pdf" />
					                    </div>
										<!-- 자세히 보기 -->
						                </div>	
                                     </div>
                                </div>
                             <!--//코로나19_캠페인-->
                             
                            <div class="btn-area">
                            <c:choose> 
                                <c:when test="${__branchCd ne '009'}"> 
                                     <button type="button" class="btn-base-imp" id="btnMore">코로나19 기부하기</button> 
                                 </c:when> 
                            </c:choose> 
                            
                            <a href="https://upload.chest.or.kr/newsletter/001/202005_special/index.html" target="_blank" class="btn-base-imp">코로나19 소식지</a></div>
                        </div>
                     </div>
                </div>
        </main>
 </div>



