<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 사랑의 열매 > 신뢰와투명성 > 경영공시 
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
/*=========================================================== 
 * Page Loading !! 
 *===========================================================*/ 
 $(document).ready(function() { 
	init(); 
	clickEvent(); 
}); 
 
function init() { 
	$('.ui-acco-pnl1').css('display', 'none');	 
} 

function clickEvent() { 
	$(".ui-acco-btn").click( function() { 
		var index = $(".ui-acco-btn").index(this); 
		var hasCls = $(".ui-acco-btn:eq("+index+")"); 
		if( hasCls.hasClass("selected") ) { 
			$(this).parent().next('dd.ui-acco-pnl1').hide(); 
			$(".ui-acco-btn:eq("+index+")").removeClass("selected"); 
		} else { 
			$(this).parent().next('dd.ui-acco-pnl1').show(); 
			$(".ui-acco-btn:eq("+index+")").addClass("selected"); 
		} 
	}); 
} 
	/*************************************************************
	 * Ajax Send Callback Function !!
	 *************************************************************/
</script>

<div class="sub-visual visual04_03">
	<div class="sub-title-area">
		<h2 class="heading-title-a">신뢰와 투명성</h2>
		<p class="title-sub-txt">사랑의열매는 소중한 성금을 투명하고 공정하게 집행하고 있습니다</p>
	</div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
<div class="contents-area">
	<div class="contents-hd">
		<h3>
			<strong>경영공시</strong><span>사랑의열매 운영 전반에 대한 내용을 공개하고 있습니다</span>
		</h3>
		<div class="contents-menu-nav"></div>
	</div>


	<!-- 컨텐츠 시작 -->
	<div class="seo-box">
		<div class="area-type-c">
			<p class="title-heading_b">
				경영공시 소개<span class="sub-txt">(아래 타이틀 클릭시 각 안내
					세부내용을 보실 수 있습니다.) </span>
			</p>
			<div class="ui-acco type-business" role="group" id="uiAccoGUID03_1">

				<!--일반현황-->
				<dl class="ui-acco-wrap type-a">
					<dt class="ui-acco-tit">
						<button type="button" class="ui-acco-btn">
							<p class="business-wrap">
								<span class="business-item1 n1">1</span> 
								<span class="business-title">일반현황</span> 
								<span class="ui-acco-arrow"></span>
							</p>
						</button>
					</dt>
					<dd class="ui-acco-pnl1 pd-xs">
						<div class="title_wrap mg-t-s">
							<h4 class="title-heading_b">1. 일반현황</h4>
						</div>
						<div class="text-desc pd-xxxs">
							<p class="data-info-txt">기관소재지 : 서울 중구 세종대로21길 39 (정동 1-17) 사랑의열매 회관</p>
							<p class="data-info-txt">설립근거 : 사회복지공동모금회법</p>
						</div>
						<div class="title_wrap mg-t-s">
							<h4 class="title-heading_b">연혁</h4>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>연혁</caption>
									<colgroup>
										<col style="width: 200px">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">1998. 7.</th>
											<td class="align-l">
												<ul class="donation-desc mg-t-s">
													<li>사회복지공동모금법 제정‧시행</li>
													<li>16개 지방공동모금회 출범</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">1998. 11.</th>
											<td class="align-l">
												<ul class="donation-desc mg-t-s">
													<li>중앙공동모금회 설립</li>
													<li>초대 회장 강영훈 취임</li>
													<li>초대 사무총장 윤수경 취임</li>
													<li>이희호 여사 초대 명예회장 추대</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">1998. 12.</th>
											<td class="align-l">첫 연말집중모금 전개(1998. 12.～1999. 1.)</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">1999. 2.</th>
											<td class="align-l">배분사업 최초 실시</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">1999. 2.</th>
											<td class="align-l">배분사업 최초 실시</td>
										</tr>
										</tr>
										<tr>
											<th scope="row" class="sub_th">1999. 4.</th>
											<td class="align-l">
												<ul class="donation-desc mg-t-s">
													<li>사회복지공동모금법을 사회복지공동모금회법으로 개정</li>
													<li>기관명 변경 및 16개 시·도 모금회의 지회 전환</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2000. 2.</th>
											<td class="align-l">제2대 회장 김성수 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2002. 4.</th>
											<td class="align-l">제3대 회장 한승헌 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2003. 4.</th>
											<td class="align-l">권양숙 여사 제2대 명예회장 추대</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2004. 4.</th>
											<td class="align-l">제4대 회장 김용준 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2005. 4.</th>
											<td class="align-l">제5대 회장 이세중 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2006. 6.</th>
											<td class="align-l">제2대 사무총장 신필균 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2009. 3.</th>
											<td class="align-l">
												<ul class="donation-desc mg-t-s">
													<li>제6대 회장 윤병철 취임</li>
													<li>제3대 사무총장 박을종 취임</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2010. 12.</th>
											<td class="align-l">제7대 회장 이동건 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2011. 1.</th>
											<td class="align-l">제4대 사무총장 박성중 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2011. 12.</th>
											<td class="align-l">김윤옥 여사 제3대 명예회장 추대</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2012. 2.</th>
											<td class="align-l">제5대 사무총장 김주현 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2014. 1.</th>
											<td class="align-l">제8대 회장 허동수 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2016. 4.</th>
											<td class="align-l">제6대 사무총장 박찬봉 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2018. 2.</th>
											<td class="align-l">제7대 사무총장 김연순 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2018. 6.</th>
											<td class="align-l">제9대 회장 예종석 취임</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2018. 7.</th>
											<td class="align-l">김정숙 여사 제4대 명예회장 추대</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="title_wrap mgt-m">
							<h4 class="title-heading_b">목적 및 가치체계</h4>
						</div>

						<div class="data-info-a pd-xxxs">
							<p class="data-info-txt b">- 목적</p>
							<p class="data-info-txt">사회복지공동모금회는 공동모금을 통하여 사회복지에 대한 국민의
								이해와 참여를 제고함과 아울러 국민의 자발적인 성금으로 조성된 재원을 효율적이고 공정하게 관리ㆍ운용함으로써
								사회복지증진에 이바지함을 목적으로 함.(법 제1조)</p>
							<p class="data-info-txt b pdt-xs">- 가치체계</p>
							<p class="data-info-txt pdb-xs">
								○ 미션 : 나눔으로 하나되는 행복한 세상<br /> ○ 비전 : 함께 따뜻한 세상을 만드는 사랑의열매<br />
								○ 운영원리 : 참여와 권한의 분산(민주성), 자율성과 사회적 책무성, 투명성과 공개성, 신뢰와 협력<br /> ○
								핵심가치 : 인간존중, 윤리성, 열정, 헌신, 도전정신<br /> ○ 인재상<br />
								&nbsp;&nbsp;&nbsp;&nbsp;- 열정과 도전으로 나눔 문화를 이끄는 인재<br />
								&nbsp;&nbsp;&nbsp;&nbsp;- 배려와 소통으로 따뜻한 세상을 만드는 인재<br />
								&nbsp;&nbsp;&nbsp;&nbsp;- 청렴과 헌신으로 조직의 신뢰를 높이는 인재<br />
							</p>
						</div>
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 허 담(전략기획본부)</span><span
									class="ico-tel">02-6262-3058</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>
					</dd>
				</dl>
				<!--//일반현황-->



				<!--2.기관운영-->
				<dl class="ui-acco-wrap type-a">
					<dt class="ui-acco-tit">
						<button type="button" class="ui-acco-btn">
							<p class="business-wrap">
								<span class="business-item1 n2">2</span> <span
									class="business-title">기관운영</span> <span class="ui-acco-arrow"></span>
							</p>
						</button>
					</dt>
					<dd class="ui-acco-pnl1 pd-xs">
						<div class="title_wrap mg-t-s">
							<h4 class="title-heading_b">2. 내부규정</h4>
						</div>
						<div class="tb-type_d data-info-a pd-xxs">
							<div class="wide-scroll">
								<table>
									<caption>임직원 수 정보</caption>
									<colgroup>
										<col style="width: 200px;">
										<col>
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="rowgroup" class="sub_th" colspan="2">1) 사회복지공동모금회법</th>
											<th>
												<a href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/2/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="1.사회복지공동모금회법.hwp" />
         										<input id="logcFileNm" name="logcFileNm" type="hidden" value="1.사회복지공동모금회법.hwp" />
											</th>
										</tr>
										<tr>
											<th scope="rowgroup" class="sub_th" colspan="2">2) 정관</th>
											<th>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/2/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2.정관.hwp" />
         										<input id="logcFileNm" name="logcFileNm" type="hidden" value="2.정관.hwp" />
											</th>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="5">규 정</th>
											<th scope="rowgroup" class="sub_th">3) 기본운영편</th>
											<th>
												<a href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/2/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="3.기본운영편.hwp" />
         										<input id="logcFileNm" name="logcFileNm" type="hidden" value="3.기본운영편.hwp" />
											</th>
										</tr>
										<tr>
											<th scope="rowgroup" class="sub_th">4) 사업편</th>
											<th>
												<a href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/2/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="4.사업편.hwp" />
         										<input id="logcFileNm" name="logcFileNm" type="hidden" value="4.사업편.hwp" />
											</th>
										</tr>
										<tr>
											<th scope="rowgroup" class="sub_th">5) 인사, 보수편</th>
											<th>
												<a href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/2/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="5.인사,보수편.hwp" />
         										<input id="logcFileNm" name="logcFileNm" type="hidden" value="5.인사,보수편.hwp" />
											</th>
										</tr>
										<tr>
											<th scope="rowgroup" class="sub_th">6) 재무, 회계편</th>
											<th>
												<a href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/2/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="6.재무,회계편.hwp" />
         										<input id="logcFileNm" name="logcFileNm" type="hidden" value="6.재무,회계편.hwp" />
											</th>
										</tr>
										<tr>
											<th scope="rowgroup" class="sub_th">7) 일반업무편</th>
											<th>
												<a href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/2/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="7.일반업무편.hwp" />
         										<input id="logcFileNm" name="logcFileNm" type="hidden" value="7.일반업무편.hwp" />
											</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 황은진(전략기획본부)</span><span
									class="ico-tel">02-6262-3064</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>

						<!--  -->

						<h4 class="title-heading_b mg-t-s">3. 임직원 수</h4>

                        <div class="title_wrap mg-t-s">
							<h4 class="title-heading_d mg-t-s">임직원 수 </h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위 : 인)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>임직원 수 정보</caption>
									<colgroup>
										<col style="width: 100px">
										<col style="width: 130px">
										<col style="width: 100px">
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="3">구분</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
											<th scope="col">2020년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="rowgroup" rowspan="8">임원</th>
											<th scope="rowgroup" rowspan="2" class="sub_th">기관장</th>
											<th scope="row">상임</th>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">비상임</th>
											<td>1</td>
											<td>1</td>
											<td>1</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="2" class="sub_th">이사</th>
											<th scope="row">상임</th>
											<td>1</td>
											<td>1</td>
											<td>1</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<th scope="row">비상임</th>
											<td>18</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td>16</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="2" class="sub_th">감사</th>
											<th scope="row">상임</th>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">비상임</th>
											<td>2</td>
											<td>2</td>
											<td>2</td>
											<td>2</td>
											<td>2</td>
										</tr>
										<tr>
											<th scope="row" colspan="2" class="sub_th">기타</th>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr class="sub-total">
											<th scope="row" colspan="2">상임임원계(A)</th>
											<td>1</td>
											<td>1</td>
											<td>1</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="5">직원</th>
											<th scope="rowgroup" rowspan="2" class="sub_th">일반직</th>
											<th scope="row">정원</th>
											<td>299</td>
											<td>310</td>
											<td>310</td>
											<td>310</td>
											<td>310</td>
										</tr>
										<tr>
											<th scope="row">현원</th>
											<td>299</td>
											<td>309</td>
											<td>309</td>
											<td>299</td>
											<td>298</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="2" class="sub_th">연구직</th>
											<th scope="row">정원</th>
											<td>5</td>
											<td>5</td>
											<td>5</td>
											<td>5</td>
											<td>5</td>
										</tr>
										<tr>
											<th scope="row">현원</th>
											<td>5</td>
											<td>5</td>
											<td>5</td>
											<td>5</td>
											<td>5</td>
										</tr>
										<tr class="sub-total">
											<th scope="row" colspan="2">현원계(B)</th>
											<td>304</td>
											<td>314</td>
											<td>314</td>
											<td>304</td>
											<td>303</td>
										</tr>
										<tr>
											<th scope="row" colspan="3" class="sub_th">소속외 인력</th>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr class="total">
											<th scope="row" colspan="3">임직원 총계 (A+B)</th>
											<td>305</td>
											<td>315</td>
											<td>315</td>
											<td>305</td>
											<td>304</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

                        <div class="title_wrap mg-t-m">
							<h4 class="title-heading_d mg-t-s">직급별 인원수</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위 : 인)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>직급별 인원수 정보</caption>
									<colgroup>
										<col style="width: 100px">
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="colgroup" colspan="5" class="line-l">일반직원</th>
											<th scope="colgroup" colspan="2">연구직</th>
											<th scope="col" rowspan="2" class="line-l">소계</th>
										</tr>
										<tr class="lines">
											<th scope="col">1급</th>
											<th scope="col">2급</th>
											<th scope="col">3급</th>
											<th scope="col">4급</th>
											<th scope="col">5급</th>
											<th scope="col">책임 연구원</th>
											<th scope="col">연구원</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">중앙회</th>
											<td>3</td>
											<td>7</td>
											<td>19</td>
											<td>30</td>
											<td>20</td>
											<td>3</td>
											<td>2</td>
											<td>84</td>
										</tr>
										<tr>
											<th scope="row">지회</th>
											<td>5</td>
											<td>19</td>
											<td>50</td>
											<td>101</td>
											<td>44</td>
											<td>-</td>
											<td>-</td>
											<td>219</td>
										</tr>
										<tr class="total">
											<th scope="row">계</th>
											<td>8</td>
											<td>26</td>
											<td>69</td>
											<td>131</td>
											<td>64</td>
											<td>3</td>
											<td>2</td>
											<td>303</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>



						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_d mg-t-s">성별 직급 인원</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위 : 인)</span>
						</div>
						<div class="tb-type_d  data-info-a pd-xxs">
							<div class="wide-scroll">
								<table>
									<caption>직급별 인원수 정보</caption>
									<colgroup>
										<col style="width: 100px">
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="colgroup" colspan="5" class="line-l">일반직원</th>
											<th scope="colgroup" colspan="2">연구직</th>
											<th scope="col" rowspan="2" class="line-l">소계</th>
										</tr>
										<tr class="lines">
											<th scope="col">1급</th>
											<th scope="col">2급</th>
											<th scope="col">3급</th>
											<th scope="col">4급</th>
											<th scope="col">5급</th>
											<th scope="col">책임 연구원</th>
											<th scope="col">연구원</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">여성</th>
											<td>2(25%)</td>
											<td>9(34.6%)</td>
											<td>41(59.4%)</td>
											<td>73(55.7%)</td>
											<td>42(65.6%)</td>
											<td>3(100%)</td>
											<td>1(50%)</td>
											<td>171(56.4%)</td>
										</tr>
										<tr>
											<th scope="row">남성</th>
											<td>6(75.0%)</td>
											<td>17(65.4%)</td>
											<td>28(40.6%)</td>
											<td>58(44.3%)</td>
											<td>22(34.4%)</td>
											<td>-</td>
											<td>1(50%)</td>
											<td>132(43.6%)</td>
										</tr>
										<tr class="total">
											<th scope="row">계</th>
											<td>8</td>
											<td>26</td>
											<td>69</td>
											<td>131</td>
											<td>64</td>
											<td>3</td>
											<td>2</td>
											<td>303</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>


						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김미경(경영지원본부)</span><span
									class="ico-tel mgl-s">02-6262-3016</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>

                       <div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">4. 임원현황 [총 20명 중 남: 15명(75%) / 여: 5명(25%)]</h4>
							<span class="text_unit">(2020. 3. 31. 기준)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>임원현황 정보</caption>
									<colgroup>
										<col style="width: 100px">
										<col style="width: 100px">
										<col>
										<col>
										<col style="width: 100px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">직위</th>
											<th scope="col">성명</th>
											<th scope="col">소속/직위</th>
											<th scope="col">임기</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody class="align-c">
										<tr>
											<th scope="row" class="sub_th">회장</th>
											<td>예종석</td>
											<td>사회복지공동모금회 회장</td>
											<td>2018.05.25~2021.05.24</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">부회장</th>
											<td>최신원</td>
											<td>SK네트웍스(주) 대표이사 회장</td>
											<td>2017.11.14~2020.11.13</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">부회장</th>
											<td>이연배</td>
											<td>서울YWCA 명예이사</td>
											<td>2019.12.17~2022.12.16</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">부회장</th>
											<td>문형구</td>
											<td>고려대학교 경영대학 명예교수</td>
											<td>2019.12.17~2022.12.16</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>권태선</td>
											<td>前 KBS 이사(환경운동연합 공동대표)</td>
											<td>2018.06.22~2021.06.21</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>김연순</td>
											<td>사회복지공동모금회 사무총장</td>
											<td>2018.02.05~2021.02.04</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>김희중</td>
											<td>한국천주교주교회의 의장</td>
											<td>2018.06.22~2021.06.21</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>김지형</td>
											<td>법무법인(유) 지평 대표변호사</td>
											<td>2019.11.16~2022.11.15</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>남중수</td>
											<td>서울대학교 산업대학원 객원교수</td>
											<td>2019.12.17~2022.12.16</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>방하남</td>
											<td>국민대학교 행정대학원 석좌교수</td>
											<td>2019.12.17~2022.12.16</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>박용준</td>
											<td>글로벌케어 회장</td>
											<td>2019.11.16~2022.11.15</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>신헌철</td>
											<td>신한회계법인 상임고문</td>
											<td>2018.03.25~2021.03.24</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>양옥경</td>
											<td>이화여자대학교 사회복지학과 교수 </td>
											<td>2019.12.17~2022.12.16</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>우태희</td>
											<td>대한상공회의소 상근부회장</td>
											<td>2020.03.19~2023.03.18</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>유영학</td>
											<td> 법무법인 율촌 고문</td>
											<td>2018.06.22~2021.06.21</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>이태수</td>
											<td>꽃동네대학교 사회복지학부 교수 </td>
											<td>2018.06.22~2021.06.21</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>윤정숙</td>
											<td>시민사회연대회의 공동대표</td>
											<td>2019.11.16~2022.11.15</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>황창순</td>
											<td>순천향대학교 교학부총장</td>
											<td>2019.11.29~2022.11.28</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>박영관</td>
											<td>법무법인 동인 변호사 </td>
											<td>2017.11.29~2020.11.28</td>
											<td></td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이사</th>
											<td>윤영선</td>
											<td>법무법인 광장 상임고문 </td>
											<td>2019.12.17~2022.12.16</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<p class="text-infos-l  data-info-a pd-xxs">※선임절차 및 규정:
							사회복지공동모금회법 제7조 및 제9조, 정관 제6조</p>


						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 조진호(경영지원본부)</span><span class="ico-tel">02-6262-3010</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>
                        
						<h4 class="title-heading_b mg-t-s">5. 신규채용현황 및 유연근무현황</h4>

						<div class="title_wrap mg-t-s">
							<h4 class="title-heading_d mg-t-s">신규채용현황</h4>
							<span class="text_unit">(2020. 03. 31. 기준, 단위 : 인)</span>
						</div>
						
						
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>직급별 인원수 정보</caption>
									<colgroup>
										<col style="width: 100px">
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2">구분</th>
											<th scope="colgroup" colspan="2">2015년</th>
											<th scope="colgroup" colspan="2">2016년</th>
											<th scope="colgroup" colspan="2">2017년</th>
											<th scope="colgroup" colspan="2">2018년</th>
											<th scope="colgroup" colspan="2">2019년</th>
										</tr>
										<tr class="lines">
											<th scope="col">인원수</th>
											<th scope="col">비율</th>
											<th scope="col">인원수</th>
											<th scope="col">비율</th>
											<th scope="col">인원수</th>
											<th scope="col">비율</th>
											<th scope="col">인원수</th>
											<th scope="col">비율</th>
											<th scope="col">인원수</th>
											<th scope="col">비율</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">총 신규채용</th>
											<td>35</td>
											<td>100%</td>
											<td>24</td>
											<td>100%</td>
											<td>19</td>
											<td>100%</td>
											<td>21</td>
											<td>100%</td>
											<td>7</td>
											<td>100%</td>
										</tr>
										<tr>
											<th scope="row">여성</th>
											<td>25</td>
											<td>71%</td>
											<td>19</td>
											<td>80%</td>
											<td>11</td>
											<td>58%</td>
											<td>12</td>
											<td>55%</td>
											<td>4</td>
											<td>57%</td>
										</tr>
										<tr>
											<th scope="row">비수도권 지역인재</th>
											<td>12</td>
											<td>34%</td>
											<td>10</td>
											<td>42%</td>
											<td>9</td>
											<td>47%</td>
											<td>10</td>
											<td>48%</td>
											<td>1</td>
											<td>14%</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<!-- 
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>신규채용현황 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">총 신규채용</th>
											<td>35(100%)</td>
											<td>24(100%)</td>
											<td>19(100%)</td>
											<td>21(100%)</td>
											<td>7(100%)</td>
										</tr>
										<tr>
											<th scope="row">여성</th>
											<td>25(71%)</td>
											<td>19(80%)</td>
											<td>11(58%)</td>
											<td>12(55%)</td>
											<td>4(57%)</td>
										</tr>
										<tr>
											<th scope="row">비수도권 지역인재</th>
											<td>12(34%)</td>
											<td>10(42%)</td>
											<td>9(47%)</td>
											<td>10(48%)</td>
											<td>1(14%)</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
                         -->
                        

						<p class="text-infos-l ">※비수도권 지역인재 : 채용 시 졸업대학의 소재지 기준</p>
                        <p class="text-infos-l ">2020년 신규채용 예정인원 : 15명 (2020.6.1. 임용예정)</p>
                        
						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_d mg-t-s">유연근무현황</h4>
							<span class="text_unit">(2020. 03. 31. 기준, 단위 : 인)</span>
						</div>
						<div class="tb-type_d data-info-a pd-xxs">
							<div class="wide-scroll">
								<table>
									<caption>유연근무현황 정보</caption>
									<thead>
										<tr>
											<th scope="col" colspan="2">구분</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
											<th scope="col">2020년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="rowgroup" rowspan="4" class="no-line-b">탄력근무제</th>
											<th scope="row" class="sub_th">08:00~17:00</th>
											<td>14</td>
											<td>14</td>
											<td>18</td>
											<td>9</td>
											<td>15</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">08:30~17:30</th>
											<td>-</td>
											<td>-</td>
											<td>10</td>
											<td>9</td>
											<td>8</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">09:30~18:30</th>
											<td>-</td>
											<td>-</td>
											<td>7</td>
											<td>16</td>
											<td>19</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">10:00~19:00</th>
											<td>4</td>
											<td>6</td>
											<td>14</td>
											<td>3</td>
											<td>4</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김미경(경영지원본부)</span><span class="ico-tel">02-6262-3016</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span class="ico-tel">02-6262-3140</span>
							</p>
						</div>

						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">6. 임원연봉</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위 : 인, 원)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>임원연봉 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
											<th scope="col">2020년(예산)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">비상근이사</th>
											<td>42,800,000</td>
											<td>43,600,000</td>
											<td>39,800,000</td>
											<td>47,200,000</td>
											<td>42,200,000</td>
											<td>50,600,000</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">상근이사(사무총장)</th>
											<td>102,588,000</td>
											<td>105,667,000</td>
											<td>109,791,000</td>
											<td>112,536,000</td>
											<td>115,920,000</td>
											<td>119,980,000</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">비상근감사</th>
											<td>1,600,000</td>
											<td>1,600,000</td>
											<td>1,400,000</td>
											<td>2,200,000</td>
											<td>1,400,000</td>
											<td>2,000,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p class="text-infos-l">※ 상근이사(사무총장) : 연봉액 기준</p>
						<p class="text-infos-l">※ 비상근이사 : 회의참석수당 등 (총 17명, 2020.3.31.기준)</p>
						<p class="text-infos-l">※ 비상근감사 : 회의참석수당 (총 2명, 2020.3.31. 기준)</p>
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김미경(경영지원본부)</span><span
									class="ico-tel">02-6262-3016</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<h4 class="title-heading_b mg-t-s">7. 직원평균연봉</h4>
						
						<div class="title_wrap mg-t-s">
							<h4 class="title-heading_d mg-t-s">직원평균보수 및 평균근속연수</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위 : 인, 원)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>직원평균보수 및 평균근속연수</caption>
									<thead>
										<tr>
											<th scope="col" colspan="2">구분</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" colspan="2" class="sub_th">연평균 인원</th>
											<td>298</td>
											<td>305</td>
											<td>313</td>
											<td>310</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th" rowspan="3">1인당 평균보수액</th>
											<th scope="row" class="sub_th">전체</th>
											<td>39,710,400</td>
											<td>41,891,316</td>
											<td>42,634,872</td>
											<td>45,597,650</td>
										</tr>
										
										<tr>
											<th scope="row" class="sub_th">여성</th>
											<td>36,533,242</td>
											<td>38,256,818</td>
											<td>38,688,243</td>
											<td>41,991,373</td>
										</tr>
										
										<tr>
											<th scope="row" class="sub_th">남성</th>
											<td>43,627,308</td>
											<td>41,891,316</td>
											<td>47,761,869</td>
											<td>50,248,085</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th" rowspan="3">평균 근속연수</th>
											<th scope="row" class="sub_th">전체</th>
											<td>7.0</td>
											<td>7.6</td>
											<td>9.5</td>
											<td>10.2</td>
										</tr>
										
										<tr>
											<th scope="row" class="sub_th">여성</th>
											<td>6.3</td>
											<td>7.0</td>
											<td>8.9</td>
											<td>9.8</td>
										</tr>
										
										<tr>
											<th scope="row" class="sub_th">남성</th>
											<td>7.9</td>
											<td>8.5</td>
											<td>10.2</td>
											<td>10.7</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p class="text-infos-l">※ 연봉액 기준(연도말 결산)</p>
						<p class="text-infos-l">※ 연평균 인원 : 정규직(재직자+퇴사자)의 1년간 근무개월 수 / 12</p>
						<p class="text-infos-l">※ 1인당 평균보수액 : 기본연봉+성과연봉 / 연평균인원</p>

						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_d mg-t-s">신입직원 평균연봉</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위 : 인, 원)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>신입직원 평균연봉 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
											<th scope="col">2020년(예산)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">연평균 인원</th>
											<td>35</td>
											<td>24</td>
											<td>19</td>
											<td>21</td>
											<td>4</td>
											<td>15(예정)</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">신입직원 평균연봉</th>
											<td>27,699,000</td>
											<td>29,140,000</td>
											<td>30,684,000</td>
											<td>32,004,000</td>
											<td>33,264,000</td>
											<td>34,596,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p class="text-infos">※ 연봉액 기준 (연도말 결산)</p>
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김미경(경영지원본부)</span><span class="ico-tel">02-6262-3016</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span class="ico-tel">02-6262-3140</span>
							</p>
						</div>


						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">8. 기관장 업무추진비</h4>
							<h5 class="title-heading_d mg-t-s">업무추진비 집행 내역</h5>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>임원현황 정보</caption>
									<colgroup>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">제목</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody class="align-c">
										<tr>
											<th scope="row" class="sub_th">2020년 2월 기관장 업무추진비</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/8/2020/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2020년 2월 업무추진비 공시 내역.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="202s0년 2월 업무추진비 공시 내역.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2020년 1월 기관장 업무추진비</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/8/2020/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2020년 1월 업무추진비 공시 내역.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2020년 1월 업무추진비 공시 내역.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2019년 기관장 업무추진비 모음</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/8/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2019년 기관장 업무추진비 모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2019년 기관장 업무추진비 모음.zip" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2018년 기관장 업무추진비 모음</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/8/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2018년기관장업무추진비모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2018년기관장업무추진비모음.zip" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2017년 기관장 업무추진비 모음</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/8/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2017년기관장업무추진비모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2017년기관장업무추진비모음.zip" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2016년 기관장 업무추진비 모음</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/8/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2016년기관장업무추진비모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2016년기관장업무추진비모음.zip" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 허담(전략기획본부)</span><span class="ico-tel">02-6262-3058</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span class="ico-tel">02-6262-3140</span>
							</p>
						</div>



						<h4 class="title-heading_b mg-t-s">9. 복리후생비 연도별 지급내역</h4>
						<div class="title_wrap mg-t-s">
						    <h4 class="title-heading_d mg-t-s">연도별 지급내역</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위:원)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>복리후생비 연도별 지급내역 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
											<th scope="col">2020년(예산)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">중식비</th>
											<td>464,621,153</td>
											<td>469,536,219</td>
											<td>481,823,322</td>
											<td>478,756,320</td>
											<td>553,670,840</td>
											<td>559,950,000</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">직원학자금</th>
											<td>56,861,450</td>
											<td>54,456,250</td>
											<td>52,269,580</td>
											<td>64,883,500</td>
											<td>38,734,375</td>
											<td>128,900,000</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">자녀학자금</th>
											<td>7,595,590</td>
											<td>13,421,030</td>
											<td>21,541,700</td>
											<td>23,004,440</td>
											<td>16,688,820</td>
											<td>27,964,900</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">직원경조금</th>
											<td>23,533,500</td>
											<td>18,612,300</td>
											<td>19,469,200</td>
											<td>19,437,800</td>
											<td>24,340,860</td>
											<td>27,850,200</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">건강검진비</th>
											<td>36,008,530</td>
											<td>52,800,000</td>
											<td>42,100,000</td>
											<td>62,581,900</td>
											<td>44,300,000</td>
											<td>74,150,00</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">맞춤형복지제도</th>
											<td>106,389,436</td>
											<td>108,095,886</td>
											<td>106,118,198</td>
											<td>117,969,527</td>
											<td>115,338,974</td>
											<td>140,000,000</td>
										</tr>
										<tr class="total">
											<th scope="row">계</th>
											<td>695,009,659</td>
											<td>716,921,685</td>
											<td>723,322,000</td>
											<td>766,633,487</td>
											<td>793,073,869</td>
											<td>958,815,101</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="title_wrap mg-t-m">
						    <h4 class="title-heading_d mg-t-s">연도별 지급기준</h4>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>복리후생비 지급기준 정보</caption>
									<colgroup>
										<col style="width: 130px">
										<col>
										<col style="width: 200px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">관련규정상 주요내용</th>
											<th scope="col">관련규정명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">중식비</th>
											<td class="align-l">1인당 월 150,000원 지급</td>
											<td class="align-c">인사관리규정 제72조</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">직원학자금</th>
											<td class="align-l">직원이 업무와 관련하여 대학교 및 대학원에 진학한 경우 지원
												<ul class="donation-desc mg-t-s">
													<li>지원대상 : 재직기간 2년 이상인 직원 (재직인원의 15% 이내)</li>
													<li>지원금액: 매학기 등록금의 50%이내 (300백만원 미만)</li>
												</ul>
											</td>
											<td class="align-c">인사관리규정 제73조</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">자녀학자금</th>
											<td class="align-l">수업료(입학금 포함)와 육성회비 또는 학교운영지원비(급식비등
												제외)
												<ul class="donation-desc mg-t-s">
													<li>서울특별시교육청에서 고시한 「서울특별시 학교 수업료 및 입학금에 관한 조례 시행규칙」<br>상의
														분기별 지급상한액을 초과할 수 없음
													</li>
												</ul>
												<p class="mg-t-s">※「초․중등교육법」제2조의 규정에 의한 중학교 및 고등학교(국립 또는
													공립학교, 사립학교) 대상만 지원</p>
											</td>
											<td class="align-c">인사관리규정 제74조</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">직원경조금</th>
											<td class="align-l">축의 및 부의
												<ul class="donation-desc mg-t-s">
													<li>직원 및 자녀 결혼 시 : 경조금 지급</li>
													<li>직원의 직계 존비속 사망 시 : 경조금 지급</li>
													<li>본인 및 배우자 출산 시 : 경조금 지금</li>
												</ul>
											</td>
											<td class="align-c">복리후생비 예산집행 지침</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">건강검진비</th>
											<td class="align-l">임직원에 대하여 2년에 1회 모금회에서 지정한 병원에서 건강검진
												실시</td>
											<td class="align-c">인사관리규정 제75조</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">맞춤형복지제도</th>
											<td class="align-l">개별적으로 부여된 복지점수를 사용하여 직원 개인이 적합한
												복지혜택을 선택하도록 하는 제도
												<ul class="donation-desc mg-t-s">
													<li>기본점수 : 전 직원 250점 일률 배정</li>
													<li>근속점수 : 1년 근속 당 10점(최고 25년까지)</li>
												</ul>
											</td>
											<td class="align-c">맞춤형 복지제도 운영 지침</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
                        <div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김미경(경영지원본부)</span><span
									class="ico-tel">02-6262-3016</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	


						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">10. 모성보호 및 일·가정 양립 지원제도</h4>
							<h5 class="title-heading_d mg-t-s">육아휴직 제도운영 현황</h5>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>육아휴직 제도운영 현황</caption>
									<colgroup>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">기관 현황</th>
										</tr>
									</thead>
									<tbody class="align-c">
										<tr>
											<th scope="row" class="sub_th">육아휴직 근거규정</th>
											<td>인사관리규정 제55조</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">근거자료 첨부</th>
											<td>
											    <a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/10/1/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="육아휴직 근거자료.hwp" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="육아휴직 근거자료.hwp" />
											</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">최대 육아휴직 가능 기간</th>
											<td>1년</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">근속연수 산입기간</th>
											<td>휴직기간은 근속연수에 산입함</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="title_wrap mg-t-m">
							<h5 class="title-heading_d mg-t-s">육아휴직 사용자 수</h5>
							<span class="text_unit">(2020. 3. 31. 기준, 단위:명)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>육아휴직 사용자 수</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
											<th scope="col">2020년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">남성 사용자 수</th>
											<td>2</td>
											<td>5</td>
											<td>3</td>
											<td>1</td>
											<td>2</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">여성 사용자 수</th>
											<td>22</td>
											<td>27</td>
											<td>29</td>
											<td>28</td>
											<td>18</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">전체 사용자 수</th>
											<td>24</td>
											<td>32</td>
											<td>32</td>
											<td>29</td>
											<td>20</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="title_wrap mg-t-m">
							<h5 class="title-heading_d mg-t-s">출산휴가·배우자출산휴가 제도운영 현황</h5>
						</div>

						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>출산휴가·배우자출산휴가 제도운영 현황</caption>
									<thead>
										<tr>
											<th scope="col" colspan="2">구분</th>
											<th scope="col">기관 현황</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="col" colspan="2" class="sub_th">출산·배우자출산휴가 근거규정</th>
											<th scope="row">인사관리규정 제46조, 50조</th>
										</tr>
										<tr>
											<th scope="col" colspan="2" class="sub_th">근거규정 첨부</th>
											<td>
											    <a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/10/2/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="출산휴가, 배우자출산휴가 근거자료.hwp" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="출산휴가, 배우자출산휴가 근거자료.hwp" />
											</td>
										</tr>
										<tr>
											<th scope="row" rowspan="2">최대 사용가능 일수</th>
											<th class="sub_th">출산휴가</th>
											<td>90일(한번에 둘 이상 자녀를 임신한 경우 120일)</td>
										</tr>
										<tr>
											<th class="sub_th">배우자출산휴가</th>
											<td>10일</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="title_wrap mg-t-m">
							<h5 class="title-heading_d mg-t-s">출산휴가·배우자출산휴가 사용자 수</h5>
							<span class="text_unit">(2020. 3. 31. 기준, 단위:명)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>출산휴가·배우자출산휴가 사용자 수</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
											<th scope="col">2020년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">출산휴가 사용자 수</th>
											<td>19</td>
											<td>14</td>
											<td>18</td>
											<td>15</td>
											<td>3</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">배우자출산휴가 사용자 수</th>
											<td>9</td>
											<td>5</td>
											<td>10</td>
											<td>7</td>
											<td>7</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>



						<div class="title_wrap mg-t-m">
							<h5 class="title-heading_d mg-t-s">유산·사산휴가 제도운영 현황</h5>
						</div>

						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>유산·사산휴가 제도운영 현황</caption>
									<thead>
										<tr>
											<th scope="col" colspan="2">구분</th>
											<th scope="col">기관 현황</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="col" colspan="2" class="sub_th">유산·사산휴가 근거규정</th>
											<th scope="row">모성보호 및 직장내 성희롱금지에 관한 세칙 제6조</th>
										</tr>
										<tr>
											<th scope="col" colspan="2" class="sub_th">근거규정 첨부</th>
											<td>
											    <a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/10/3/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="유산,사산휴가 근거자료.hwp" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="유산,사산휴가 근거자료.hwp" />
											</td>
										</tr>
										<tr>
											<th scope="row" rowspan="2">최대 사용가능 일수</th>
											<th class="sub_th">유산휴가</th>
											<td>90일</td>
										</tr>
										<tr>
											<th class="sub_th">사산휴가</th>
											<td>90일</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="title_wrap mg-t-m">
							<h5 class="title-heading_d mg-t-s">임신기·육아기·가족돌봄 근로시간 단축제도
								제도운영 현황</h5>
						</div>

						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>임신기·육아기·가족돌봄 근로시간 단축제도 제도운영 현황</caption>
									<thead>
										<tr>
											<th scope="col" colspan="2">구분</th>
											<th scope="col">기관 현황</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="col" colspan="2" class="sub_th">임신기·육아기·가족돌봄근로시간
												단축제도 근거규정</th>
											<td>인사관리규정 제46조의2 모성보호 및 직장 내 성희롱금지에 관한 세칙 제7조, 제8조의 2</td>
										</tr>
										<tr>
											<th scope="col" colspan="2" class="sub_th">근거규정 첨부</th>
											<td>
											    <a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/10/4/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="임신기,육아기,가족돌봄 근로시간 단축제도 근거자료.hwp" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="임신기,육아기,가족돌봄 근로시간 단축제도 근거자료.hwp" />
											</td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">단축근무시간(주당)</th>
											<th class="sub_th">임신기 단축근무제</th>
											<td>주 30시간</td>
										</tr>
										<tr>
											<th class="sub_th">육아기 단축근무제</th>
											<td>주 15시간~35시간</td>
										</tr>
										<tr>
											<th class="sub_th">가족돌봄 단축근무제</th>
											<td>주 15시간~30시간</td>
										</tr>
										<tr>
											<th scope="row" rowspan="3">최대 사용가능 일수</th>
											<th class="sub_th">임신기 단축근무제</th>
											<td>12주 0일까지, 35주 1일부터</td>
										</tr>
										<tr>
											<th class="sub_th">육아기 단축근무제</th>
											<td>1년</td>
										</tr>
										<tr>
											<th class="sub_th">가족돌봄 단축근무제</th>
											<td>1년<br />(일부 사유에 해당하는 경우, 2년의 범위 안에서 연장 가능)
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="title_wrap mg-t-m">
							<h5 class="title-heading_d mg-t-s">임신기·육아기 근로시간 단축제도 사용자 수</h5>
							<span class="text_unit">(2020. 3. 31. 기준, 단위:명)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>임신기·육아기 근로시간 단축제도 사용자 수</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2020년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">임신기 근로시간 단축제(A)</th>
											<td>1</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">육아기 근로시간 단축제(B)</th>
											<td>3</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">가족돌봄 근로시간 단축제(C)</th>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">계(A+B+C)</th>
											<td>4</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
						
						
                        <div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김미경(경영지원본부)</span><span
									class="ico-tel">02-6262-3016</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">11. 임원국외출장정보</h4>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>11. 임원국외출장정보</caption>
									<thead>
										<tr>
											<th scope="col">출장기간</th>
											<th scope="col">출장자</th>
											<th scope="col">출장지</th>
											<th scope="col">출장목적</th>
											<th scope="col">요약출장보고서</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" class="sub_th">2019.7.1.~2019.7.3</th>
											<td>회장 예종석</td>
											<td>몽골</td>
											<td>한‧몽 복지협력 회의 및 아시아태평양 지역사회기반 포용발전 회의 참석</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2019.4.30.~2019.5.10</th>
											<td>회장 예종석</td>
											<td>미국</td>
											<td>UWW 세계총회 참석 및 해외 한인모금 개발논의</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2018.6.24.~2018.6.30</th>
											<td>사무총장 김연순</td>
											<td>미국</td>
											<td>UWGLA 공동캠페인‘아너소사이어티 LA클럽’발족 및 United Way 네트워크 대표자 포럼</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2017.6.6~2017.6.8</th>
											<td>사무총장 박찬봉</td>
											<td>미국</td>
											<td>UWW 리더십포럼 참석</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2017.3.14.~2017.3.16</th>
											<td>사무총장 박찬봉</td>
											<td>중국</td>
											<td>2017년 중화자선총회 참석</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">2016.3.13.~2016.3.15</th>
											<td>사무총장 김주현</td>
											<td>중국</td>
											<td>중화자선총회 MOU 체결</td>
											<td>-</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p class="text-infos-l">※경영공시 확대에 따라 2020년부터 요약출장보고서 공시</p>
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김미경(경영지원본부)</span><span class="ico-tel">02-6262-3016</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span class="ico-tel">02-6262-3140</span>
							</p>
						</div>
						

						<!-- // -->
					</dd>
				</dl>
				<!--//2.기관운영-->


				<!--3.주요사업 및 경영성과-->
				<dl class="ui-acco-wrap type-a">
					<dt class="ui-acco-tit">
						<button type="button" class="ui-acco-btn">
							<p class="business-wrap">
								<span class="business-item1 n3">3</span> <span
									class="business-title">주요사업 및 경영성과</span> <span
									class="ui-acco-arrow"></span>
							</p>
						</button>
					</dt>
					<dd class="ui-acco-pnl1 pd-xs">
						<h4 class="title-heading_b mg-t-s">12. 모금실적</h4>
						<div class="title_wrap mg-t-s">
							<h4 class="title-heading_d mg-t-s">연도별 모금실적</h4>
							<span class="text_unit">(단위 : 억원) </span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>모금실적 및 모금현황(연도별 모금실적) 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
										</tr>
									</thead>
									<tbody>
										<tr class="total">
											<th scope="row">합계</th>
											<td>5,227</td>
											<td>5,742</td>
											<td>5,996</td>
											<td>5,965</td>
											<td>6,541</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">중앙회</th>
											<td>2,159</td>
											<td>2,196</td>
											<td>2,321</td>
											<td>2,313</td>
											<td>2,479</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">지회</th>
											<td>3,068</td>
											<td>3,546</td>
											<td>3,675</td>
											<td>3,652</td>
											<td>4,062</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p class="text-infos">※ 2018년 삼성중공업-허베이스피리트 호 기름유출사고 성금 3,067억원 제외</p>
						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_d">연도별 희망캠페인 모금실적</h4>
							<span class="text_unit">(단위 : 억원) </span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>연도별 희망캠페인 모금실적</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">희망2016 나눔캠페인</th>
											<th scope="col">희망2017 나눔캠페인</th>
											<th scope="col">희망2018 나눔캠페인</th>
											<th scope="col">희망2019 나눔캠페인</th>
											<th scope="col">희망2020 나눔캠페인</th>
										</tr>
									</thead>
									<tbody>
										<tr class="total">
											<th scope="row">합계</th>
											<td>3,500</td>
											<td>3,915</td>
											<td>4,051</td>
											<td>4,181</td>
											<td>4,273</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">중앙회</th>
											<td>1,813</td>
											<td>1,865</td>
											<td>1,953</td>
											<td>2,055</td>
											<td>2,098</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">지회</th>
											<td>1,687</td>
											<td>2,050</td>
											<td>2,098</td>
											<td>2,126</td>
											<td>2,175</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 강영은(자원개발본부)</span><span
									class="ico-tel">02-6262-3084</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b mg-t-s">13. 모금현황</h4>
							<h4 class="title-heading_b mg-t-s">2019년 주요모금사업 및 모금현황</h4>
							<h5 class="title-heading_d mg-t-s">기부방법별 모금현황</h5>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>기부방법별 모금현황 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">금액(억원)</th>
											<th scope="col">비율(%)</th>
										</tr>
									</thead>
									<tbody>
										<tr class="total">
											<th scope="row">합계</th>
											<td>6,541</td>
											<td>100%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">현금</th>
											<td>4,835</td>
											<td>73.9%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">현물</th>
											<td>1,706</td>
											<td>26.1%</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="title_wrap mg-t-m">
							<h5 class="title-heading_d mg-t-m">프로그램별 모금현황</h5>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>프로그램별 모금현황 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">금액(억원)</th>
											<th scope="col">비율(%)</th>
										</tr>
									</thead>
									<tbody>
										<tr class="total">
											<th scope="row">합계</th>
											<td>6,541</td>
											<td>100%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">CSR모금</th>
											<td>3,434</td>
											<td>52.5%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">착한일터</th>
											<td>323</td>
											<td>5.0%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">착한가게</th>
											<td>80</td>
											<td>1.2%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">아너소사이어티</th>
											<td>306</td>
											<td>4.7%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">나눔리더, 리더스클럽</th>
											<td>26</td>
											<td>0.4%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">지역연계모금</th>
											<td>1,323</td>
											<td>20.2%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">기타</th>
											<td>1,049</td>
											<td>16.0%</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
                        
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 강영은(자원개발본부)</span><span
									class="ico-tel">02-6262-3084</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	



						<h4 class="title-heading_b mg-t-m">14. 배분실적</h4>
						<div class="title_wrap mg-t-s">
							<h5 class="title-heading_b mg-t-s">연도별 배분실적</h5>
							<span class="text_unit">(단위 : 억원) </span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>배분실적 및 배분현황(연도별 배분실적) 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
										</tr>
									</thead>
									<tbody>
										<tr class="total">
											<th scope="row">합계</th>
											<td>6,038</td>
											<td>5,453</td>
											<td>5,553</td>
											<td>8,444</td>
											<td>5,958</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">중앙회</th>
											<td>2,469</td>
											<td>1,525</td>
											<td>1,570</td>
											<td>4,628</td>
											<td>1,877</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">지회</th>
											<td>3,569</td>
											<td>3,928</td>
											<td>3,983</td>
											<td>3,816</td>
											<td>4,081</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
                        
						<p class="text-infos-l">※ 2018년 삼성중공업-허베이스피리트 호 기름유출사고 성금 3,067억원 배분 포함</p>
                        
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 최정은(나눔사업본부)</span><span
									class="ico-tel">02-6262-3262</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<h4 class="title-heading_b mg-t-m">15. 배분현황</h4>
						<div class="title_wrap mg-t-s">
							<h4 class="title-heading_b mg-t-s">배분사업별 현황</h4>
							<span class="text_unit">(단위 : 억원) </span>
						</div>

						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>배분실적 및 배분현황(배분사업별) 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
										</tr>
									</thead>
									<tbody>
										<tr class="total">
											<th scope="row">합계</th>
											<td>6,038</td>
											<td>5,453</td>
											<td>5,553</td>
											<td>8,444</td>
											<td>5,958</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">신청사업</th>
											<td>88</td>
											<td>98</td>
											<td>99</td>
											<td>97</td>
											<td>96</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">기획사업</th>
											<td>1,629</td>
											<td>1,450</td>
											<td>1,326</td>
											<td>1,233</td>
											<td>1,178</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">긴급지원</th>
											<td>203</td>
											<td>202</td>
											<td>185</td>
											<td>181</td>
											<td>169</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">지정기탁</th>
											<td>4,118</td>
											<td>3,703</td>
											<td>3,943</td>
											<td>6,933</td>
											<td>4,515</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>




						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b mg-t-s">2019년 주요배분사업 현황</h4>
							<h5 class="title-heading_d  mg-t-s">
								분야별 배분현황
								</h5>
						</div>

						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>분야별 배분현황 정보</caption>
									<colgroup>
										<col style="width: 120px">
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">금액(억원)</th>
											<th scope="col">비율(%)</th>
										</tr>
									</thead>
									<tbody>
										<tr class="total">
											<th scope="row" >합계</th>
											<td>5,958</td>
											<td>100%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">기초생계지원</th>
											<td>2,942</td>
											<td>49%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">교육자립지원</th>
											<td>758</td>
											<td>13%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">주거환경지원</th>
											<td>631</td>
											<td>11%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">보건의료지원</th>
											<td>357</td>
											<td>6%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">심리정서지원</th>
											<td>223</td>
											<td>4%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">사회적돌봄강화</th>
											<td>644</td>
											<td>11%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">소통과참여확대</th>
											<td>199</td>
											<td>3%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">문화격차해소</th>
											<td>204</td>
											<td>3%</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<h5 class="title-heading_d mg-t-m">대상별 배분현황</h5>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>대상별 배분현황 정보</caption>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">금액(억원)</th>
											<th scope="col">비율(%)</th>
										</tr>
									</thead>
									<tbody>
										<tr class="total">
											<th scope="row">합계</th>
											<td>5,958</td>
											<td>100%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">아동·청소년</th>
											<td>1,092</td>
											<td>18%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">노인</th>
											<td>775</td>
											<td>13%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">장애인</th>
											<td>694</td>
											<td>12%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">여성·다문화</th>
											<td>407</td>
											<td>7%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">위기가정</th>
											<td>1,254</td>
											<td>21%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">지역사회</th>
											<td>1,553</td>
											<td>26%</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">해외·북한·기타</th>
											<td>183</td>
											<td>3%</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 최정은(나눔사업본부)</span><span
									class="ico-tel">02-6262-3262</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<h4 class="title-heading_b mg-t-m">16. 지속가능보고서</h4>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>16. 지속가능보고서</caption>
									<thead>
										<tr>
											<th scope="col">제목</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th class="sub_th">2018년도 지속가능보고서</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/16/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2018년 지속가능보고서.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2018년 지속가능보고서.pdf" />
											</td>
										</tr>
										<tr>
											<th class="sub_th">2017년도 연간보고서</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/16/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2017년 연간보고서.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2017년 연간보고서.pdf" />
											</td>
										</tr>
										<tr>
											<th class="sub_th">2016년도 연간보고서</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/16/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2016년 연간보고서.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2016년 연간보고서.pdf"" />
											</td>
										</tr>
										<tr>
											<th class="sub_th">2015년도 연간보고서</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/16/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2015년 연간보고서.pdf"" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2015년 연간보고서.pdf"" />
											</td>
										</tr>
										<tr>
											<th class="sub_th">2014년도 연간보고서</th>
											<td>
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/16/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2014년 연간보고서.pdf"" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2014년 연간보고서.pdf"" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p class="text-infos-l">※2018년부터 ‘연간보고서’에서 ‘지속가능보고서’로 명칭 및 내용구성을
							변경함.</p>
						<p class="text-infos-l">※2019년도 지속가능보고서는 2020년 6~7월에 발간될 예정임.</p>
							
					    
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 임지은(마케팅본부)</span><span
									class="ico-tel">02-6262-3035</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">17. 요약재무상태표</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위:원)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>요약재무상태표 정보</caption>
									<colgroup>
										<col style="width: 100px">
										<col style="width: 130px">
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="2">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="rowgroup" rowspan="2">자산</th>
											<th scope="row" class="sub_th">유동자산</th>
											<td>520,011,220,354</td>
											<td>526,807,292,604</td>
											<td>552,535,203,962</td>
											<td>559,477,421,732</td>
											<td>594,917,057,298</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">고정자산</th>
											<td>55,473,202,609</td>
											<td>56,732,338,945</td>
											<td>46,500,924,062</td>
											<td>75,466,518,439</td>
											<td>73,029,478,249</td>
										</tr>
										<tr class="total">
											<th scope="row" colspan="2">자산총계</th>
											<td>575,484,422,963</td>
											<td>583,539,631,549</td>
											<td>599,036,128,024</td>
											<td>634,943,940,171</td>
											<td>667,946,535,547</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="2">부채</th>
											<th scope="row" class="sub_th">유동부채</th>
											<td>2,761,133,293</td>
											<td>8,504,833,985</td>
											<td>3,552,934,930</td>
											<td>3,568,720,071</td>
											<td>4,300,344,121</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">고정부채</th>
											<td>10,365,819,017</td>
											<td>7,453,274,440</td>
											<td>7,719,994,482</td>
											<td>8,884,212,981</td>
											<td>10,643,035,539</td>
										</tr>
										<tr class="total">
											<th scope="row" colspan="2">부채총계</th>
											<td>13,126,952,310</td>
											<td>15,958,108,425</td>
											<td>11,272,929,412</td>
											<td>12,452,933,052</td>
											<td>14,943,379,660</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="2">자본</th>
											<th scope="row" class="sub_th">기본재산</th>
											<td>50,842,278,644</td>
											<td>50,842,278,644</td>
											<td>50,842,278,644</td>
											<td>50,842,278,644</td>
											<td>50,842,278,644</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">기타</th>
											<td>511,515,192,009</td>
											<td>516,739,244,480</td>
											<td>536,920,919,968</td>
											<td>571,648,728,475</td>
											<td>602,160,877,243</td>
										</tr>
										<tr class="total">
											<th scope="row" colspan="2">자본총계</th>
											<td>562,357,470,653</td>
											<td>567,581,523,124</td>
											<td>587,763,198,612</td>
											<td>622,491,007,119</td>
											<td>653,003,155,887</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김현진(경영지원본부)</span><span
									class="ico-tel">02-6262-3023</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">18. 요약운영성과표</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위:원)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>요약운영성과표 정보</caption>
									<colgroup>
										<col style="width: 100px">
										<col style="width: 130px">
										<col style="width: 100px">
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="3">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="rowgroup" rowspan="6">수익</th>
											<th scope="rowgroup" rowspan="4" class="sub_th">사업수익</th>
											<th scope="row">모금수입</th>
											<td>522,769,671,143</td>
											<td>574,204,679,669</td>
											<td>599,595,679,549</td>
											<td>903,206,545,727</td>
											<td>654,095,720,658</td>
										</tr>
										<tr>
											<th scope="row">복권수입</th>
											<td>27,361,000,000</td>
											<td>25,120,000,000</td>
											<td>28,368,000,000</td>
											<td>28,800,000,000</td>
											<td>26,806,000,000</td>
										</tr>
										<tr>
											<th scope="row">재산수입</th>
											<td>9,682,580,021</td>
											<td>7,482,356,658</td>
											<td>7,318,594,703</td>
											<td>9,121,476,664</td>
											<td>10,487,330,262</td>
										</tr>
										<tr>
											<th scope="row">기타</th>
											<td>5,487,505,479</td>
											<td>6,118,421,138</td>
											<td>10,229,641,151</td>
											<td>8,019,895,946</td>
											<td>7,238,869,463</td>
										</tr>
										<tr class="sub-total">
											<th scope="row" colspan="2">사업수익총계</th>
											<td>565,300,756,643</td>
											<td>612,925,457,465</td>
											<td>645,511,915,403</td>
											<td>949,147,918,337</td>
											<td>698,627,920,383</td>
										</tr>
										<tr class="sub-total">
											<th scope="row" colspan="2">사업외수익</th>
											<td>13,230,004,532</td>
											<td>10,159,866,143</td>
											<td>7,182,614,754</td>
											<td>7,264,009,943</td>
											<td>8,433,498,628</td>
										</tr>
										<tr class="total">
											<th scope="row" colspan="3">수익총계</th>
											<td>578,530,761,175</td>
											<td>623,085,323,608</td>
											<td>652,694,530,157</td>
											<td>956,411,928,280</td>
											<td>707,061,419,011</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="6">비용</th>
											<th scope="rowgroup" rowspan="4" class="sub_th">사업비용</th>
											<th scope="row">배분금</th>
											<td>630,405,237,247</td>
											<td>570,186,129,153</td>
											<td>583,494,555,492</td>
											<td>872,445,374,604</td>
											<td>623,258,337,906</td>
										</tr>
										<tr>
											<th scope="row">일반사업비</th>
											<td>14,291,054,150</td>
											<td>16,703,170,349</td>
											<td>17,625,032,324</td>
											<td>14,859,854,040</td>
											<td>16,539,608,035</td>
										</tr>
										<tr>
											<th scope="row">일반관리비</th>
											<td>21,162,352,408</td>
											<td>22,785,418,971</td>
											<td>23,329,480,925</td>
											<td>25,232,387,501</td>
											<td>25,399,679,486</td>
										</tr>
										<tr>
											<th scope="row">기타</th>
											<td>37,253,400</td>
											<td>30,453,400</td>
											<td>59,453,400</td>
											<td>10,000,000</td>
											<td>-</td>
										</tr>
										<tr class="sub-total">
											<th scope="row" colspan="2">사업비용총계</th>
											<td>665,895,897,205</td>
											<td>609,705,171,873</td>
											<td>624,508,522,141</td>
											<td>912,547,616,145</td>
											<td>665,197,625,427</td>
										</tr>
										<tr class="sub-total">
											<th scope="row" colspan="2">사업외비용</th>
											<td>10,636,045,167</td>
											<td>9,963,411,785</td>
											<td>8,004,332,528</td>
											<td>9,136,503,628</td>
											<td>11,351,644,816</td>
										</tr>
										<tr class="total">
											<th scope="row" colspan="3">비용총계</th>
											<td>676,531,942,372</td>
											<td>619,668,583,658</td>
											<td>632,512,854,669</td>
											<td>921,684,119,773</td>
											<td>676,549,270,243</td>
										</tr>
										<tr class="total2">
											<th scope="row" colspan="3">당기순이익</th>
											<td>-98,001,181,197</td>
											<td>3,416,739,950</td>
											<td>20,181,675,488</td>
											<td>34,727,808,507</td>
											<td>30,512,148,768</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
						
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김현진(경영지원본부)</span><span
									class="ico-tel">02-6262-3023</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">19. 수입지출현황</h4>
							<span class="text_unit">(2020. 3. 31. 기준, 단위:원)</span>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<caption>수입지출현황 정보</caption>
									<colgroup>
										<col style="width: 100px">
										<col style="width: 230px">
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="2">구분</th>
											<th scope="col">2015년</th>
											<th scope="col">2016년</th>
											<th scope="col">2017년</th>
											<th scope="col">2018년</th>
											<th scope="col">2019년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="rowgroup" rowspan="15">수입</th>
											<th scope="row" class="sub_th">모금수입</th>
											<td>522,769,671,143</td>
											<td>574,204,679,669</td>
											<td>599,595,679,549</td>
											<td>903,206,545,727</td>
											<td>654,095,720,658</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">복권수입</th>
											<td>27,361,000,000</td>
											<td>25,120,000,000</td>
											<td>28,368,000,000</td>
											<td>28,800,000,000</td>
											<td>26,806,000,000</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">수익사업수입</th>
											<td>382,269,798</td>
											<td>561,335,705</td>
											<td>807,590,894</td>
											<td>854,372,480</td>
											<td>968,862,683</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">재산수입</th>
											<td>9,545,934,723</td>
											<td>7,021,056,953</td>
											<td>6,636,543,309</td>
											<td>8,377,164,684</td>
											<td>9,658,467,579</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">보조금수입</th>
											<td>1,914,854,353</td>
											<td>1,910,401,782</td>
											<td>2,052,967,986</td>
											<td>2,130,360,782</td>
											<td>2,477,389,271</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">협찬수입</th>
											<td>37,253,400</td>
											<td>30,453,400</td>
											<td>59,453,400</td>
											<td>10,000,000</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">내부수입</th>
											<td>93,860,610,015</td>
											<td>99,416,263,961</td>
											<td>96,513,010,015</td>
											<td>81,694,232,412</td>
											<td>92,345,510,105</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">회계간전입</th>
											<td>-</td>
											<td>0</td>
											<td>1,013,840,035</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">잡수입</th>
											<td>3,535,397,726</td>
											<td>4,177,565,956</td>
											<td>8,117,219,765</td>
											<td>5,879,535,164</td>
											<td>4,761,480,192</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">재산처분이익</th>
											<td>9,046,000</td>
											<td>9,206,000</td>
											<td>49,753,761</td>
											<td>14,478,000</td>
											<td>20,485,646</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">재산평가이익</th>
											<td>2</td>
											<td>1</td>
											<td>0</td>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">고유목적 사업준비금환입</th>
											<td>12,415,846,009</td>
											<td>10,150,620,447</td>
											<td>7,131,489,174</td>
											<td>7,248,794,482</td>
											<td>8,413,012,981</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">과년도수입</th>
											<td>-</td>
											<td>39,695</td>
											<td>1,371,819</td>
											<td>737,460</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">세입조정계정</th>
											<td>-764,460,589</td>
											<td>3,312,495,221</td>
											<td>-4,414,890,604</td>
											<td>832,679,336</td>
											<td>1,433,516,869</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">전기이월 순자산</th>
											<td>668,868,983,965</td>
											<td>569,840,854,615</td>
											<td>578,623,711,841</td>
											<td>594,856,686,272</td>
											<td>629,925,263,565</td>
										</tr>
										<tr class="total">
											<th scope="row" colspan="2">수입합계</th>
											<td>1,339,936,406,545</td>
											<td>1,295,754,973,405</td>
											<td>1,324,555,740,944</td>
											<td>1,633,905,586,800</td>
											<td>1,430,905,709,550</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="14">지출</th>
											<th scope="row" class="sub_th">배분사업비</th>
											<td>630,405,237,247</td>
											<td>570,186,129,153</td>
											<td>583,494,555,492</td>
											<td>872,445,374,604</td>
											<td>623,258,337,906</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">일반사업비</th>
											<td>14,291,054,150</td>
											<td>16,703,170,349</td>
											<td>17,625,032,324</td>
											<td>14,859,854,040</td>
											<td>16,539,608,035</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">일반관리비</th>
											<td>20,984,738,532</td>
											<td>22,681,932,077</td>
											<td>23,024,191,989</td>
											<td>25,363,442,012</td>
											<td>25,256,564,359</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">협찬지출</th>
											<td>37,253,400</td>
											<td>30,453,400</td>
											<td>59,453,400</td>
											<td>10,000,000</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">내부지출</th>
											<td>93,860,610,015</td>
											<td>99,416,263,961</td>
											<td>96,513,010,015</td>
											<td>81,694,232,412</td>
											<td>92,345,510,105</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">회계간전출</th>
											<td>-</td>
											<td>0</td>
											<td>1,013,840,035</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">이자비용</th>
											<td>-</td>
											<td>0</td>
											<td>0</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">잡손실</th>
											<td>5</td>
											<td>4,183</td>
											<td>534,000</td>
											<td>19,000</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">재산처분손실</th>
											<td>263,458</td>
											<td>488,650</td>
											<td>1,408,102</td>
											<td>1,156,113</td>
											<td>5,668,427</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">재산평가손실</th>
											<td>3</td>
											<td>7</td>
											<td>3</td>
											<td>-</td>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">고유목적 사업준비금전입</th>
											<td>10,150,620,447</td>
											<td>7,131,489,174</td>
											<td>7,248,794,482</td>
											<td>8,413,012,981</td>
											<td>10,227,375,039</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">과년도지출</th>
											<td>485,161,254</td>
											<td>1,024,117,250</td>
											<td>753,595,941</td>
											<td>722,315,534</td>
											<td>1,118,601,350</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">세출조정계정</th>
											<td>-119,386,581</td>
											<td>-42,786,640</td>
											<td>-35,361,111</td>
											<td>470,916,539</td>
											<td>-375,922,373</td>
										</tr>
										<tr>
											<th scope="row" class="sub_th">차기이월 순자산</th>
											<td>569,840,854,615</td>
											<td>578,623,711,841</td>
											<td>594,856,686,272</td>
											<td>629,925,263,565</td>
											<td>662,529,966,702</td>
										</tr>
										<tr class="total">
											<th scope="row" colspan="2">지출합계</th>
											<td>1,339,936,406,545</td>
											<td>1,295,754,973,405</td>
											<td>1,324,555,740,944</td>
											<td>1,633,905,586,800</td>
											<td>1,430,905,709,550</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
						<p class="text-infos-l">1. 수익사업수입은 2011년부터 재산수입과 분리</p>
						<p class="text-infos-l">2. 회계간전입/전출은 2011년부터 내부수입/지출과 분리 </p>
						<p class="text-infos-l">3. 재산평가이익/손실은 2011년부터 재산처분이익/손실과 분리 </p>
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김현진(경영지원본부)</span><span
									class="ico-tel">02-6262-3023</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	

						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">20.회계감사보고서</h4>
						</div>
						<div class="tb-type_d">
							<div class="wide-scroll">
								<table>
									<colgroup>
										<col>
										<col style="width: 300px">
									</colgroup>
									<caption>회계감사보고서 정보</caption>
									<thead>
										<tr>
											<th scope="col">제목</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">2019년도 회계감사보고서</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/20/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2019년 회계감사보고서.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2019년 회계감사보고서.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row">2018년도 회계감사보고서</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/20/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2018년 회계감사보고서.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2018년 회계감사보고서.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row">2017년도 회계감사보고서</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/20/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2017년 회계감사보고서.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2017년 회계감사보고서.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row">2016년도 회계감사보고서</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/20/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2016년 회계감사보고서.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2016년 회계감사보고서.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row">2015년도 회계감사보고서</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/20/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2015년 회계감사보고서.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2015년 회계감사보고서.pdf" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						
						
						
                        <div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 김현진(경영지원본부)</span><span
									class="ico-tel">02-6262-3023</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>


						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">21. 연구보고서</h4>
						</div>
						<P class="data-info-txt mg-t-s">[사업]-[나눔문화 활성화]-[나눔문화연구소]-[연구자료](
						                                <a href="/bbs/1005/initPostList.do " target="_blank">링크</a>)에서 확인가능
						</P>
                        <div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 오양래(나눔문화연구소)</span><span
									class="ico-tel">02-6262-3196</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>
					</dd>
				</dl>
				<!--//3.주요사업 및 경영성과-->

				<!--4. 대내외평가  -->
				<dl class="ui-acco-wrap type-a">
					<dt class="ui-acco-tit">
						<button type="button" class="ui-acco-btn">
							<p class="business-wrap">
								<span class="business-item1 n4">4</span> <span
									class="business-title">대내외평가</span> <span class="ui-acco-arrow"></span>
							</p>
						</button>
					</dt>
					<dd class="ui-acco-pnl1 pd-xs">
						<div class="title_wrap mg-t-m">
							<h4 class="title-heading_b">22. 이사회 회의록</h4>
						</div>

						<div class="tb-type_d">
							<div class="wide-scroll">

								<table>
									<colgroup>
										<col>
										<col style="width: 300px">
									</colgroup>
									<caption>이사회 회의록</caption>
									<thead>
										<tr>
											<th scope="col">제목</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">2020년도 제1차 정기이사회 회의록</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/22/2020/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2020년도 제1차 정기이사회 회의록.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2020년도 제1차 정기이사회 회의록.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row">2020년도 제2차 임시이사회 회의록</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/22/2020/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2020년도 제2차 임시이사회 회의록.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2020년도 제2차 임시이사회 회의록.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row">2020년도 제1차 임시이사회 회의록</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/22/2020/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2020년도 제1차 임시이사회 회의록.pdf" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2020년도 제1차 임시이사회 회의록.pdf" />
											</td>
										</tr>
										<tr>
											<th scope="row">2019년도 이사회 회의록 모음</th>
											<td class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/22/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2019년도 이사회 회의록 모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2019년도 이사회 회의록 모음.zip" />
											</td>
										</tr>
										<tr>
											<th scope="row">2018년도 이사회 회의록 모음</th>
											<td  class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/22/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2018년도이사회회의록모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2018년도이사회회의록모음.zip" />
											</td>
										<tr>
											<th scope="row">2017년도 이사회 회의록 모음</th>
											<td  class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/22/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2017년도이사회회의록모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2017년도이사회회의록모음.zip" />
											</td>
										<tr>
											<th scope="row">2016년도 이사회 회의록 모음</th>
											<td  class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/22/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2016년도이사회회의록모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2016년도이사회회의록모음.zip" />
											</td>
										<tr>
											<th scope="row">2015년도 이사회 회의록 모음</th>
											<td  class="align-c">
												<a  href="#" onclick="gf_genFileExport(this);">[별첨파일]</a>
												<input id="filePath"   name="filePath"   type="hidden" value="<c:out value='${downPath}/download/001/ManageD/22/' escapeXml='false' />" />
												<input id="phycFileNm" name="phycFileNm" type="hidden" value="2015년도이사회회의록모음.zip" />
												<input id="logcFileNm" name="logcFileNm" type="hidden" value="2015년도이사회회의록모음.zip" />
											</td>
									</tbody>
								</table>
							</div>
						</div>
						
						
						<div class="data-info-b">
							<p class="data-info-txt">
								<span class="person-info">작성자 : 조진호(경영지원본부)</span><span
									class="ico-tel">02-6262-3010</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">감독자 : 김효진(전략기획본부)</span><span
									class="ico-tel">02-6262-3060</span>
							</p>
							<p class="data-info-txt">
								<span class="person-info">확인자 : 이경아 (준법감시실)</span><span
									class="ico-tel">02-6262-3140</span>
							</p>
						</div>	
					</dd>
				</dl>
				<!--//4.4. 대내외평가  -->
			</div>
		</div>
	</div>
	<!--// 컨텐츠 시끝 -->
</div>
</main>