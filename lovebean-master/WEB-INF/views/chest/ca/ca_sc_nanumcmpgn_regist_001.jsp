<!--
 ************************************************************************************************ 
 * System Name : 사랑의 열매 사용자 System / ChestFront
 * MENU        : [상단메뉴] 캠페인 > 나눔캠페인 > 나눔문화캠페인
 * Author      : 
 * Description : 
 *************************************************************************************************
-->

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../../include/ghead.jsp"%>

<script type="text/javascript">

var url = "/ca/sc";

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){

        goTabDisplay((${tabMapYn}?1:0));
        
        $("#tiktok__campaign--vote").hide();
        $("#tiktok__vote--end").hide();

        // Swiper: Slider
        new Swiper('.swiper-container', {
            autoplay: {
                    delay: 1000,
            },
            loop: true,
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            slidesPerView: 4,
            paginationClickable: true,
            spaceBetween: 20,
            breakpoints: {
                1920: {
                    slidesPerView: 4,
                    spaceBetween: 20
                },
                1028: {
                    slidesPerView: 3,
                    spaceBetween: 20
                },
                700: {
                    slidesPerView: 2,
                    spaceBetween: 30
                },
                600: {
                    slidesPerView: 1,
                    spaceBetween: 30
                },
                480: {
                    slidesPerView: 1,
                    spaceBetween: 10
                }
            }
        });
    });
    
    /*===========================================================
     * 코로나19 지원현황  보기 버튼 클릭시 Function !!
     *===========================================================*/
    $(document).on("click", "#btnMore, #btnInsert, #btn_vote, #btn_h_vote", function(e){
    	e.preventDefault();
    	var id = $(this).attr("id");
        if( id == "btnMore") {
        	gf_submitMovePage("<c:url value='/ca/speclmys/initCovid.do' />", "" );
        }
        
        if( id == "btnInsert") {
        	if( !validator() ) return;
        	if( confirm("투표 하시겠습니까?") ) {
        		// 인증하기
        		window.name='mainPopup';
            	fnPopup();
        		//setTestData();
        	}
        }
        
        if( id == "btn_vote") {
       		$('#tiktok__campaign--vote .tictok__images li').shuffle();
            $("#tiktok__campaign--vote").toggle();
        }
        
        if( id == "btn_h_vote") {
        	facebookSharePost();
        }

    });
    
    function insertAfter(data) {
    	var result = data.result;
    	if( result.indexOf("success_") == 0 ) {
    		$(".campaign__vote").hide();
            $("#tiktok__vote--end").show();
    	} else {
    		alert( data.result );
    		return;
    	}
    }

    function goTabDisplay(obj){
        // 초기화
        $(".ui-tab-pnl").attr({'aria-hidden':'true'}) ;
        $(".ui-tab-btn").attr('class','ui-tab-btn');

        $("#btn" + obj ).attr('class','ui-tab-btn selected');
        $("#pnl"+ obj +".ui-tab-pnl").attr({'aria-hidden':'false'}) ;
    }

    function facebookSharePost(){
        var url     = "https://www.chest.or.kr/ca/sc/initNanumcmpgn.do";
        var title   = "사랑의열매 슈퍼스타챌린지 최우수 뽑고 아메리카노 받자!";
        var encodeUrl = encodeURIComponent(url);
        var encodeTitle = encodeURIComponent( title );
        var link = urlParameterReplace('https://www.facebook.com/sharer/sharer.php?u={0}&t={1}', encodeUrl, encodeTitle );
        window.open( link, 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600' );
        return false;
   }
    
    function validator() {

    	if( $('input[name="cnNum"]:checked').length == 0 ) {
    		alert("최우수작 1개 선택해주세요!");
    		return false;
    	}    	
    	if(!$("#agreAt1Chk").is(':checked')){
    		alert("개인정보 수집 및 이용에 동의해 주시길 바랍니다.");
    		$("#agreAt1Chk").focus();
    		return false;
    	}
    	/* if(!$("#agreAt2Chk").is(':checked')){
    		alert("개인정보 제3자 제공에 동의해 주시길 바랍니다.");
    		$("#agreAt2Chk").focus();
    		return false;
    	} */
    	return true;
    }
    
    function success( obj ) {
    	var sname = obj.sName;
    	var mobileNo = obj.sMobileNo;
    	var result = obj.result;
    	var a,b,c,m = mobileNo;
    	var birth = obj.sBirthDate;

    	if( m.length > 0 ) {
	    	if( m.length > 10 ) {
	    		a=m.substring(0,3);
	    		b=m.substring(3,7);
	    		c=m.substring(7);
	    	} else {
	    		a=m.substring(0,3);
	    		b=m.substring(3,6);
	    		c=m.substring(6);
	    	}
    	}
    	$("#nm").val(sname);
    	$("#mbtlnum").val(a+b+c);
    	
    	// 투표하기 전송
    	makeFormData();    	
    }

    function fail() {
    	alert("본인인증이 실패하였습니다.");
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
</script>

	<div class="sub-visual visual00_04">
	    <div class="sub-title-area">
            <h2 class="heading-title-a">나눔캠페인</h2>
            <p class="title-sub-txt">나눔문화 활성화를 위한 다양한 캠페인을 진행합니다.</p>
        </div>
    </div>

    <%@ include file="../../layout/breadcrumbs.jsp"%>
    <main class="base-main" id="baseMain">
            <div class="contents-area">
                <div class="contents-hd">
                    <h3><strong>나눔문화캠페인</strong><span>대한민국 나눔문화 정착을 위해 다양한 시도를 하고 있습니다 </span></h3>
                        <div class="contents-menu-nav">
                            <button type="button" class="next-menu">소다수 나눔 캠페인 </button>
                        </div>
                </div>

				<form id="frm" name="frm" method="post" enctype="multipart/form-data" />
				<input type=hidden name="mbtlnum" 		id="mbtlnum" />							<!-- 휴대폰번호 -->
				<input type=hidden name="nm" 			id="nm" />								<!-- 이름 -->	
				<input type=hidden name="cn" 			id="cn" />								<!-- 투표번호 -->				
				<input type=hidden name="iemCode1" 		id="iemCode1" />						<!-- 동의코드(1) -->
				<input type=hidden name="iemCode2" 		id="iemCode2" />						<!-- 동의코드(2) -->
				<input type=hidden name="reqregCode" 	id="reqregCode" />						<!-- 공통코드 HP0046 -->	
				
				
                <div class="seo-box">
                    <div class="ui-tab ui-tab-type2 col-2 contents-tab" id="uiTabCCKI12_1">
                       <div class="ui-tab-btns" btn-id="uiTabCCKI12_1">
                            <button type="button" class="ui-tab-btn" id ="btn0" onclick="javascript:goTabDisplay(0);"><i>우수작 투표하기</i></button>
                            <button type="button" class="ui-tab-btn" id ="btn1" onclick="javascript:goTabDisplay(1);"><i>슈퍼스타챌린지란?</i></button>
                        </div>
                        <div class="ui-tab-pnls" pnl-id="uiTabCCKI12_1">
                        
                        <!-- S : 우수작 투표하기 -->
                                <section class="ui-tab-pnl" id="pnl0">
                                    <h1 class="hide">우수작 투표하기 </h1>
                                    <div class="tab-contents">
                                    
                                        <!-- hero영역 -->
                                        <div class="tiktok__hero2"></div>
                                        <!-- //hero영역 -->
                                        <div class="tiktok__description tiktok__mobile">
                                        	<div class="web__description">
	                                            <h4>참여한 작품 중 자체 심사를 통해 28개의 우수작을 선정하였습니다.</h4>
	                                            <p>그 중 상위 4개의 작품을 골라, 대국민 투표를 통해 “최우수작”을 선정하고자 합니다.</p>
                                            </div>
                                            <p class="yellow_bold">여러분의 원픽! 최우수작에 투표해주세요!</p>
                                            <p>최우수작(1명)에는 LG그램을 비롯해, 코로나19로 힘든 소상공인·사회적 기업을 돕고자 마련한 식사권 등을
                                               	 증정합니다!</p>
                                        </div>
                                        <!-- 영상리스트(슬라이드) -->
                                        <div class="tiktok__slider">
                                            <div class="container">
                                                <!-- Slider main container -->
                                                <div class="swiper-container">
                                                    <!-- Additional required wrapper -->
                                                    <div class="swiper-wrapper">
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img1@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img2@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img3@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img4@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img5@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img6@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img7@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img8@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img9@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img10@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img11@2x.png">
                                                        </div>
                                                        <div class="swiper-slide"><img
                                                                src="/common/img/contents/tiktok/tiktok_top_img12@2x.png">
                                                        </div>
                                                    </div>
                                                    <!-- If we need navigation buttons -->
                                                    <div class="swiper-button-prev"></div>
                                                    <div class="swiper-button-next"></div>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- //영상리스트(슬라이드) -->

                                        <div class="tiktok__end--description">
                                            <div>
                                                <h2>#슈퍼스타챌린지 최우수작<br>
                                                    대국민 투표가 마감되었습니다!
                                                </h2>
                                                <p>최다 득표로 선정된 최우수작을 공개합니다!
                                                </p>
                                                <p> 선정된 작품은 코로나19를 이길 수 있는
                                                    큰 힘이 되었습니다.
                                                </p>
                                            </div>
                                        </div>

                                        <div class="tiktok__end--winner">
                                            <div>
                                                <img src="../../common/img/contents/tiktok/tiktiok_win.png" />
                                                <h2>김관제<br><span>(의정부시청소년상담복지센터)</span></h2>
                                            </div>
                                            <video controls autoplay="" muted="" loop="" preload="auto">
                                                <source src="https://upload.chest.or.kr/video/tiktok/tiktok_mp3_v3.MP4"
                                                    type="video/mp4">
                                              </video>
                                        </div>

                                        <!-- 영상리스트(리스트) -->
                                        <div class="tiktok__lists">
                                            <h2>다른 우수작보기</h2>
                                            <div class="tiktok__list--items">
                                                <ul>
                                                    <li>
                                                        <ul>
                                                        	<li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img25@2x.png">
                                                            </li>
                                                        	<li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img26@2x.png">
                                                            </li>
                                                        	<li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img27@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img1@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img2@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img3@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img4@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img5@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img6@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img7@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img8@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img9@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img10@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img11@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img12@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img13@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img14@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img15@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img16@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img17@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img18@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img19@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img20@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img21@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img22@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img23@2x.png">
                                                            </li>
                                                            <li>
                                                                <img
                                                                    src="/common/img/contents/tiktok/tiktok_bottom_img24@2x.png">
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- //영상리스트(리스트) -->
                                        
                                        <div class="tiktok__end--thanks">
                                            <img src="../../common/img/contents/tiktok/tiktok_txt_thanks.png" />
                                            <img src="../../common/img/contents/tiktok/tiktok_txt_thanks_1.png" />
                                            <p>여러분들이 있기에, 우리는 코로나19를극복하고 소소한 일상을<br />다시 되찾을 수 있습니다.</p>
                                            <p>앞으로도 사랑의열매는 여러분들과 함께하겠습니다.</p>
                                        </div>
                                    </div>
                                </section>
                                <!-- E : 우수작 투표하기 -->
                            <!-- S : 슈퍼스타챌린지지란? -->
                            <section class="ui-tab-pnl" id ="pnl1" >
                                <div class="tab-contents">
                                
                                    <h1 class="hide">슈퍼스타챌린지지란?</h1>
                                    <div class="tab-contents camp10">

                                        <!-- 슈퍼스타챌린지(contents) -->
                                        <div class="super_wrap">
                                            <div class="super_title">
                                                <p>괜찮아~ 잘될거야~♬<br>슈퍼스타 음원에 자신의 개성을 담아 업로드 해주세요! </p>
                                            </div>
                                            <div class="super_sub1_contents">
                                                <div class="box C_logo">
                                                        <a href="#sH">참여방법</a>
                                                        <img src="/common/img/contents/tiktok/super_C_logo.png" alt="열매둥이캐릭터"/>
                                                </div>
                                                <div class="box box1">
                                                    <video width="100%" height="100%"  autoplay muted loop  playsinline>
                                                        <source src="https://upload.chest.or.kr/video/tiktok/Ssin_05.mp4" type="video/mp4" />
                                                    </video>
                                                </div>
                                                <div class="box box2">
                                                    <video width="100%" height="100%" autoplay muted loop  playsinline>
                                                        <source src="https://upload.chest.or.kr/video/tiktok/Park_05.mp4" type="video/mp4" />
                                                    </video>
                                                </div>
                                                <div class="box box3">
                                                    <video width="100%" height="100%"  autoplay muted loop playsinline>
                                                        <source src="https://upload.chest.or.kr/video/tiktok/Crying_05.mp4" type="video/mp4" />
                                                    </video>
                                                </div>
                                            </div>
                                            <div class="super_sub2_w">
                                                <div>
                                                    <div class="title">코로나19 극복을 위한 응원 캠페인</div>
                                                    <div class="sub-title">
                                                       <img src="/common/img/contents/tiktok/super_title_2.png" alt="슈퍼스타챌린지로고"/>
                                                       <p style="color:#6A4E0C;">방-방 프로젝트의 슈퍼스타와 함께한<br>코로나19 극복 응원영상을 SNS에 올려주세요!</p>
                                                       <p><span style="background-color:#388C73; color:#fff; border-radius:30px; padding:0px 14px;">참여기간</span> 2020.05.19(화요일) ~ 07.12(일요일)</p>
                                                    </div>
                                                    <div class="super_yutube">
                                                        <div class="super_yutube_l">
                                                        
                                                        <video controls  autoplay muted  loop  preload="metadata" playsinline>
                                                            <source src="https://upload.chest.or.kr/video/tiktok/superStar_200624.mp4" type="video/mp4" >
                                                        </video>
                                                        <img src="/common/img/contents/tiktok/S_youtubu_a.png" alt="#">
                                                        </div>
                                                        <p>슈퍼스타챌린지는, 코로나19로 인해 어려움을 겪고 있는 
                                                        우리 이웃들을 응원하는 사랑의열매의 챌린지입니다.
                                                        방방프로젝트의 “슈퍼스타” 음원에 맞춰 코로나19를 이기는 나만의 방법을 SNS에 올려주세요!<br>
                                                        틱톡을 활용하시면 보다 쉽고 간편하게 영상을 제작할 수 있습니다!<br>우수작은 소정의 상품을 드립니다.
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="super_C_h" id="sH">
                                                     <div class="title ">틱톡으로 쉽게 참여하는 방법</div>
                                                     <img src="/common/img/contents/tiktok/super_howTo.png" alt="참여기간(2020년05월19일 화요일부터 06월30일 화요일까지) 1단계(틱톡 접속)  2단계(슈퍼스타챌린지 해쉬태그 검색 후 클릭)
                                                     3단계(스마일 스티커 3가지 중 1 선택) 4단계(슈퍼스타음원 사운드 선택) 5단계(음악에 맞춰 자유롭게 촬영 후, #슈퍼스타챌린지 #괜찮아잘될거야 #힘내라대한민국 #사랑의열매 #smilewithtiktok 해시태그와 함께 업로드)"/>
                                                     <!-- <p class="S_text">※ 5/31일까지 #smilewithTikTok 해시태그 추가시<br> 틱톡에서
                                                        기부금이 매칭되어 더 많은 분들에게 도움이 됩니다</p> -->    
                                                </div>
                                                <div class="S_appD">
                                                    <h4>지금 다운로드</h4>
                                                	<p><a href="https://www.tiktok.com/download-link/af/id1235601864" target="_blank" rel="nofollow"><img src="/common/img/contents/tiktok/AppStore.png" alt="애플스토어에서 틱톡앱 다운로드"/></a></p>
                                                	<p><a href="https://www.tiktok.com/download-link/af/com.ss.android.ugc.trill" target="_blank" rel="nofollow"><img src="/common/img/contents/tiktok/GooglePlay.png" alt="구글앱스토어에서 틱톡앱 다운로드"/></a></p>
                                                </div>
                                                <div class="super_C_h">
                                                    <div class="title">슈퍼스타 챌린지 우수작 선정</div>
                                                    <img src="/common/img/contents/tiktok/super_gift.png" alt="슈퍼스타 챌린지에 관심을 가지고 참여해주신 분들께는 감사의 의미로 
                                                    6월 30일까지 등록된 게시물을 대상으로 공정한 심사를 통해 사랑의열매에서 상품을 드립니다. 선정방식(1차 : 자체심사 2차 : 국민참여 투표
                                                    (투표 참여자에게도 추첨을 통해기프티콘을 드립니다)  상품(최우수상(1명)  :  갤럭시S20+식사권(10만원상당) 
                                                    +비영리 사회적기업 건강식품 , 우수상(5명)  :  식사권(10만원상당) + 비영리 사회적기업 건강식품, 장려상(10명)  :  비영리 사회적기업 건강식)"/>
                                                </div>
                                                <div style="max-width:90%;">
                                                    <div class="title">사랑의열매 코로나19 지원현황 </div>
                                                    <div class="sub-title">
                                                       <p >우리가 함께라면 이겨낼 수 있습니다.<br/>
														사랑의열매가 여러분과 함께 코로나19 극복에 앞장서겠습니다.
														사랑의열매는 전국 3,100여개 배분협력기관을 통해 
														9,152개 사업에 총 1,129억 원을 지원하고 있습니다. </p>
                                                    </div>
                                                    <video width="70%" controls  autoplay muted  loop  preload="metadata" playsinline>
                                                            <source src="https://upload.chest.or.kr/video/tiktok/covid__motion.mp4" type="video/mp4" max-width:50%; >
                                                    </video>
                                                 </div>
                                                <!--<p style="padding-bottom:40px;">슈퍼스타 챌린지 참여영상 보러가기</p>-->                                 
                                            </div>
                                        </div>
                                        
                                        <div class="btn-area">
                                            <button type="button" class="btn-base-imp" id="btnMore">사랑의열매 코로나19 지원현황 보기</button>
                                        </div>
                                       <!--  <div>
                                            <a href="javascript:;" onclick="javascript:facebookSharePost();"><img src="/common/img/contents/btn_fb.png" alt="페이스북" title="새 창 열림"></a>
                                        </div> -->

                                        <!--// 슈퍼스타챌린지(contents) -->


                                    </div>
                                </div>
                            </section>
                            <!-- E : 슈퍼스타챌린지-->
                           
                        </div>
                    </div>
                </div>
            </div>
             <script>
		        (function ($, win, doc, undefined) {
		            $(doc).ready(function () {
		
		                $.fn.shuffle = function () {
		                    var $this = this;
		                    // element to hold the place of an element as it
		                    // is swapped with another
		                    var $placeholder = $('<li>');
		
		                    return this.each(function () {
		                        // current element
		                        var $element = $(this);
		                        // pick a random element to swap with
		                        var $swap = $this.eq(Math.floor(Math.random() * $this.length));
		                        // stick the placeholder immediately before the element
		                        $element.before($placeholder);
		                        // stick the element immediately before the swap
		                        $swap.before($element);
		                        // stick the swap immediately after the placeholder
		                        // and remove placeholder from dom
		                        $placeholder.after($swap).remove();
		                    });
		                };
								
		            });
		        })(jQuery, window, document);
		        
		        function makeFormData() {
		        	$("#reqregCode").val("2020001");
		        	$("#cn").val($(':radio[name="cnNum"]:checked').val());
		        	// 개인정보 수집 
		        	if($("#agreAt1Chk").is(":checked")) {
		        		$("#iemCode1").val("01");
		        		$("#agreAt1").val("Y");
		        	}
		        	// 개인정보 제공
		        	/* if($("#agreAt2Chk").is(":checked")) {
		        		$("#iemCode2").val("02");
		        		$("#agreAt2").val("Y");
		        	} */
		        	
		        	gf_sendForm("frm", url+"/insert.do");
		        }
		        

		        
		        		        
    </script>
        </main>
