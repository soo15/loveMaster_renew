<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [하단메뉴] 기부자그룹 > 아너  소사이어티
 * Author      : 
 * Description : 
                 1. 기부자 상담신청 하기  클릭시 기부 > 기부참여방법 > 아너 소사이어티 페이지로 링크
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">
var _reqstManageTy = "${reqstManageTy}";  // 기부신청관리유형
var myGrid = null;
var CURR_PAGE_NO = "<c:out value='${paramMap.currPageNo}' />";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
     $(document).ready(function(){

         init();
         $("#btnSearch").off("click").on('click', function(e){
             selectMberintrcnList();
         });

         $("#pHonorNm").off("keypress").on("keypress", function(e){
             if(e.keyCode == 13){
                 selectMberintrcnList();
             }
         });
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
         
         if (obj == 4){
             $('#pHonorNm').val('');
             selectMberintrcnList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);
         }
     }

     function init(){
         
         myGrid = gf_initMyGrid();
         selectMberintrcnList(!gf_isNull(CURR_PAGE_NO) ? Number(CURR_PAGE_NO) : 1);

         goTabDisplay(0);
     }
     /*===========================================================
      * 기부자상담신청 하기 버튼 클릭시 Function !!
      *===========================================================*/    
     $(document).on("click", "#btnRegist", function(e){
         // 기부상담 구분코드 
         param = "&ftCntr="+_reqstManageTy;
         // 기부 > 기부참여방법 > 아너 소사이어티  으로 Move 
         gf_submitMovePage("<c:url value='/ct/cntrpt/initHonorsociety.do' />", param);
         
     });
     /*===========================================================
      * Mberintrcn 목록 조회 !!
      *===========================================================*/
     function selectMberintrcnList(pageNo){
         gf_send("<c:url value='/pr/hs/selectMberintrcnList.do' />", gf_searchParam(pageNo));
     }
     /*************************************************************
      * Ajax Send Callback Function !!
      *************************************************************/
     /*===========================================================
      * 홍보대사 리스트 조회 Callback Function !!
      *===========================================================*/
      function selectMberintrcnListAfter(data){
         $("#dataGridList").html('');
         $('#dataGridPageNavi').html('');

         var listInfo = data.listInfo;
         var pageInfo = data.pageInfo;

         var listHtml = "";

         for(var i=0; i<listInfo.length; i++){
             var honorSn     = listInfo[i].honorSn;
             var bhfHonorSn  = listInfo[i].bhfHonorSn;
             var honorNm     = listInfo[i].honorNm;
             var serverFileNm= listInfo[i].serverFileNm;
             var fileExtsn   = listInfo[i].fileExtsn;
             var flpth       = listInfo[i].flpth;

             var imgSrc      = "${genFilePath}" + flpth + "/" + serverFileNm + "." + fileExtsn;

             listHtml += '<li>';
             listHtml += '    <a href="javascript:;" class="gallery-link">';
             if(serverFileNm != ''){
                 listHtml += '       <div class="gallery-img"><img src="' + imgSrc + '" alt="' + honorNm + '"></div>';
             }else{
                 listHtml += '       <div class="gallery-img"><img src="/common/img/common/no-img.jpg" alt=""></div>';
             }
             listHtml += '       <p class="gallery-tit"><b>' + honorNm + '</b><span>' + honorSn + '</span></p>';
             listHtml += '    </a>';
             listHtml += '</li>';

         }

         $("#dataGridList").html(listHtml);

         if(listInfo.length != 0){
             myGrid.makePageNvai(pageInfo, "selectMberintrcnList");
         }
     }

</script>

<div class="sub-visual visual02_01">
    <div class="sub-title-area">
        <h2 class="heading-title-a">아너 소사이어티</h2>
        <p class="title-sub-txt">나눔문화를 선도하는 고액기부자들의 모임입니다</p>
    </div>
</div>

<%@ include file="../../layout/breadcrumbs.jsp"%>

<main class="base-main" id="baseMain">
    <div class="contents-area">
        <div class="contents-hd">
            <h3><strong>아너 소사이어티</strong><span>나눔문화를 선도하는 고액기부자 클럽</b></span></h3>
            <div class="contents-menu-nav">
                <button type="button" class="next-menu">걸어온 길</button>
            </div>
        </div>

        <div class="seo-box">
            <div class="page-tab">
                <div class="tab-col"><a href="javascript:;" class="tab-col-item" id ="btn0" onClick="javascript:goTabDisplay(0);" ><i>아너 소사이어티란</i></a></div>
                <div class="tab-col"><a href="javascript:;" class="tab-col-item" id ="btn1" onClick="javascript:goTabDisplay(1);"><i>걸어온 길</i></a></div>
                <div class="tab-col"><a href="javascript:;" class="tab-col-item" id ="btn2" onClick="javascript:goTabDisplay(2);"><i>현황</i></a></div>
                <div class="tab-col"><a href="javascript:;" class="tab-col-item" id ="btn3" onClick="javascript:goTabDisplay(3);"><i>참여안내</i></a></div>
                <div class="tab-col"><a href="javascript:;" class="tab-col-item" id ="btn4" onClick="javascript:goTabDisplay(4);"><i>회원소개</i></a></div>
            </div>
            <!--  S : 아너 소사이어티란 -->
            <div class="page-box" id="pnl0">
                <div class="area-type-a">
                    <img src="/common/img/contents/honorsociety_logo.png" alt="아너 소사이어티 Honor Society" >
                    <p>아너 소사이어티는 1억원 이상을 기부하였거나 5년 이내 납부를 약정한 개인 고액 기부자들의 모임으로 <br>사회문제에 대한 관심과 이해를 바탕으로 참여와 지원을 통해 더 밝은 내일은 여는 사회지도자들의 모임입니다.</p>
                </div>
                <dl class="list-dltit">
                    <dt>성숙한 기부문화 확산을 위한 첫걸음 </dt>
                    <dd>사회복지공동모금회는 1998년 11월 설립된 후 나눔문화의 정착과 확산, 지원사업을 통한 민간복지 발전의 길을 걸어왔습니다. 우리 사회 소외계층 및 소외지역을 위한 다양한 복지사업을 지원하여 개인의 삶의 질 향상과 지역사회 변화를 일구어 가는 길이었습니다. 이후 10년 동안 기부인식 확산과 사회공헌 활성화에 힘입어 사회복지공동모금회와 함께 한 국민과 기업들이 크게 늘었습니다. 이 기간 동안 사회복지공동모금회 전체 모금액 중 개인기부액이 차지하는 비율은 약 30%로 증가하는 추세였습니다. 하지만 미국의 80%, 세계 평균 69.5%에는 훨씬 못 미치는, 아직 갈 길이 먼 상황이었습니다. 이에 사회복지공동모금회는 개인기부자의 헌신을 높이 사고 그 정신을 널리 알려 개인기부를 활성화할 새로운 길을 모색했습니다. 2007년 12월 설립된 국내 최초의 고액기부자모임 '아너 소사이어티(Honor Society)'가 바로 그 길 이었습니다.</dd>

                    <dt>대한민국 최초이자 최고의 고액기부 프로그램으로 </dt>
                    <dd>'아너 소사이어티'는 설립 과정에서 세계공동모금회의 '토크빌 소사이어티'를 모델로 시작하였습니다. 하지만 새로운 희망의 길을 열기 위해 단지 그 자리에 머무르지 않고 우리나라 고유의 사회문화적 특성을 반영한 독자적 운영체계를 수립했습니다. 또 지역 아너 클럽과 특성화 클럽 운영 등 다양한 관리체계도 함께 구축했습니다. 그 결과 '아너 소사이어티'는 대한민국 최초이자 최고의 고액기부 프로그램으로 발전해갔으며, 당초의 걱정은 희망과 새로운 꿈으로 바뀌어갔습니다. 2008년 5월 마침내 첫 번째 가입자가 나온 이래, 날이 갈수록 많은 사람들이 더욱 따뜻한 세상을 향한 '아너 소사이어티'의 꿈과 함께 해주었습니다.</dd>

                    <dt>나눔문화가 아름다운 보편적 가치가 되는 희망의 100년을 위해 </dt>
                    <dd>이제 '아너 소사이어티'는 단순한 나눔을 실천하는 사람들의 모임이 아닙니다. 더 나은 세상, 더 밝은 미래 사회를 만드는데 앞장서며 함께 그 길을 갈 사람들에게 손을 내미는 리더들의 모임입니다. 고액기부는 고액자산가만이 할 수 있다는 인식을 깨고 다양한 시민이 함께 할 수 있는 길을 열었습니다. 그리하여 사회 전반적으로 고액기부에 대한 인식의 변화와 나눔문화 확산을 이끌었습니다.</dd>
                    <dd class="list-dltit-img">
                        <img src="/common/img/contents/honorsociety_photo.jpg" alt="">
                        <span>2019 아너 소사이어티 회원의 날  </span>
                    </dd>
                </dl>
            </div>
            <!--  E : 아너 소사이어티란 -->

            <!--  S : 걸어온 길 -->
            <div class="history-wrap line-type" id="pnl1">
                <div class="history-item">
                    <p class="year-txt">2019</p>
                    <dl class="history-info">
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">제4차 W 아너 소사이어티 리더회의<br/>7회 아너 소사이어티 회원 대표회의</dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">제10회 아너 소사이어티 회원의 날</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2018</p>
                    <dl class="history-info">
                        <dt class="history-info-month">02</dt>
                        <dd class="history-info-txt">1800호 회원 가입((주)합동지질 김영근 대표)<br>제1차 W아너 소사이어티 리더회의</dd>
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">제6회 아너 소사이어티 회원 대표회의</dd>
                        <dt class="history-info-month">06</dt>
                        <dd class="history-info-txt">제2차 W아너 소사이어티 리더회의 </dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">세계공동모금회 2018 캐나다 라운드테이블 참석</dd>
                        <dt class="history-info-month">10</dt>
                        <dd class="history-info-txt">제3차 W 아너 소사이어티 리더회의</dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">제9회 아너 소사이어티 회원의 날</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">2000호 회원 가입((주)제너럴바이오,지쿱 서정훈 대표)</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2017</p>
                    <dl class="history-info">
                        <dt class="history-info-month">03</dt>
                        <dd class="history-info-txt">1500호 회원 가입(고진영 프로골퍼) </dd>
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">제5회 아너 소사이어티 회원 대표회의</dd>
                        <dt class="history-info-month">06</dt>
                        <dd class="history-info-txt">LA모금회와 함께하는 ‘One Heart, Two Loves’ 캠페인 아너 1호 탄생 <br>(케빈 김 Bank of Hope 행장) </dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">W 아너 소사이어티 발족 및 봉사활동<br>세계공동모금회 2017 루마니아라운드테이블 참석 </dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">‘One Heart, Two Loves’ 캠페인 아너 소사이어티 단체가입(3인)<br>제8회 아너 소사이어티 ‘10주년’ 회원의 날 </dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2016</p>
                    <dl class="history-info">
                        <dt class="history-info-month">05</dt>
                        <dd class="history-info-txt">제4회 아너 소사이어티 회원 대표회의</dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">세계공동모금회 2016 멕시코라운드 테이블 참석</dd>
                        <dt class="history-info-month">10</dt>
                        <dd class="history-info-txt">제1300호 회원 가입(故 윤병철 제6대 사회복지공동모금회장)</dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">제7회 아너 소사이어티 회원의 날</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">아너 소사이어티 ‘명예의 전당’ 개관</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2015</p>
                    <dl class="history-info">
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">제800호 회원 가입(팝페라테너 임형주 님)</dd>
                        <dt class="history-info-month">05</dt>
                        <dd class="history-info-txt">제3회 아너 소사이어티 회원 대표회의</dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">세계공동모금회 2015 서울라운드테이블 개최</dd>
                        <dt class="history-info-month">10</dt>
                        <dd class="history-info-txt">제6회 아너 소사이어티 회원의 날</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">제1000호 회원 가입(대한노인회 이심회장)</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2014</p>
                    <dl class="history-info">
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">제2회 아너 소사이어티 회원 대표회의</dd>
                        <dt class="history-info-month">05</dt>
                        <dd class="history-info-txt">제499호&500호 회원 가입(배기선, 김선화 님 부부 아너)<br>삼성 패밀리오피스-아너 소사이어티 고액기부컨설팅 MOU 체결</dd>
                        <dt class="history-info-month">10</dt>
                        <dd class="history-info-txt">제600호 회원 가입(내츄럴엔도텍 김재수 대표)</dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">제5회 아너 소사이어티 회원의 날</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">제700호 회원 가입(한우전문점 칠억조 정형철 대표)</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2013</p>
                    <dl class="history-info">
                        <dt class="history-info-month">03</dt>
                        <dd class="history-info-txt">신한PWM-아너 소사이어티 고액기부컨설팅 MOU 체결</dd>
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">제1회 아너 소사이어티 회원 대표회의<br>보건복지부 2013 제1회 행복나눔人 추천 및 수상(김용복 회원 외 9인)</dd>
                        <dt class="history-info-month">05</dt>
                        <dd class="history-info-txt">제1회 패밀리 아너스 데이</dd>
                        <dt class="history-info-month">06</dt>
                        <dd class="history-info-txt">제300호 회원 가입(대한산악연맹 이인정 회장)</dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">제4회 아너 소사이어티 회원의 날</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">제400호 회원 가입(목영준 김앤장 사회공헌위원장)</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2012</p>
                    <dl class="history-info">
                        <dt class="history-info-month">03</dt>
                        <dd class="history-info-txt">제100호 회원 가입(쌀눈조아 주기영 대표)</dd>
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">보건복지부 2012 제1회 행복나눔人 추천 및 수상(남한봉 회원)</dd>
                        <dt class="history-info-month">07</dt>
                        <dd class="history-info-txt">제46회 청룡봉사상 추천 및 수상(원영식 회원)</dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">제150호 회원 겸 기부자조언기금 1호 가입((주)에스씨엘 이상춘 대표)</dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">제3회 아너 소사이어티 회원의 날</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">제200호 회원 가입(영화배우 수애)</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2011</p>
                    <dl class="history-info">
                        <dt class="history-info-month">03</dt>
                        <dd class="history-info-txt">제2회 아너 소사이어티 회원의 날</dd>
                        <dt class="history-info-month">07</dt>
                        <dd class="history-info-txt">포브스지 선정 2011 아시아 기부영웅 2명 배출(홍명보,송경애 회원)</dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">조선일보 특집 기획보도 진행 ‘자본주의 4.0 - 나누는 사람들’ <br>아너소사이어티 최초 父子 회원 탄생(류시문,류원정 가족)</dd>
                        <dt class="history-info-month">10</dt>
                        <dd class="history-info-txt">아너소사이어티 최초 夫婦 회원 탄생(이덕우,장선오 님)</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2010</p>
                    <dl class="history-info">
                        <dt class="history-info-month">01</dt>
                        <dd class="history-info-txt">제1회 아너 소사이어티 회원의 날</dd>
                        <dt class="history-info-month">01-02</dt>
                        <dd class="history-info-txt">아너회원 18명 조선일보 재능을 나눕시다 캠페인 참여</dd>
                        <dt class="history-info-month">03</dt>
                        <dd class="history-info-txt">포브스지 선정 2010 아시아 기부영웅 1명 배출(박순호 회원)</dd>
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">삼성증권-사랑의열매 고액기부컨설팅 MOU체결(국내 최초)</dd>
                        <dt class="history-info-month">05</dt>
                        <dd class="history-info-txt">‘지속가능한 사회와 나눔리더의 역할’ 공개토론회 개최<br>아너 회원 최초 기부자조언기금(DAF) 설립(류종춘 회원)</dd>
                        <dt class="history-info-month">07</dt>
                        <dd class="history-info-txt">상반기 신규회원 20명 돌파. 총 회원 38명. 65억원 기부.</dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">‘나눔문화대축제’ 대통령 내외분과의 공식오찬 회원14명 초청</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">총 44명. 75억원 기부</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2009</p>
                    <dl class="history-info">
                        <dt class="history-info-month">03</dt>
                        <dd class="history-info-txt">포브스지 선정 2009 아시아 기부영웅 2명 배출(최신원,남한봉 회원)</dd>
                        <dt class="history-info-month">04</dt>
                        <dd class="history-info-txt">위클리 경향 표지 헤드라인 특집보도</dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">중앙일보 1면 헤드라인 아너 회원 특집보도<br>김형오 국회의장 아너소사이어티 회원 특별감사축전 발송</dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">포브스코리아 표지 헤드라인 특집보도<br>사랑의열매 음악회 아너소사이어티 회원 초청</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">2009년 누적회원 17명 달성</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2008</p>
                    <dl class="history-info">
                        <dt class="history-info-month">05</dt>
                        <dd class="history-info-txt">제1호 회원 가입(유닉스코리아 남한봉 회장)</dd>
                        <dt class="history-info-month">09</dt>
                        <dd class="history-info-txt">고액기부활성화를 위한 고액자산가 기부성향분석 설문조사</dd>
                        <dt class="history-info-month">11</dt>
                        <dd class="history-info-txt">모금회 창립기념일 고액기부자 초청<br>PB(프라이빗뱅커)초청 좌담회 개최<br>사랑의열매 앙드레김패션쇼 고액기부자 초청</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">사랑의열매회관 6층 명예의전당 오픈<br>신규 B.I 론칭<br>2008년 신규회원 SKC 최신원 회장외 5명 가입</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2007</p>
                    <dl class="history-info">
                        <dt class="history-info-month">10-11</dt>
                        <dd class="history-info-txt">고액기부활성화를 위한 ‘고액기부자모임’ 설립 실무준비</dd>
                        <dt class="history-info-month">12</dt>
                        <dd class="history-info-txt">국내 최초의 고액기부자모임 ‘아너 소사이어티’ 설립</dd>
                    </dl>
                </div>
                <div class="history-item">
                    <p class="year-txt">2005</p>
                    <dl class="history-info">
                        <dt class="history-info-month">05</dt>
                        <dd class="history-info-txt">개인 및 잠재적 고액기부 활성화를 위한 연구용역(모금회연구센터)</dd>
                    </dl>
                </div>
            </div>
            <!--  E : 걸어온 길 -->
            <!--  S : 현황 -->
            <div class="page-box" id="pnl2">

                <div class="area-type-a">
                    <dl>
                        <dt class="area-type-tit">아너 소사이어티 현황<span>(2019년 11월 기준)</span></dt>
                        <dd class="area-type-item n1">
                            <div>
                                아너 회원 수
                                <strong>2,193명<br><span>(익명회원 235명 포함)</span></strong>
                            </div>
                        </dd>
                        <dd class="area-type-item n2">
                            <div>
                                누적약정금액
                                <strong>약 2,434억원</strong>
                            </div>
                        </dd>
                    </dl>
                </div>


                <h4 class="table-tit">연도별 아너 소사이어티 현황</h4>
                <div class="img-wrap">
                    <div class="wide-scroll">
                    <img src="/common/img/contents/graph_honer1.png" alt="연도별 가입현황과 누적회원 정보 그래프">
                        <div class="hide">
                            <table>
                                <caption>연도별 아너 소사이어티 가입현황, 누적회원 수 정보</caption>
                                <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">2008</th>
                                        <th scope="col">2009</th>
                                        <th scope="col">2010</th>
                                        <th scope="col">2011</th>
                                        <th scope="col">2012</th>
                                        <th scope="col">2013</th>
                                        <th scope="col">2014</th>
                                        <th scope="col">2015</th>
                                        <th scope="col">2016</th>
                                        <th scope="col">2017</th>
                                        <th scope="col">2018</th>
                                        <th scope="col">2019</th>
                                    </tr>
                                </thead>
                                <thead>
                                    <tr>
                                        <th scope="row">연도별 가입현황</th>
                                        <td>6</td>
                                        <td>11</td>
                                        <td>31</td>
                                        <td>54</td>
                                        <td>126</td>
                                        <td>210</td>
                                        <td>272</td>
                                        <td>302</td>
                                        <td>422</td>
                                        <td>338</td>
                                        <td>253</td>
                                        <td>168</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">누적회원</th>
                                        <td>6</td>
                                        <td>17</td>
                                        <td>48</td>
                                        <td>102</td>
                                        <td>228</td>
                                        <td>438</td>
                                        <td>710</td>
                                        <td>1012</td>
                                        <td>1434</td>
                                        <td>1772</td>
                                        <td>2025</td>
                                        <td>2193</td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <!--<img src="/common/img/contents/graph_honer2.png" alt="약정금액과 누적금액 정보 그래프">
                        <div class="hide">
                            <table>
                                <caption>연도별 아너 소사이어티 약정금액과 누적금액 정보</caption>
                                <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">2008</th>
                                        <th scope="col">2009</th>
                                        <th scope="col">2010</th>
                                        <th scope="col">2011</th>
                                        <th scope="col">2012</th>
                                        <th scope="col">2013</th>
                                        <th scope="col">2014</th>
                                        <th scope="col">2015</th>
                                        <th scope="col">2016</th>

                                    </tr>
                                </thead>
                                <thead>
                                    <tr>
                                        <th scope="row">약정금액</th>
                                        <td>7</td>
                                        <td>12</td>
                                        <td>38</td>
                                        <td>60</td>
                                        <td>133</td>
                                        <td>259</td>
                                        <td>282</td>
                                        <td>296</td>
                                        <td>447</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">누적금액</th>
                                        <td>7</td>
                                        <td>19</td>
                                        <td>57</td>
                                        <td>117</td>
                                        <td>250</td>
                                        <td>509</td>
                                        <td>791</td>
                                        <td>1087</td>
                                        <td>1534</td>
                                    </tr>
                                </thead>
                            </table>
                        </div> -->
                    </div>
                </div>

                <h4 class="table-tit">지역별 아너 소사이어티 현황</h4>
                <div class="tb-type_b cckgrop03-tbl1">
                    <div class="wide-scroll">
                        <table>
                            <caption>지역별 아너 소사이어티 현황 정보</caption>
                            <col class="col-th">
                            <col span="19" class="col-auto">
                            <thead>
                                <tr>
                                    <th scope="col">호수</th>
                                    <th scope="col">합계</th>
                                    <th scope="col">중앙</th>
                                    <th scope="col">서울</th>
                                    <th scope="col">부산</th>
                                    <th scope="col">대구</th>
                                    <th scope="col">인천</th>
                                    <th scope="col">광주</th>
                                    <th scope="col">대전</th>
                                    <th scope="col">울산</th>
                                    <th scope="col">경기</th>
                                    <th scope="col">강원</th>
                                    <th scope="col">충북</th>
                                    <th scope="col">충남</th>
                                    <th scope="col">전북</th>
                                    <th scope="col">전남</th>
                                    <th scope="col">경북</th>
                                    <th scope="col">경남</th>
                                    <th scope="col">제주</th>
                                    <th scope="col">세종</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">누적</th>
                                    <td>2193</td>
                                    <td>268</td>
                                    <td>278</td>
                                    <td>177</td>
                                    <td>143</td>
                                    <td>137</td>
                                    <td>98</td>
                                    <td>75</td>
                                    <td>85</td>
                                    <td>216</td>
                                    <td>73</td>
                                    <td>54</td>
                                    <td>96</td>
                                    <td>63</td>
                                    <td>87</td>
                                    <td>107</td>
                                    <td>116</td>
                                    <td>104</td>
                                    <td>16</td>
                                </tr>
                                <tr>
                                    <th scope="row">19년도</th>
                                    <td>+168</td>
                                    <td>+15</td>
                                    <td>+19</td>
                                    <td>+22</td>
                                    <td>+13</td>
                                    <td>+9</td>
                                    <td>+10</td>
                                    <td>+5</td>
                                    <td>+2</td>
                                    <td>+14</td>
                                    <td>+7</td>
                                    <td>+4</td>
                                    <td>+11</td>
                                    <td>+9</td>
                                    <td>+8</td>
                                    <td>+10</td>
                                    <td>+3</td>
                                    <td>+4</td>
                                    <td>+3</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <h4 class="table-tit">직종별 아너 소사이어티 현황</h4>
                <div class="img-wrap mgb-s">
                    <img src="/common/img/contents/graph_honer3.png" alt="">
                </div>
                <div class="tb-type_b cckgrop03-tbl2">
                    <table>
                        <caption>직종별 아너 소사이어티 현황 정보</caption>
                        <thead>
                            <tr>
                                <th scope="col">직종</th>
                                <th scope="col">인원수</th>
                                <th scope="col">비율(%)</th>
                                <th scope="col">비고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">기업인</th>
                                <td>1,040</td>
                                <td>47.4%</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th scope="row">전문직</th>
                                <td>307</td>
                                <td>14.0%</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th scope="row">자영업자</th>
                                <td>146</td>
                                <td>6.7%</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th scope="row">법인/단체 임원</th>
                                <td>66</td>
                                <td>3.0%</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th scope="row">공무원</th>
                                <td>35</td>
                                <td>1.6%</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th scope="row">스포츠인</th>
                                <td>21</td>
                                <td>1.0%</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th scope="row">방송/연예인</th>
                                <td>22</td>
                                <td>1.0%</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th scope="row">기타(익명포함)</th>
                                <td>556</td>
                                <td>25.3%</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <th scope="row">계</th>
                                <td>2,193</td>
                                <td>100%</td>
                                <td>-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
            <!--  E : 현황 -->
            <!--  S : 참여안내-->
            <div class="page-box" id="pnl3">

                <div class="area-type-b">

                    <div class="list-tbl">
                        <dl class="n1">
                            <dt>기부<b>Giving</b></dt>
                            <dd>
                                <ul class="bul-dot">
                                    <li>1억원 이상 기부 또는 약정(5년)하시면 됩니다. </li>
                                    <li>정회원 : 일시 또는 누적으로 1억원 이상의 기부금을 완납한 개인 기부자 </li>
                                    <li>약정회원 : 5년 이내에 1억원 이상을 납부하시기로 하고 약정한 개인 기부자<br>(최초 가입금액 300만원이상, 매년 일정비율 20%로 기부) </li>
                                    <li>특별회원 : 가족 및 제3자가 1억원 이상을 기부하고 그 가족 및 제3자가 대표자를 아너 소사이어티 회원으로 추대한 기부자</li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="n2">
                            <dt>봉사<b>Volunteering</b></dt>
                            <dd>
                                <ul class="bul-dot">
                                    <li>복지현장을 직접 방문하여 봉사활동을 수행합니다.</li>
                                    <li>정기적인 아너소사이어티 모임봉사 외에도 개인봉사, 가족봉사를 원할 시 별도로 요청하실 수 있습니다. </li>
                                    <li>언론, 인터뷰 및 기고, 토론회 및 세미나 참석과 같은 적극적인 대외활동을 통해 나눔문화 확산을 위한 회원역할을 수행합니다.<br>나눔문화를 확산시키는 활동 역시 중요한 봉사입니다.</li>
                                </ul>
                            </dd>
                        </dl>
                        <dl class="n3">
                            <dt>만남 및 교류<b>Networking</b></dt>
                            <dd>
                                <ul class="bul-dot">
                                    <li>연 1회 회원의 날을 통해 회원간의 화합을 도모하고, 모임의 경과보고 사업보고를 받으실 수 있습니다. </li>
                                    <li>회원의 날은 매년 1회 진행되며, 지역상황에 따라 지역별 회원의 날이 열립니다. </li>
                                    <li>정부 및 주요 공공기간의 초청행사, 사랑의 열매 행사에 VIP 자격으로 초청되십니다.</li>
                                </ul>
                            </dd>
                        </dl>

                    </div>

                </div>


                <h4 class="table-tit">가입절차</h4>
                <div class="list-boxstep">
                    <div class="list-boxstep-item">
                        <h5 class="list-boxstep-tit"><b>01</b><span>가입 상담 및 결정</span></h5>
                        <div class="list-boxstep-cont">
                            <div>아너 소사이어티 가입상담을 원하실 경우,<br>
                            아너 소사이어티 기부 전담 직원이 직접 방문 드리거나<br>
                            전화, 이메일, 우편 등을 통해 다양한 안내를 받으실 수 있습니다.</div>
                            <div>상담 / 문의<br>아너 소사이어티 사무국 서울시 중구 세종대로21길 39 (정동, 사랑의열매회관)</div>
                            <div>
                                <span>02-6262-3092</span>
                                <span>honorachest.or.kr</span>
                            </div>
                            <div><a href="www.honorsociety.or.kr" target="_blank" title="새 창 열림">www.honorsociety.or.kr</a></div>
                        </div>
                    </div>
                    <div class="list-boxstep-item">
                        <h5 class="list-boxstep-tit"><b>02</b><span>회원 가입 기준 및 방식</span></h5>
                        <div class="list-boxstep-cont">
                            <div>회원가입 절차 및 기부방식
                                <ul class="bul-hyphen">
                                    <li>아너 소사이어티 회원 가입서 작성</li>
                                    <li>고액기부자 기탁 전용 계좌로 기부금 송금</li>
                                </ul>
                            </div>
                            <div>아너 소사이어티는 중앙화를 비롯하여 17개 시도별로 지역<br>
                            아너 소사이어티를 운영하고있습니다.</div>
                            <div>회원가입 절차 및 기부방식
                                <ul class="bul-hyphen">
                                    <li>거주지역 (또는 희망지역)을 기준으로 지역 아너 소사이어티 회원이 되시며,</li>
                                    <li>해당 지역에서 서비스를 제공받게 됩니다.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="list-boxstep-item">
                        <h5 class="list-boxstep-tit"><b>03</b><span>회원가입식</span></h5>
                        <div class="list-boxstep-cont">
                            <div><p class="bul-hyphen">기부자님의 일정에 따라 본회 책임자 (사무총장 또는 지역사무처장)와 가입식을 진행합니다.</p></div>
                            <div><p class="bul-hyphen">기부자님과 관계자 (가족 또는 회사직원) 께서 함께 배석하실수 있습니다.</p></div>
                            <div><p class="bul-hyphen">가입식은 각 시도 지역사무국에서 진행되며, 중앙회 또는 서울지회 관리 회원의 경우 서울 중구 정도 소재 사랑의열매 회관에서 진행됩니다. </p></div>
                            <div><p class="bul-hyphen">가입식을 희망하지 않으시면 생략하실 수 있습니다.</p></div>
                        </div>
                    </div>
                    <div class="list-boxstep-item">
                        <h5 class="list-boxstep-tit"><b>04</b><span>소득공제 및 기부금 영수증</span></h5>
                        <div class="list-boxstep-cont">
                            <div><p class="bul-hyphen">기부금은 소득세법 제34조 제2항 1호에 의거 법정기부금으로 인정되어, <br>소득금액의 100% 한도로 공제 받을 수 있으며, <br> 세액공제율 15% (1천만원 초과분은 30%) 가 적용됩니다. </p></div>
                            <div><p class="bul-hyphen">기부금 영수증은 기부 즉시 발행하여 송부해 드릴 수 있습니다.<br>(국세청 연말소득공제 전산시스템과 기부 내역이 연동되어 있습니다.)</p></div>
                        </div>
                    </div>
                </div>

                <h4 class="table-tit">참여안내</h4>
                <p class="txt-basic-a">
                    서울특별시 중구 세종대로 21길 39 사랑의열매 회관 (중구, 정동) <br>
                    <b class="hue-p">아너 소사이어티 사무국 02-6262-3092</b>
                </p>

<!--                 <div style="width: 100%;background: #fef2f2;height: 300px; margin-top:20px"> -->
<!--                         지회별담당자 연락처 컨텐츠 필요 -->
<!--                 </div> -->
                
                <div class="donation-tit-area">
                    <h4 class="table-tit">지회별 담당자</h4>
<!--                     <div class="ui-select"> -->
<!--                         <select class="sel_type"> -->
<!--                             <option selected="selected">서울 사랑의열매</option> -->
<!--                             <option>중앙회</option> -->
<!--                             <option>강원 사랑의열매</option> -->
<!--                             <option>충북 사랑의열매</option> -->
<!--                             <option>부산 사랑의열매</option> -->
<!--                             <option>충남 사랑의열매</option> -->
<!--                         </select> -->
<!--                     </div> -->
                </div>
                <div class="donation-article type3">
                    <div class="fake-table-box">
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">중앙회</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>02-6262-3092</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:kimbj@chest.or.kr" target="_blank" class="link-mail">kimbj@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">강원 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>033-243-1664</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:ssh8974@chest.or.kr" target="_blank" class="link-mail">skpark2009@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">서울 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>02-6053-0167</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:cjw2009@chest.or.kr" target="_blank" class="link-mail">cjw2009@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">충북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>043-238-8026</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:staryeny@chest.or.kr" target="_blank" class="link-mail">staryeny@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">부산 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>051-790-1477</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:internations@chest.or.kr" target="_blank" class="link-mail">internations@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">충남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-8897-0511</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:guns@chest.or.kr" target="_blank" class="link-mail">guns@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">대구 사랑의 열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>053-667-1004</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:chanhee33@chest.or.kr" target="_blank" class="link-mail">chanhee33@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">전북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>063-903-0635</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:sumisumi@chest.or.kr" target="_blank" class="link-mail">sumisumi@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">인천 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>032-456-3313</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:skekt101@chest.or.kr" target="_blank" class="link-mail">skekt101@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">전남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>061-902-6812</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:kbm@chest.or.kr" target="_blank" class="link-mail">kbm@chest.or.kr</a></p>
                            </dd>
                        </dl>

                        <dl class="fake-table-item">
                            <dt class="fake-table-th">광주 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>062-222-3562</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:skw@chest.or.kr" target="_blank" class="link-mail">skw@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">경북 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>053-980-7812</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:jmas@chest.or.kr" target="_blank" class="link-mail">jmas@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">대전 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>042-347-5715</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:powersw@chest.or.kr" target="_blank" class="link-mail">powersw@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">경남 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>055-270-6710</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:smroom@chest.or.kr" target="_blank" class="link-mail">smroom@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">울산 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>052-270-9010</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:n79won@chest.or.kr" target="_blank" class="link-mail">n79won@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">제주 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>064-759-9020</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:naouri@chest.or.kr" target="_blank" class="link-mail">naouri@chest.or.kr</a></p>
                            </dd>
                        </dl>
                        <dl class="fake-table-item">
                            <dt class="fake-table-th">경기 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>031-220-7952</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:hory0612@chest.or.kr" target="_blank" class="link-mail">hory0612@chest.or.kr</a></p>
                            </dd>
                            <dt class="fake-table-th">세종 사랑의열매</dt>
                            <dd class="fake-table-td">
                                <p><i class="sprite-group-tel"></i>070-4269-0567</p>
                                <p><i class="sprite-group-mail"></i><a href="mailto:cnmik@chest.or.kr" target="_blank" class="link-mail">cnmik@chest.or.kr</a></p>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="btn-area">
                    <button type="button" class="btn-base-imp"  id="btnRegist">기부자 상담신청 하기</button>
                </div>

            </div>
            <!--  E : 참여안내 -->
            <!--  S : 회원소개-->

            <div class="seo-box cckgrop04" id ="pnl4">
                <div class="gallery-list type-person">
                    <div class="gallery-list-tit" >
                        
                        <div class="gallery-list-tit-wrap">
                            <strong>전체</strong>
                            <p>※ 회원 명단은 수시로 업데이트 되고 있으며, 실명회원에 한하여 소개하고 있습니다.</p>
                        </div>
                        
                    </div>
                    <ul id="dataGridList"></ul>
                </div>

                <!-- Page Navigation Area Start -->
                <div id="dataGridPageNavi" class="paging-area"></div>
                <!-- // Page Navigation Area -->

                <div class="bbs-search">
                    <div class="search-area" id="searchArea">
                        <input type="hidden" id="pageCount" name="pageCount" value="12">
                        <div class="search-col int">
                            <input type="text" class="inp-base ui-inpcancel" id="pHonorNm" name="pHonorNm" value="${paramMap.pHonorNm }" title="검색어 입력">
                        </div>
                        <div class="search-col btns"><button type="button" class="btn-base-imp" id="btnSearch">검색</button></div>
                    </div>
                </div>

            </div>


            <!--  E : 회원소개 -->
        </div>
    </div>
</main>



