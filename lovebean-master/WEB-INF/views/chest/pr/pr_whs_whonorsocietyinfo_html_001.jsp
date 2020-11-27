<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [하단메뉴] 기부자그룹 > W아너소사이어티
 * Author      : 
 * Description : 
                 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
    
    $(document).ready(function(){
        init();
        
    });

    function goTabDisplay(obj){
        
        $("div.tab-col").each(function(i) {
            $("#btn" + i ).removeClass('active');
            $("#pnl" + i ).hide();
        });     

        
        $("div.tab-col").each(function(i) {
            if(obj == i ){
                $("#btn" + i ).addClass('active');
                $("#pnl" + i ).show();  
            }
        });
    }
    
    function init(){
        goTabDisplay(0);
    }    
    
    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/

</script>


<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">W아너 소사이어티</h2>
        <p class="title-sub-txt">나눔문화를 선도하는 고액기부자 클럽</p>
    </div>
</div>
    
<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>W아너 소사이어티</strong><span>나눔문화를 선도하는 여성 고액기부자 클럽</span></h3>
            <div class="contents-menu-nav">
                <button type="button" class="next-menu">걸어온 길</button>
            </div>
        </div>

        <div class="seo-box">
            <div class="page-tab">
<!--                 <div class="tab-col"><a href="" class="tab-col-item"><i>W아너 소사이어티 소개</i></a></div> -->
<!--                 <div class="tab-col"><a href="" class="tab-col-item active"><i>걸어온 길</i></a></div> -->
                
                <div class="tab-col"><a href="javascript:;" class="tab-col-item" id ="btn0" onClick="javascript:goTabDisplay(0);" ><i>W아너 소사이어티 소개</i></a></div>
                <div class="tab-col"><a href="javascript:;" class="tab-col-item" id ="btn1" onClick="javascript:goTabDisplay(1);"><i>걸어온 길</i></a></div>
                
            </div>
            <!-- W아너 소사이어티란 시작-->
            <div class="page-box" id="pnl0">
                <div class="area-type-a type5">
                    <img src="/common/img/contents/honor_img.png" alt="w아너 소사이어티" >
                    <p>2017년 9월에 발족된 W아너 소사이어티는 여성 회원의 나눔 참여를 통해 <br>어려운 환경에 처한 여성취약계층 행복향상과 더불어 여성이 이끄는 한국의 노블레스 오블리주 문화를 만들어갑니다.</p>
                    <p>대한민국 여성 지위 향상을 위해 발족되었습니다. <br>공동의 해결 목표 설정을 통한 여성브랜드 지원사업을 펼칩니다.</p>
                </div>
                <!-- <div class="list-dltit type-b">
                    <div class="list-dltit-img">
                        <img src="/common/img/contents/honor_img01.png" alt="">
                        <span>2017 여성 아너 소사이어티 회원 모임 발대식</span>
                    </div>
                </div> -->
                
					<div class="donation-article">
					    <div class="gallery-list">
					        <ul>
					            <li>
					                <a href="#" class="gallery-link">
					                    <div class="gallery-img"><img src="/common/img/contents/honor_img01_191129_1.png" alt=""></div>
					                    <p class="gallery-tit align-c"><b>제1회 W아너 리더십 포럼</b></p>
					                </a>
					            </li>
					            <li>
					                <a href="#" class="gallery-link">
					                    <div class="gallery-img"><img src="/common/img/contents/honor_img01_191129_2.jpg" alt=""></div>
					                    <p class="gallery-tit align-c"><b>2018 여성 사회복지시설 현장 방문</b></p>
					                </a>
					            </li>
					            <li>
					                <a href="#" class="gallery-link">
					                    <div class="gallery-img"><img src="/common/img/contents/honor_img01_191129_4.jpg" alt=""></div>
					                    <p class="gallery-tit align-c"><b>2019 여성 사회복지시설 현장 방문</b></p>
					                </a>
					            </li>
					            <li>
					                <a href="#" class="gallery-link">
					                    <div class="gallery-img"><img src="/common/img/contents/honor_img01_191129_3.jpg" alt=""></div>
					                    <p class="gallery-tit align-c"><b>2019 김장김치 나눔 봉사활동</b></p>
					                </a>
					            </li>
					        </ul>
					    </div>
					</div>
            </div>
            
            <!-- 갤러리형-변경191129 -->
            <div class="donation-section"></div>
			<!-- <h4 class="table-tit">기부자 맞춤기금 사례</h4> -->

            
            
            <!-- 갤러리형-변경191129//끝-->
            
            <!-- W아너 소사이어티란 끝  -->
            <!-- 걸어온 길 시작   -->
            
            <div class="history-wrap line-type with-img"  id="pnl1">
	            <div class="history-item">
	                    <p class="year-txt">2020</p>
	                    <dl class="history-info">
	                    	<dt class="history-info-month">09.24</dt>
	                        <dd class="history-info-txt">제1회 W아너 리더십 포럼</dd>
	                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200924.png" alt=""></dd>
	                    	<dt class="history-info-month">05.28</dt>
	                        <dd class="history-info-txt">W아너 소사이어티 활성화를 위한 간담회</dd>
	                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200622.jpg" alt=""></dd>
	                    	<dt class="history-info-month">04.13</dt>
	                        <dd class="history-info-txt">W아너 소사이어티 활성화를 위한 전문가 차담회</dd>
	                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200423_8.jpg" alt=""></dd>
	                    	<dt class="history-info-month">01.16</dt>
	                        <dd class="history-info-txt">[부산지회] 2020년 W아너 설명절 봉사활동</dd>
	                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200423_6.jpg" alt=""></dd>
	                    </dl>
	            </div>
                <div class="history-item">
                    <p class="year-txt">2019</p>
                    <dl class="history-info">
                        <dt class="history-info-month">12.23</dt>
                        <dd class="history-info-txt">[충남지회] 연말 크리스마스 지원</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200423_5.jpg" alt=""></dd>
                        <dt class="history-info-month">10.30</dt>
                        <dd class="history-info-txt">W아너 소사이어티 김장김치 나눔행사</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/history_img01_191204.jpg" alt=""></dd>
                        <dt class="history-info-month">10.01</dt>
                        <dd class="history-info-txt">[대구지회] 대구 W아너 소사이어티 무료급식 봉사활동</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200423_4.jpg" alt=""></dd>
                        <dt class="history-info-month">08.27</dt>
                        <dd class="history-info-txt">[부산지회] 2019년 W아너 추석명절 봉사활동</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200423_3.jpg" alt=""></dd>
                        <dt class="history-info-month">04.03</dt>
                        <dd class="history-info-txt">W아너 소사이어티 리더 회의 <br>“W아너 소사이어티 두 번째 전달식”</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/history_img01.jpg" alt=""></dd>
                        <dt class="history-info-month">01.14</dt>
                        <dd class="history-info-txt">[부산지회] 2019년 W아너 설명절 봉사활동</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200423_2.jpg" alt=""></dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2018</p>
                    <dl class="history-info">
                        <dt class="history-info-month">10.23</dt>
                        <dd class="history-info-txt">여성 사회복지 현장과 함께하는 W아너 소사이어티 리더 모임 <br>“W아너 소사이어티 첫 번째 전달식”</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/history_img02.jpg" alt=""></dd>
                        <dt class="history-info-month">09.06</dt>
                        <dd class="history-info-txt">[부산지회] 2018년 W아너 창립총회 및 추석명절 봉사활동</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/honor_img01_200423_1.jpg" alt=""></dd>
                        <dt class="history-info-month">09.05</dt>
                        <dd class="history-info-txt">[서울지회] w아너 소사이어티 운영계획 논의</dd><br>
                        <dt class="history-info-month">08.23</dt>
                        <dd class="history-info-txt">[경기지회] W아너 소사이어티 모임</dd><br>
                        <dt class="history-info-month">06.21</dt>
                        <dd class="history-info-txt">W아너 소사이어티 리더 회의</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/history_img03.jpg" alt=""></dd>
                        <dt class="history-info-month">02.23</dt>
                        <dd class="history-info-txt">[강원지회] W아너 소사이어티 회원 간담회</dd><br>
                        <dt class="history-info-month">02.28</dt>
                        <dd class="history-info-txt">W아너 소사이어티 리더 회의</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/history_img04.jpg" alt=""></dd>
                        <dt class="history-info-month">01.31</dt>
                        <dd class="history-info-txt">[인천지회] W아너 소사이어티 활동 계획 및 인천 w아너 리더 선출</dd><br>
                        <dt class="history-info-month">01.30</dt>
                        <dd class="history-info-txt">[강원지회] W아너 소사이어티 회원 간담회</dd><br>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2017</p>
                    <dl class="history-info">
                        <dt class="history-info-month">09.12</dt>
                        <dd class="history-info-txt">여성 아너 소사이어티 회원 모임 발대식</dd>
                        <dd class="history-info-img"><img src="/common/img/contents/history_img05.jpg" alt=""></dd>
                    </dl>
                </div>
            </div>            
            
            <!-- 걸어온 길 끝   -->
            
        </div>
    </div>
</main>


