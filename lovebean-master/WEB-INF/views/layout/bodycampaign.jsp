<%--
 * ************************************************************************************************
 * System Name : 사랑의 열매 사용자 System
 * Class Name  : body.jsp
 * Author      : Chest Front
 * Date        : 2019. 8. 1.
 * Description : [ Layout ] body Page
 *
 * History     :
 * ************************************************************************************************
 * No.     Date           Name             Description
 * ************************************************************************************************
 * CH_OO   2019. 8. 1.    Chest Admin      Initial Release
 * CH_01
 *************************************************************************************************
--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="../include/ghead.jsp"%>

<!--  -->
<script type="text/javascript">


    //var swiper,swiper2,swiper3,swiper4,timer;

    var swiper,timer;
    var CUR_WINDOW_WIDTH = $( window ).width(); // 현재 window Width
    var MAX_DEVICE_WIDTH = 1024; // max-device-width: 1024px
    

    var calByte = {
            getByteLength : function(s) {
                if (s == null || s.length == 0) {
                    return 0;
                }
                var size = 0;
                for ( var i = 0; i < s.length; i++) {
                    size += this.charByteSize(s.charAt(i));
                }
                return size;
            },

            cutByteLength : function(s, len) {

                if (s == null || s.length == 0) {
                    return 0;
                }
                var size = 0;
                var rIndex = s.length;
                for ( var i = 0; i < s.length; i++) {
                    size += this.charByteSize(s.charAt(i));
                    if( size == len ) {
                        rIndex = i + 1;
                        break;
                    } else if( size > len ) {
                        rIndex = i;
                        break;
                    }
                }
                return s.substring(0, rIndex);
            },

            charByteSize : function(ch) {
                if (ch == null || ch.length == 0) {
                    return 0;
                }
                var charCode = ch.charCodeAt(0);
                if (charCode <= 0x00007F) {
                    return 1;
                } else if (charCode <= 0x0007FF) {
                    return 2;
                } else if (charCode <= 0x00FFFF) {
                    return 3;
                } else {
                    return 4;
                }
            }
        };

//     var _initCtrl = function() {

        //나눔과 변화의스토리
//         $("#mainBn1_more").click(function(){
//             var param = "?pBhfCode=${__branchCd}";
//             gf_submitMovePage("<c:url value='/bbs/1009/initPostList.do' />", param);
//         });

        //내가만드는따뜻한세상
//         $("#mainBn2_more").click(function(){
//             var param = "?pBhfCode=${__branchCd}";
//             gf_submitMovePage("<c:url value='/ca/crwdfund/P/initCrwdfund.do' />", param);
//         });

//     };

    


    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
//      swipeGroup();
        selectBanrList();
        selectBhfBanrList();
        selectMainBbsList();
//         _initCtrl();
        $(window).on('resize', function(){
            clearTimeout(timer);
            timer = setTimeout(function(){
                CUR_WINDOW_WIDTH = $(window).width();
                selectBanrList(); // 모바일,PC전환 감지
                selectBhfBanrList(); // 모바일,PC전환 감지
//                 swiper2.update();
//                 swiper3.update();
//                 swiper4.update();
            },200)
        });
        
    	    
		//레이아웃변경_2008//
        // main right 탭메뉴
        $('ul.left li').click(function () {
            var tab_id = $(this).attr('data-tab');
            $('ul.left li').removeClass('active');
            $('.aside_notice').removeClass('active');
            $(this).addClass('active');
            $("#" + tab_id).addClass('active');
        })
		
        
        //quick_menu toggle
        $(".quick_nav .btn_close").click(function() {
        $(".quick_nav").toggleClass("quick_nav-close");
        });
		
		//footer_zindex
        var footer = document.querySelectorAll('#baseFooter');
        $(footer).css('z-index', '-1');
        
        
		//progress_overflow
        var progress = document.querySelectorAll('.cause-card__progress span');
        for( var i = 0; i < progress.length; i++ ){ 
       	var item = progress.item(i).style.width.replace(/[^0-9]/g, "");
       	if(item >= 100){
           	$(progress.item(i)).addClass('importantRule')
       	}else{
       		item = item;
       	}
        }
    });
    
    
	//quick_nav(mobile)
     function actionToggle() {
         var action = document.querySelector('.quick_action');
         action.classList.toggle('quick_active')
     }
 
    /*===========================================================
     * Facebook Feed Loading !!
     * 토근발급일 : 20200330
     *===========================================================*/
     
    window.fbAsyncInit = function() {
        FB.init({
            appId            : '215045561926097', // 처음 앱 생성시 받았던 앱 ID
            autoLogAppEvents : true,
            xfbml            : true,
            version          : 'v6.0' // 그래프 API 탐색기 페이지의 버전과 맞추면 됨. 190904 기준 v4.0
        });

        FB.api('124406917631853/feed?fields=created_time,full_picture,message,permalink_url&limit=6', {
            access_token : 'EAADDlTJUQdEBAGDoLubLmZAME6m8ZBgdZAn5olpRwHefnr1zungpxvEYbsMfuxpZCsDqzP90OZCAL2vCmMLP05s5TCXPZAL49FP3Akr600roSjOcVxZCkuHNWszf8s31OcZCZBow2mIU3m9ZCZCEtuyHsX5vaCPNjrW5TYnfZCOYMFGYVZC1dw92kC0v2'
        }, function(response){
            var fbList = "";
            for (var i=0; i<response.data.length; i++) {
            	fbList += '        <a href="' + response.data[i].permalink_url + '">';

                if (!gf_isNull(response.data[i].full_picture)) {
                    fbList += '    <img src="' + response.data[i].full_picture + '" alt="">';
                }

                if (!gf_isNull(response.data[i].message)) {
                    fbList += '        <p class="sns_hashtag-txt">' + response.data[i].message + '</p>';
                }
                
                fbList += '    </a>';
            }

            $(".sns_campaign").html(fbList);
            slick.sns_campaign();

        });
    };

    (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    /*************************************************************
     * Ajax Send Event Function !!
     *************************************************************/
    /*===========================================================
     * 메인배너 리스트 조회 !!
     *===========================================================*/
    function selectBanrList(){
        var param = {"pBhfCode" : "${__branchCd}"};

        gf_send("<c:url value='/selectBanrList.do' />", param);
    }
    /*===========================================================
     * 지회메인배너 리스트 조회 !!
     *===========================================================*/
    function selectBhfBanrList(){
        var param = {"pBhfCode" : "${__branchCd}"};

        gf_send("<c:url value='/selectBhfBanrList.do' />", param);
    }

    /*===========================================================
     * 게시판 리스트 조회 (공지사항, 언론보도, 지원안내) !!
     *===========================================================*/
    function selectMainBbsList(){
        var param = {"pBhfCode" : "${__branchCd}"};

        gf_send("<c:url value='/selectMainBbsList.do' />", param);
    }

    /*************************************************************
     * Ajax Send Callback Function !!
     *************************************************************/
    /*===========================================================
     * Banr 리스트 조회 Callback Function !!
     *===========================================================*/
    function selectBanrListAfter(data){
        var listInfo = data.listInfo;
        var listHtml = "";
		var listHtml2 = "";

        for(var i=0; i<listInfo.length; i++){
            listHtml += '<div class="slide">';

            if (listInfo[i].cnncPgeUrl == "" || listInfo[i].cnncPgeUrl == null) {
                listHtml += '    <img src="' + "${genFilePath}"+ listInfo[i].pcFlpth + listInfo[i].pcServerFileNm + '" alt="' + listInfo[i].altText + '">';
            } else {
                if (listInfo[i].newAt == "Y") {
                    listHtml += '<a href="' + listInfo[i].cnncPgeUrl + '" target="_blank">';
                } else {
                    listHtml += '<a href="' + listInfo[i].cnncPgeUrl + '">';
                }

                listHtml += '    <img src="' + "${genFilePath}"+ listInfo[i].pcFlpth + listInfo[i].pcServerFileNm + '" alt="' + listInfo[i].altText + '">';
                listHtml += '</a>'
            }

            listHtml += '</div>';
			
			listHtml2 += '<div class="slide">';
            listHtml2 += '    <img src="' + "${genFilePath}"+ listInfo[i].pcFlpth + listInfo[i].pcServerFileNm + '" alt="' + listInfo[i].altText + '">';
			listHtml2 += '</div>';
        }

        $("#banrList").html(listHtml);
		$("#banrList_bgs").html(listHtml2);		
		
		
		// swiper 재시작
        
        // swiper main(추가_2008)
//         var slider = new Swiper('#mainVs', {
//             //loop:true,
//             autoplay:{
// 			    delay: 3000,
// 			    },
//             spaceBetween: 10,
//             pagination: {
//                 el: '.swiper-pagination',
//                 type: 'fraction',
//                 renderFraction: function (currentClass, totalClass, index, total) {
//                     return '<span class="' + currentClass + '">0' + index + '</span>' +
//                         ' / ' +
//                         '<span class="' + totalClass + '">0' + total + '</span>';
//                 }
//             },
//             navigation: {
//                 nextEl: '.swiper-button-next',
//                 prevEl: '.swiper-button-prev',
//             },
//             slideChange: function (s) {
//                 var x = s.activeIndex;
//             },
//             on: {
//                 slideChangeTransitionStart: function (s) {
//                     //console.log('назад');
//                     console.log(slider.activeIndex);
//                     var currentSlide = $(s.slides[s.activeIndex]);
//                     currentSlide.find('.title').text('1');
//                     TweenMax.to('.swiper-slide .title', 0.2, {
//                         scaleY: 1,
//                         delay: 0.3
//                     });

// 	                   },
// 	               }
// 	           });
     
// 	       	$('.swiper-slide').hover(
//    			function(){
//    				slider.autoplay.stop();
//    			},function(){
//    				slider.autoplay.start();
//    			}
// 	       	);

//         slider.on('slideChangeTransitionStart', function (event) {
//             TweenMax.to('.swiper-slide .title', 0.2, {
//                 scaleY: 1,
//                 delay: 0.3
//             });
//         });
        // swiper main__end(추가2008)
    }
    /*===========================================================
     * 지회 Banr 리스트 조회 Callback Function !!
     *===========================================================*/
    function selectBhfBanrListAfter(data){
        var listInfo = data.listInfo;
        var listHtml = "";
        var sdt = "";
        var edt = "";
		var title = '<strong>'+ $.cookie("__branchNm") + '</strong> 사회복지공동모금회';
		
        for(var i=0; i<listInfo.length; i++){
            
            sdt = listInfo[i].bgndt.substring(0,4) + "." + listInfo[i].bgndt.substring(4,6) + "." +  listInfo[i].bgndt.substring(6,8);
            edt = listInfo[i].enddt.substring(0,4) + "." + listInfo[i].enddt.substring(4,6) + "." +  listInfo[i].enddt.substring(6,8);
			
			listHtml += '<div class="v_notice_contents">';
			listHtml += '	<div>';
			if (listInfo[i].ntceSe == "A") {
				listHtml += '		<strong>공지사항</strong>';
			} else if(listInfo[i].ntceSe == "B") {
				listHtml += '		<strong>지원안내</strong>';
			}	
			listHtml += '		<em>' + sdt + ' ~ ' + edt + '</em>';
			listHtml += '		<h2>' + listInfo[i].titleText + '</h2>';
			listHtml += '		<p>' + listInfo[i].dcText + '</p>';
			listHtml += '	</div>';
			
			if (listInfo[i].cnncPgeUrl == "" || listInfo[i].cnncPgeUrl == null) {
                    listHtml += '<div><img src="' + "${genFilePath}"+ listInfo[i].flpth + listInfo[i].serverFileNm + '" alt="' + listInfo[i].altText + '"></div>';
			} else {
				if (listInfo[i].newAt == "Y") {
					listHtml += '<div><a href="' + listInfo[i].cnncPgeUrl + '" target="_blank">';
				} else {
					listHtml += '<div><a href="' + listInfo[i].cnncPgeUrl + '">';
				}

				listHtml += '<img src="' + "${genFilePath}"+ listInfo[i].flpth + listInfo[i].serverFileNm + '" alt="' + listInfo[i].altText + '">';
				listHtml += '</a></div>'
			}
			
			listHtml += '</div>';
			
        }
		
 		$(".main_v_notice h1").html(title);
        $(".main_v_notice .slider").html(listHtml);
        //slick.main_v_notice();
    }

//     function swipeGroup() {
        //slider

//         swiper2 = new Swiper('#mainBn1', {
//             slidesPerView: 3,
//             spaceBetween: 52,
//             breakpoints: {
//                 480: {
//                     spaceBetween: 8
//                 },
//                 768: {
//                     spaceBetween: 20
//                 }
//             },
//             loop:true,
//             autoHeight:true,
//             navigation: {
//                 nextEl: '#btn-swiper-next2',
//                 prevEl: '#btn-swiper-prev2',
//             }
//         });

//         swiper3 = new Swiper('#mainBn2', {
//             slidesPerView:3,
//             spaceBetween: 52,
//             breakpoints: {
//                 600: {
//                     slidesPerView: 1,
//                     spaceBetween: 8
//                 },
//                 768: {
//                     spaceBetween: 20
//                 }
//             },
//             //loop:true,
//             navigation: {
//                 nextEl: '#btn-swiper-next3',
//                 prevEl: '#btn-swiper-prev3',
//             }
//         });

//         swiper4 = new Swiper('#mainBn3', {
//             slidesPerView: 2,
//             spaceBetween: 25,
//             breakpoints: {
//                 480: {
//                     spaceBetween: 8
//                 },
//                 768: {
//                     spaceBetween: 12
//                 }
//             },
//            // loop:true,
//             navigation: {
//                 nextEl: '#btn-swiper-next4',
//                 prevEl: '#btn-swiper-prev4',
//             }
//         });
//     }

    /*===========================================================
     * 게시판 리스트 조회 Callback Function !!
     *===========================================================*/
    function selectMainBbsListAfter(data) {
        var listNotice = data.listNotice;
        var listMedia = data.listMedia;
        var listSupport = data.listSupport;

        // notice
        var noticeHtml = '';
        for (var i=0; i<listNotice.length; i++) {
            noticeHtml += '<li class="bbs-item">';
            noticeHtml += '    <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-bbs_sn="1000" data-list_sn="' + listNotice[i].listSn + '" class="bbs-link">';
            noticeHtml += '        <div class="bbs-link-col days">';
            noticeHtml += '            <span class="bbs-day">' + listNotice[i].resd + '</span>';
            noticeHtml += '            <span class="bbs-month">' + listNotice[i].resym + '</span>';
            noticeHtml += '        </div>';
            noticeHtml += '        <div class="bbs-link-col">';
            //noticeHtml += '            <span class="bbs-sub-title">' + listNotice[i].cmmnCodeNm + '</span>';
            noticeHtml += '            <span class="bbs-title">' + listNotice[i].sj + '</span>';
            noticeHtml += '        </div>';
            noticeHtml += '    </a>';
            noticeHtml += '</li>';
        }
        $("#noticeList").html(noticeHtml);

        // media
        var mediaHtml = '';
        for (var i=0; i<listMedia.length; i++) {
            mediaHtml += '<li class="bbs-item">';
            mediaHtml += '    <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-bbs_sn="1003" data-list_sn="' + listMedia[i].listSn + '" class="bbs-link">';
            mediaHtml += '        <div class="bbs-link-col days">';
            mediaHtml += '            <span class="bbs-day">' + listMedia[i].resd + '</span>';
            mediaHtml += '            <span class="bbs-month">' + listMedia[i].resym + '</span>';
            mediaHtml += '        </div>';
            mediaHtml += '        <div class="bbs-link-col">';
            mediaHtml += '            <span class="bbs-title">' + listMedia[i].sj + '</span>';
            mediaHtml += '        </div>';
            mediaHtml += '    </a>';
            mediaHtml += '</li>';
        }
        $("#mediaList").html(mediaHtml);

        // support
        var supportHtml = '';
        for (var i=0; i<listSupport.length; i++) {
            supportHtml += '<li class="bbs-item">';
            supportHtml += '    <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-bbs_sn="1004" data-list_sn="' + listSupport[i].listSn + '" class="bbs-link">';
            supportHtml += '        <div class="bbs-link-col days">';
            supportHtml += '            <span class="bbs-day">' + listSupport[i].resd + '</span>';
            supportHtml += '            <span class="bbs-month">' + listSupport[i].resym + '</span>';
            supportHtml += '        </div>';
            supportHtml += '        <div class="bbs-link-col">';
            supportHtml += '            <span class="bbs-title">' + listSupport[i].sj + '</span>';
            supportHtml += '        </div>';
            supportHtml += '    </a>';
            supportHtml += '</li>';
        }
        $("#supportList").html(supportHtml);

        var _html = "";
         if(data.listMain2) {
             for (var i=0; i<data.listMain2.length; i++) {

                 var serverFileNm = data.listMain2[i].serverFileNm;
                 var fileExtsn    = data.listMain2[i].fileExtsn;
                 var flpth        = data.listMain2[i].flpth;
                 var thumbImg     = '';
                 var _title = data.listMain2[i].sj;
                 var thumbFileNm = data.listMain2[i].thumbFileNm;

                 if(!gf_isNull(thumbFileNm)){
                     thumbImg    = flpth + thumbFileNm;
                 }
                 _html += '<div>';
                 _html += '<div class="camp-namum-img">';
                 _html += '    <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-bbs_sn="1009" data-list_sn="' + data.listMain2[i].listSn + '" class="gallery-link">';
                 if(thumbImg != ''){
                     _html += '<img src="${genFilePath}' + thumbImg + '" alt="' + _title + '">';
                 }else{
                     _html += '<img src="/common/img/main/@img.png" alt="" >';
                 }
                 _html += '</a></div><p>'+ calByte.cutByteLength( _title, 130 ) +'</p></div>';
             }
         }
         $("#mainBn1").find(".slider").html(_html);
//         swiper2.update();

        _html = "";
         if(data.listMain3) {
             for (var i=0; i<data.listMain3.length; i++) {
                 var propseSn       = data.listMain3[i].propseSn;
                 var bsnsSj         = data.listMain3[i].bsnsSj;
                 var propseInsttNm  = data.listMain3[i].propseInsttNm;
                 var cntrAmountSum  = !gf_isNull(data.listMain3[i].cntrAmountSum) ? data.listMain3[i].cntrAmountSum : 0;
                 var cntrAmountCnt  = !gf_isNull(data.listMain3[i].cntrAmountCnt) ? data.listMain3[i].cntrAmountCnt : 0;
                 var goalAmount     = !gf_isNull(data.listMain3[i].goalAmount) ? data.listMain3[i].goalAmount : 0;

                 var fundRate       = gf_round((cntrAmountSum / goalAmount) * 100, 0) + '%';

                 var serverFileNm = data.listMain3[i].serverFileNm;
                 var fileExtsn    = data.listMain3[i].fileExtsn;
                 var flpth        = data.listMain3[i].flpth;
                 var thumbImg     = '';
                 var thumbFileNm = data.listMain3[i].thumbFileNm;

                 var ct_form_url = data.listMain3[i].ctFormUrl;
                 var ct_menu_id = data.listMain3[i].ctMenuId;
                 var event_code = data.listMain3[i].eventCode;
                 
                 if(!gf_isNull(thumbFileNm)){
                     thumbImg    = flpth + '/' +thumbFileNm;
                 }
                 _html += '<div>';
                 _html += '<div class="crowd-camp-img">';
                 _html += '  <a href="javascript:;" class="gallery-link" onClick="javascript:goCrwdfundDetail(this);" data-propse_sn="' + propseSn + '">';
                 if(thumbImg != ''){
                     _html += '<img src="${genFilePath}' + thumbImg + '" alt="' + bsnsSj + '">';
                 }else{
                     _html += '<img src="/common/img/main/@img.png" alt="">';
                 }
                 _html += '</a></div><h3>'+ calByte.cutByteLength( bsnsSj, 130 ) +'</h3>';
                 _html += '<p>by'+ calByte.cutByteLength( propseInsttNm, 130 ) +'</p>';

                 _html += '          <div class="cause-card__content">';
                 _html += '          	<div class="cause-card__top">';
                 _html += '          		<div class="cause-card__progress">';
                 _html += '                        <span style="width: ' + fundRate+ ';" class="cardProgress">';
                 _html += '                            <b><i>' + fundRate + '</i></b>';
                 _html += '                        </span>';
                 _html += '                    </div><!-- /.cause-card__progress -->';
                 _html += '                    <div class="cause-card__goals">';
                 _html += '                        <p>' + gf_comma(cntrAmountSum) + ' 원</p>';
                 _html += '                        <p>총 ' + gf_comma(goalAmount) + '원</p>';
                 _html += '                    </div><!-- /.cause-card__goals -->';
                 _html += '                </div><!-- /.cause-card__top -->';
                 _html += '            </div><!-- /.cause-card__content -->';
                 _html += '            <a href="javascript:;" class="crowd-camp-button" onClick="javascript:goCtForm(this);" data-ct_form_url="' + ct_form_url + '" data-ct_menu_id="' + ct_menu_id + '" data-event_code="' + event_code + '">참여하기</a>';
                 _html += '        </div>';
             }
         }
         $("#mainBn2").find(".slider").html(_html);
//         swiper3.update();

    }

    /*===========================================================
     * Post 상세페이지로 이동 !!
     *===========================================================*/
    function goPostDetail(obj){
        var listSn = $(obj).data("list_sn");
        var bbsSn = $(obj).data("bbs_sn");
        var menuId = "";

        if(bbsSn == "1000") {
            menuId = "03_01_00";
        } else if(bbsSn == "1003") {
            menuId = "03_00_07";
        } else if(bbsSn == "1004") {
            menuId = "02_00_02";
        } else if(bbsSn == "1009") {
            menuId = "02_00_01";
        }

        // Cookie Value Initialize !!
        $.cookie("__menuId",   menuId);
        $.cookie("__menuType", "header");

        var param = "pLinkSepCd=menuLink";
        param += "&listSn=" + listSn;
        gf_submitMovePage("/bbs/" + bbsSn + "/initPostDetail.do", param);
    }

    //newAt N
    function goPostDetailByBanner(url, menuId ){
        var _url, param = "";
        if(url.indexOf('?') > -1) {
            _url = url.substring(0, url.indexOf('?'));
            param = url.substring(url.indexOf('?')+1);
        } else {
            _url = url;
        }

        if(param != ""){
            param += "&pMenuId=" + menuId;
            param += "&pMenuType=header";
        }

        // Cookie Value Initialize !!
        $.cookie("__menuId",   menuId);
        $.cookie("__menuType", "header");

        gf_submitMovePage(_url, "pLinkSepCd=menuLink&"+param);
    }

    /*===========================================================
     * 클라우드 펀딩 게시물 상세페이지로 이동 !!
     *===========================================================*/
    function goCrwdfundDetail(obj){
        var propseSn = $(obj).data("propse_sn");

        // Cookie Value Initialize !!
        $.cookie("__menuId",   "00_01_01");
        $.cookie("__menuType", "header");

        var param = "pLinkSepCd=menuLink";
        param += "&propseSn=" + propseSn;
        gf_submitMovePage("/ca/crwdfund/P/initCrwdfundDetail.do", param);
    }
    
	/*===========================================================
     * 기부페이지로 이동 !!
     *===========================================================*/
    function goCtForm(obj){
        var url         = $(obj).data("ct_form_url");
        var menuId      = $(obj).data("ct_menu_id");
        var eventCode   = $(obj).data("event_code");

        // Cookie Value Initialize !!
        $.cookie("__menuId",   menuId);
        $.cookie("__menuType", "header");

        var param = "pLinkSepCd=menuLink";
        param     += "&eventCode=" + eventCode;
        param     += "&speclMysAt=Y";

        gf_submitMovePage(url, param);
    }    

</script>

<!-- body Html -->
    <div class="base-main" id="baseMain">
        <!--main_section-->
        <div class="main__vs">
            <!--slider_hero-->
            <div class="slider-hero-box">
                <div class="slider-hero">
                    <div class="hero-box">
                        <div class="slider hero-imgs" id="banrList"></div>
                        
                        <div class="main-hero__buttons C_hidden">
                            <button type="button" class="main-hero__prev" tabindex="0" role="button">이전</button>
                            <button type="button" class="main-hero__autoplay main-hero__autoplay--pause" tabindex="0"
                                role="button">멈춤</button>
                            <button type="button" class="main-hero__next" tabindex="0" role="button">다음</button>
                            
                            <div class="pagination">
                                <span class="current"></span>
                                <span>&nbsp;/&nbsp;</span>
                                <span class="total"></span>
                            </div>
                         </div>
                    </div>
                    <div class="hero-bg-box">
                        <div class="slider hero-bgs" id="banrList_bgs"></div>
                    </div>


                    <!--notice&campaign-->
                    <div class="sliderB_container_box">
                        <div class="sliderB_container_camp">
                            <!-- slider1  -->
                            <div class="main_v_notice">
                                <h1><strong>부산</strong> 사회복지공동모금회</h1>
                                <div class="slider">
                                    <div class="v_notice_contents">
                                        <div>
                                            <strong></strong>
                                            <em></em>
                                            <h2></h2>
                                            <p></p>
                                        </div>
                                        <div><a></a></div>
                                    </div>
                                </div>

                                <!-- button -->
                                <div class="main_notice__buttons">
                                    <button type="button" class="main_notice___prev" tabindex="0" role="button"><span
                                            class="ir_pm">이전</span></button>
                                    <button type="button" class="main_notice___next" tabindex="0" role="button"><span
                                            class="ir_pm">다음</span></button>
                                </div>
                                <!-- //button -->
                            </div>
                            <!-- // -->
                            <!-- // -->
                        </div>
                    </div>
                    <!--//notice&campaign-->
                </div>
            </div>
            <!--//slider_hero-->
        </div>
        <!--//main_section-->
        <!-- quick_nav(box-banner)_web -->
        <div class="quick_nav">
            <!-- quick_box -->
            <div class="quick-area">
                <h2>주요 서비스</h2>
                <button class="btn_close"><span class="ir_pm">접기</span></button>
                <ul class="quick-info">
                    <li>
                        <a href="/bbs/1000/initPostList.do">
                            <i class="ico-notice"></i>
                            <span class="txt">공지사항</span>
                        </a>
                    </li>
                    <li>
                        <a href="/bbs/1004/initPostList.do">
                            <i class="ico-info"></i>
                            <span class="txt">지원안내</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://proposal.chest.or.kr">
                            <i class="ico-online"></i>
                            <span class="txt">온라인배분신청</span>
                        </a>
                    </li>
                    <li>
                        <a href="/ct/lmpscntr/initIndvdl.do">
                            <i class="ico-donation1"></i>
                            <span class="txt">일시기부</span>
                        </a>
                    </li>
                    <li>
                        <a href="/ct/fdrmcntr/initEvemthcntr.do">
                            <i class="ico-donation2"></i>
                            <span class="txt">정기기부</span>
                        </a>
                    </li>
                    <li>
                        <a href="/fr/mycntr/initCntrdtlsinqire.do">
                            <i class="ico-mypage"></i>
                            <span class="txt">마이페이지</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- //quick_box -->
        </div>
        <!-- //quick_nav -->
         <!-- quick_nav(mobile) -->
        <div class="quick_action" onclick="actionToggle();">
            <span>+</span>
            <h2>주요 서비스 </h2>
            <ul class="quick-info">
                <li><a href="/bbs/1000/initPostList.do"><i class="ico-notice"></i><em class="txt">공지사항</em></a></li>
                <li><a href="/bbs/1004/initPostList.do"><i class="ico-info"></i><em class="txt">지원안내</em></a></li>
                <li><a href="https://proposal.chest.or.kr"><i class="ico-online"></i><em class="txt">온라인배분신청</em></a></li>
                <li><a href="/ct/lmpscntr/initIndvdl.do"><i class="ico-donation1"></i><em class="txt">일시기부</em></a></li>
                <li><a href="/ct/fdrmcntr/initEvemthcntr.do"><i class="ico-donation2"></i><em class="txt">정기기부</em></a></li>
                <li><a href="/fr/mycntr/initCntrdtlsinqire.do"><i class="ico-mypage"></i><em class="txt">마이페이지</em></a></li>
            </ul>
        </div>
        <!-- //quick_nav(mobile) -->
        <!--box-card_camp-->
        <div class="box-card_camp">
            <div class="box-card_campbox">
                <div class="innerbox">
                    <dl class="title">
                        <dt>함께나누면<br />행복도 2배<br /><strong class="red">착한기부</strong></dt>
                        <dd>
                            <p>사랑의열매는<br />기부내역확인서비스로<br />기부금 내역을 공개하고 있습니다.<br />여러분의 사랑을 보여주세요.</p>
                            <div class="list-link">
                                <ul>
                                    <li class="tab"><a href="/ct/fdrmcntr/initEvemthcntr.do">정기기부</a></li>
                                    <li class="tab"><a href="/ct/lmpscntr/initIndvdl.do">일반기부</a></li>
                                </ul>
                            </div>
                        </dd>
                    </dl>
                    <div class="contentsbox">
                    <a href="/ct/cntrpt/initNicehome.do">
                        <div>
                            <i class="d_icon_home"></i>
                            <h3 class="contentsbox_title">착한가정</h3>
                            <p class="description">가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>
                            <button class="btn">신청하기</button>
                        </div>
                     </a>
                     <a href="/ct/cntrpt/initNicestore.do">
                        <div>
                            <i class="d_icon_store"></i>
                            <h3 class="contentsbox_title">착한가게</h3>
                            <p>가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>
                            <button class="btn">신청하기</button>
                        </div>
                      </a>
                       <a href="/ct/cntrpt/initNicespt.do">
                        <div>
                            <i class="d_icon_work"></i>
                            <h3 class="contentsbox_title">착한일터</h3>
                            <p>가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>
                            <button class="btn">신청하기</button>
                        </div>
                        </a>
                        <a href="/ct/cntrpt/initShareleadr.do">
                        <div>
                            <i class="d_icon_namum"></i>
                            <h3 class="contentsbox_title">나눔리더</h3>
                            <p>가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>
                            <button class="btn">신청하기</button>
                        </div>
                        </a>
                        <a href="/ct/cntrpt/initShareleadrclub.do">
                        <div>
                            <i class="d_icon_club"></i>
                            <h3 class="contentsbox_title">나눔리더스클럽</h3>
                            <p>가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>
                            <button class="btn">신청하기</button>
                        </div>
                        </a>
                        <a href="/ct/cntrpt/initHonorsociety.do">
                        <div>
                            <i class="d_icon_honor"></i>
                            <h3 class="contentsbox_title">아너 소사이어티</h3>
                            <p>가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>
                            <button class="btn">신청하기</button>
                        </div>
                        </a>
                        <a href="/ct/cntrpt/initCntrendw.do">
                        <div>
                            <i class="d_icon_fit"></i>
                            <h3 class="contentsbox_title">기부자맞춤기금</h3>
                            <p>가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>
                            <button class="btn">신청하기</button>
                        </div>
                        </a>
                        <a href="/ct/entcntrb/initSoctycntrbdntncntr.do">
                        <div>
                            <i class="d_icon_social"></i>
                            <h3 class="contentsbox_title">사회공헌 성금기부</h3>
                            <p>가족 모두가 나눔의 의미를 함께 나눌 수 있는 나눔실천 프로그램입니다.</p>
                            <button class="btn">신청하기</button>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--//box-card_camp-->
        <!-- sns -->
        <div class="sns_wrapper">
            <h3>
                <strong>#사랑의열매 </strong>소셜미디어
            </h3>
            <div class="sns-box">
                <a href="javascript:snsMoveEvent('SNS_PB');" title="새 창 열림" class="ico-f"><span
                        class="ir_pm">페이스북</span></a>
                <a href="https://www.youtube.com/channel/UCbHsnc9llMcA9ypjVAnpcuQ" title="새 창 열림" class="ico-u"
                    target="_blank"><span class="hide">유튜브</span></a>
                <a href="javascript:snsMoveEvent('SNS_BG');" title="새 창 열림" class="ico-b"><span
                        class="ir_pm">블로그</span></a>
                <a href="javascript:snsMoveEvent('SNS_IS');" title="새 창 열림" class="ico-i"><span
                        class="ir_pm">인스타그램</span></a>
            </div>
            <div class="sns_campaign rewind" id="fbList"></div>
        </div>
        <!-- //sns -->
        <!--crowd-camp-->
        <div class="main-type2-camp">
            <div class="crowd-camp">
                <div class="innerbox">
                    <dl class="title">
                        <dt>우리 같이<br />응원해요!<br /><strong class="blue">크라우드 펀딩</strong></dt>
                        <dd>
                            <p>모금된 금액은 수수료 없이 전액 펀딩<br />사업에 사용됩니다.</p>
                            <div class="list-link">
                                <ul>
                                    <li class="tab"><a href="/ca/crwdfund/P/initCrwdfund.do">펀딩더보기</a></li>
                                    <li class="tab"><a href="/ca/crwdfund/initReqstfund.do">신청하기</a></li>
                                    <li class="tab"><a href="/ca/crwdfund/E/initCrwdfund.do">펀딩후기</a></li>
                                </ul>
                            </div>
                        </dd>
                    </dl>
                    <!--main_sub_slider2-->


                    <div class="slick_sub">
                        <div class="tab-pane" id="slide-scroll">
                            <div class="test-case-wrap slick-crowd-camp" id="mainBn2">
                                <div class="slider"></div>

                                <!-- button -->
                                <div class="crowd-camp-buttons">
                                    <button type="button" class="crowd-camp_prev" tabindex="0" role="button"><span
                                            class="ir_pm">이전</span></button>
                                    <button type="button" class="crowd-camp_next" tabindex="0" role="button"><span
                                            class="ir_pm">다음</span></button>

                                    <span id="pagination"></span>
                                </div>

                                <!-- //button -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//crowd-camp-->
		<!-- camp-namum -->
        <div class="main-type2-camp">

            <div class="camp-namum">

                <div class="innerbox">
                    <dl class="title">
                        <dt>사랑의 열매와<br />함께 나누는<br /><strong class="green">나눔 스토리</strong></dt>
                        <dd>
                            <p>여러분의 소중한 성금은 꼭 필요한 곳에<br />사용됩니다.</p>
                            <div class="list-link">
                                <ul>
                                    <li class="tab"><a href="/bbs/1009/initPostList.do">스토리더보기</a></li>
                                    <li class="tab"><a href="/bn/sportbsns/initRelmsport.do">지원사업</a></li>
                                </ul>
                            </div>
                        </dd>
                    </dl>

                    <div class="slick_sub"">
                        <div class=" tab-pane" id="slide-scroll">
                        <div class="test-case-wrap slick-camp-namum" id="mainBn1">
                            <div class="slider"></div>
                        </div>
                    </div>

                    <!-- button -->
                    <div class="crowd-nanum__buttons">
                        <button type="button" class="crowd-nanum_prev" tabindex="0" role="button"><span
                                class="ir_pm">이전</span></button>
                        <button type="button" class="crowd-nanum_next" tabindex="0" role="button"><span
                                class="ir_pm">다음</span></button>
                    </div>
                    <!-- //button -->
                </div>

            </div>

        </div>
    </div>
    <!-- //camp-namum -->
	<!-- 열매튜브 -->
    <div class="main-type2-camp main-beanTube">
        <div class="main-beanTube_box">
            <div class="beanTube_title">
                <h2><strong>열매</strong>튜브<span class="beanIcon"></span></h2>
                <div class="beanTube-list-link">
                    <ul>
                        <li class="tab1"><a href="https://www.youtube.com/playlist?list=PLRQApN2wEgA_G9h_R6y4bisvEOydEyKli" target="_blank">착한오지라퍼</a></li>
                        <li class="tab2"><a href="https://www.youtube.com/playlist?list=PLRQApN2wEgA8KfSKVLwWJLsWnUF0B3iwe" target="_blank">오지는미식회</a></li>
                        <li class="tab3"><a href="https://www.youtube.com/playlist?list=PLRQApN2wEgA__ZNhSoxDumcDAxe9dHOAE" target="_blank">오지랖뷰</a></li>
                    </ul>
                </div>
            </div>

            <div class="slick_sub">
                <div class=" tab-pane" id="slide-scroll">
                    <div class="test-case-wrap slick-beanTube">
                        <div class="slider">
                              <div>
                                <a href="https://www.youtube.com/watch?v=cfD0oiJqQLc" target="_blank">
                                <img src="/common/img/re_main_2010/youtube_img07.png" /></a>
                                <div class="beanTube_descript">
                                    <h2>#나눔</h2>
                                    <p>사랑의열매 2020년 연말광고<br/>올겨울 나눔의 주인공이 되어보세요!</p>
                                </div>
                            </div>
                            <div>
                                <a href="https://www.youtube.com/watch?v=uhB4Am0Aakk" target="_blank">
                                <img src="/common/img/re_main_2010/youtube_img01.png" /></a>
                                <div class="beanTube_descript">
                                    <h2>#나눔 #우리가 #움직여야</h2>
                                    <p>사랑의열매2020년 연중광고
                                        이영지,<br /> 나눔으로 세상을 움직이다</p>
                                </div>
                            </div>
                            <div>
                               <a href="https://www.youtube.com/watch?v=d757P6cDxQs" target="_blank">
                                <img src="/common/img/re_main_2010/youtube_img02.png" /></a>
                                <div class="beanTube_descript">
                                    <h2>#착한오지라퍼</h2>
                                    <p>(속보)이영지, 중학교때부터 사랑의열매와 연이<br />
                                        깊어… [착한 오지라퍼 ep.7]</p>
                                </div>
                            </div>
                            <div>
                                <a href="https://www.youtube.com/watch?v=IzsTOjUjxVE">
                                <img src="/common/img/re_main_2010/youtube_img03.png" /></a>
                                <div class="beanTube_descript">
                                    <h2>#사랑의 열매& JTBC</h2>
                                    <p>사랑의열매2020년 바이럴광고- 적!재!적!소!에<br />
                                        빠르게!</p>
                                </div>
                            </div>
                            <!-- <div>
                                <img src="/common/img/re_main_2010/youtube_img04.png" />
                                <div class="beanTube_descript">
                                    <h2>#나눔 #우리가 #움직여야</h2>
                                    <p>사랑의열매2020년 연중광고
                                        이영지,<br /> 나눔으로 세상을 움직이다</p>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>

                <!-- button -->
                <div class="beanTube-buttons">
                    <button type="button" class="beanTube_prev" tabindex="0" role="button"><span
                            class="ir_pm">이전</span></button>
                    <button type="button" class="beanTube_next" tabindex="0" role="button"><span
                            class="ir_pm">다음</span></button>
                </div>
                <!-- //button -->
            </div>

        </div>
        <!-- //main_sub_slider-->
    </div>
    <!-- //열매튜브 -->
    <!-- 공지사항/최근보도/지원안내 -->
    <div class="main-bbs">
        <div class="box-bbs">
            <h3 class="box-bbs-title">공지사항</h3>
            <ul class="bbs-list" id="noticeList">
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1000"
                        data-list_sn="13350" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">14</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">2020년도 인턴 채용</span> </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1000"
                        data-list_sn="13349" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">14</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">제2회 사랑의열매 학술상 안내(기간연장, ~10/31)</span>
                        </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1000"
                        data-list_sn="13333" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">08</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">연구직 직원 채용 최종 합격자 발표</span> </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1000"
                        data-list_sn="13236" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">25</span> <span
                                class="bbs-month">2020.09</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">연구직 직원채용 2차 전형(수행평가) 합격자 발표</span> </div>
                    </a></li>
            </ul>
            <a href="/bbs/1000/initPostList.do" class="bbs-more" alt="공지사항 더 보기" title="공지사항 더 보기">more</a>
        </div>
        <div class="box-bbs">
            <h3 class="box-bbs-title">최근보도</h3>
            <ul class="bbs-list" id="mediaList">
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1003"
                        data-list_sn="13374" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">19</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">[한국경제 외] 국민MC 송해, 마스크 10만장 기부</span>
                        </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1003"
                        data-list_sn="13337" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">13</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">[뉴스1] 전국 소상공인 위해 상점가 특별방역 지원</span>
                        </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1003"
                        data-list_sn="13258" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">05</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">[연합뉴스] W아너 소사이어티, ’제1회 w아너 리더십 포럼’
                                개최</span> </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1003"
                        data-list_sn="13257" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">05</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">[뉴스1] ’박상민·황기순의 사랑더하기’ 누적 기부금 6억원
                                달성</span> </div>
                    </a></li>
            </ul>
            <a href="/bbs/1003/initPostList.do" class="bbs-more" alt="최근보도 더 보기" title="최근보도 더 보기">more</a>
        </div>
        <div class="box-bbs">
            <h3 class="box-bbs-title">지원안내</h3>
            <ul class="bbs-list" id="supportList">
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1004"
                        data-list_sn="13369" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">16</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">2020 하반기 아리따운물품나눔 선정공고</span> </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1004"
                        data-list_sn="13327" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">07</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">2021년 기획사업 “코로나19 이후를 대비하는 사회백신 프로젝트”
                                신청안내(온라인 설명회 자료 추가)</span> </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1004"
                        data-list_sn="13248" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">28</span> <span
                                class="bbs-month">2020.09</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">2020년 기획 ’북한이탈주민 지원사업’ 공모 신청 안내</span>
                        </div>
                    </a></li>
                <li class="bbs-item"> <a href="javascript:;" onclick="javascript:goPostDetail(this);" data-bbs_sn="1004"
                        data-list_sn="13340" class="bbs-link">
                        <div class="bbs-link-col days"> <span class="bbs-day">13</span> <span
                                class="bbs-month">2020.10</span> </div>
                        <div class="bbs-link-col"> <span class="bbs-title">2020년 ’비영리스타트업 인큐베이팅 사업’ 면접심사 대상기관
                                안내</span> </div>
                    </a></li>
            </ul>
            <a href="/bbs/1004/initPostList.do" class="bbs-more" alt="지원안내 더 보기" title="지원안내 더 보기">more</a>
        </div>
    </div>
    <!-- // -->
    <script type="text/javascript" src="/common/js/slick/slick.min.js"></script>
    <script type="text/javascript" src="/common/js/slick/slick_custom.js"></script>
    </div>

