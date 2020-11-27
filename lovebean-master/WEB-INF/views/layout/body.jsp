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

<script type="text/javascript">

    var swiper,swiper2,swiper3,swiper4,timer;
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

    var _initCtrl = function() {

        //나눔과 변화의스토리
        $("#mainBn1_more").click(function(){
            var param = "?pBhfCode=${__branchCd}";
            gf_submitMovePage("<c:url value='/bbs/1009/initPostList.do' />", param);
        });

        //내가만드는따뜻한세상
        $("#mainBn2_more").click(function(){
            var param = "?pBhfCode=${__branchCd}";
            gf_submitMovePage("<c:url value='/ca/crwdfund/P/initCrwdfund.do' />", param);
        });

    };

    /*===========================================================
     * Page Loading !!
     *===========================================================*/
    $(document).ready(function(){
    	
    	
    	

        swipeGroup();
        selectBanrList();
        selectBhfBanrList();
        selectMainBbsList();
        _initCtrl();
        $(window).on('resize', function(){
            clearTimeout(timer);
            timer = setTimeout(function(){
                CUR_WINDOW_WIDTH = $(window).width();
                selectBanrList(); // 모바일,PC전환 감지
                selectBhfBanrList(); // 모바일,PC전환 감지
                swiper2.update();
                swiper3.update();
                swiper4.update();
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
		
        
    });

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
                fbList += '<div class="swiper-slide">';

                if (!gf_isNull(response.data[i].full_picture)) {
                    fbList += '    <img src="' + response.data[i].full_picture + '" alt="">';
                }

                fbList += '    <div class="hashtag-txt">';

                if (!gf_isNull(response.data[i].message)) {
                    fbList += '        <strong>' + response.data[i].message + '</strong>';
                }

                fbList += '        <span>' + response.data[i].created_time.substring(0,10).split('-').join('.') + '</span>';
                fbList += '        <a href="' + response.data[i].permalink_url + '"><img src="/common/img/main/sns_f.jpg" alt="페이스북"></a>';
                fbList += '    </div>';
                fbList += '</div>';
            }

            $("#fbList").html(fbList);

            swiper4.update();
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

        for(var i=0; i<listInfo.length; i++){
            listHtml += '<div class="swiper-slide">';

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
        }

        $("#banrList").html(listHtml);

        // swiper 재시작
        
           // swiper main(추가_2008)
           var slider = new Swiper('#mainVs', {
               //loop:true,
               autoplay:{
			    delay: 3000,
			    },
               spaceBetween: 10,
               pagination: {
                   el: '.swiper-pagination',
                   type: 'fraction',
                   renderFraction: function (currentClass, totalClass, index, total) {
                       return '<span class="' + currentClass + '">0' + index + '</span>' +
                           ' / ' +
                           '<span class="' + totalClass + '">0' + total + '</span>';
                   }
               },
               navigation: {
                   nextEl: '.swiper-button-next',
                   prevEl: '.swiper-button-prev',
               },
               slideChange: function (s) {
                   var x = s.activeIndex;
               },
               on: {
                   slideChangeTransitionStart: function (s) {
                       //console.log('назад');
                       console.log(slider.activeIndex);
                       var currentSlide = $(s.slides[s.activeIndex]);
                       currentSlide.find('.title').text('1');
                       TweenMax.to('.swiper-slide .title', 0.2, {
                           scaleY: 1,
                           delay: 0.3
                       });

	                   },
	               }
	           });
        
	       	$('.swiper-slide').hover(
      			function(){
      				slider.autoplay.stop();
      			},function(){
      				slider.autoplay.start();
      			}
	       	);

           slider.on('slideChangeTransitionStart', function (event) {
               TweenMax.to('.swiper-slide .title', 0.2, {
                   scaleY: 1,
                   delay: 0.3
               });
           });
           // swiper main__end(추가2008)
       
    }
    /*===========================================================
     * 지회 Banr 리스트 조회 Callback Function !!
     *===========================================================*/
    function selectBhfBanrListAfter(data){
        var listInfo = data.listInfo;
        var listHtml = "";
        var listHtml2 = "";
        var sdt = "";
        var edt = "";
        var aCnt = 0;
        var bCnt = 0;

        for(var i=0; i<listInfo.length; i++){
            
            sdt = listInfo[i].bgndt.substring(0,4) + "." + listInfo[i].bgndt.substring(4,6) + "." +  listInfo[i].bgndt.substring(6,8);
            edt = listInfo[i].enddt.substring(0,4) + "." + listInfo[i].enddt.substring(4,6) + "." +  listInfo[i].enddt.substring(6,8);
            
            if (listInfo[i].ntceSe == "A") {
                aCnt++;
                
              //공지사항
                listHtml += '<li class="aside__bottom--items">';
                
                if (aCnt == 1) {
                    listHtml += '<div class="more">';
                    listHtml += '<p><a href="/bbs/1000/initPostList.do">더보기</a></p>';
                    listHtml += '</div>';
                }
    
                if (listInfo[i].onYn == "Y") {
                    listHtml += '<div class="on_logo aside__icon--on"></div>';
                } else {
                    listHtml += '<div class="on_logo aside__icon--off"></div>';
                    
                }
                
                listHtml += '<div class="aside__bottom--item">';
                
                if (listInfo[i].cnncPgeUrl == "" || listInfo[i].cnncPgeUrl == null) {
                    listHtml += '<img src="' + "${genFilePath}"+ listInfo[i].flpth + listInfo[i].serverFileNm + '" alt="' + listInfo[i].altText + '">';
                } else {
                    if (listInfo[i].newAt == "Y") {
                        listHtml += '<a href="' + listInfo[i].cnncPgeUrl + '" target="_blank">';
                    } else {
                        listHtml += '<a href="' + listInfo[i].cnncPgeUrl + '">';
                    }
    
                    listHtml += '<img src="' + "${genFilePath}"+ listInfo[i].flpth + listInfo[i].serverFileNm + '" alt="' + listInfo[i].altText + '">';
                    listHtml += '</a>'
                }
                
                listHtml += '<div>';
                listHtml += '<h1>' + listInfo[i].titleText + '</h1>';
                listHtml += '<p>' + listInfo[i].dcText + '</p>';
                listHtml += '<p>' + sdt + ' ~ ' + edt + '</p>';
                listHtml += '</div>';
                listHtml += '</div>';
                listHtml += '</li>';
            } else {
                bCnt++;
                
                //지원안내
                listHtml2 += '<li class="aside__bottom--items">';
                
                if (bCnt == 1) {
                    listHtml2 += '<div class="more">';
                    listHtml2 += '<p><a href="/bbs/1004/initPostList.do">더보기</a></p>';
                    listHtml2 += '</div>';
                }
    
                if (listInfo[i].onYn == "Y") {
                    listHtml2 += '<div class="on_logo aside__icon--on"></div>';
                } else {
                    listHtml2 += '<div class="on_logo aside__icon--off"></div>';
                    
                }
                
                listHtml2 += '<div class="aside__bottom--item">';
                
                if (listInfo[i].cnncPgeUrl == "" || listInfo[i].cnncPgeUrl == null) {
                    listHtml2 += '<img src="' + "${genFilePath}"+ listInfo[i].flpth + listInfo[i].serverFileNm + '" alt="' + listInfo[i].altText + '">';
                } else {
                    if (listInfo[i].newAt == "Y") {
                        listHtml2 += '<a href="' + listInfo[i].cnncPgeUrl + '" target="_blank">';
                    } else {
                        listHtml2 += '<a href="' + listInfo[i].cnncPgeUrl + '">';
                    }
    
                    listHtml2 += '<img src="' + "${genFilePath}"+ listInfo[i].flpth + listInfo[i].serverFileNm + '" alt="' + listInfo[i].altText + '">';
                    listHtml2 += '</a>'
                }
                
                listHtml2 += '<div>';
                listHtml2 += '<h1>' + listInfo[i].titleText + '</h1>';
                listHtml2 += '<p>' + listInfo[i].dcText + '</p>';
                listHtml2 += '<p>' + sdt + ' ~ ' + edt + '</p>';
                listHtml2 += '</div>';
                listHtml2 += '</div>';
                listHtml2 += '</li>';
            }
        }

        $("#tab-1").html(listHtml);
        $("#tab-2").html(listHtml2);
        
        if (aCnt == 0 && bCnt > 0) {
            $('ul.left li').removeClass('active');
            $('.aside_notice').removeClass('active');
            $('#tab-2-t').addClass('active');
            $("#tab-2").addClass('active');
        }

    }

    function swipeGroup() {
        //slider

        swiper2 = new Swiper('#mainBn1', {
            slidesPerView: 3,
            spaceBetween: 52,
            breakpoints: {
                480: {
                    spaceBetween: 8
                },
                768: {
                    spaceBetween: 20
                }
            },
            loop:true,
            autoHeight:true,
            navigation: {
                nextEl: '#btn-swiper-next2',
                prevEl: '#btn-swiper-prev2',
            }
        });

        swiper3 = new Swiper('#mainBn2', {
            slidesPerView:3,
            spaceBetween: 52,
            breakpoints: {
                600: {
                    slidesPerView: 1,
                    spaceBetween: 8
                },
                768: {
                    spaceBetween: 20
                }
            },
            //loop:true,
            navigation: {
                nextEl: '#btn-swiper-next3',
                prevEl: '#btn-swiper-prev3',
            }
        });

        swiper4 = new Swiper('#mainBn3', {
            slidesPerView: 2,
            spaceBetween: 25,
            breakpoints: {
                480: {
                    spaceBetween: 8
                },
                768: {
                    spaceBetween: 12
                }
            },
           // loop:true,
            navigation: {
                nextEl: '#btn-swiper-next4',
                prevEl: '#btn-swiper-prev4',
            }
        });
    }

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
                _html += '<div class="swiper-slide">';
                _html += '    <a href="javascript:;" onClick="javascript:goPostDetail(this);" data-bbs_sn="1009" data-list_sn="' + data.listMain2[i].listSn + '" class="gallery-link">';
                if(thumbImg != ''){
                    _html += '<img src="${genFilePath}' + thumbImg + '" alt="' + _title + '">';
                }else{
                    _html += '<img src="/common/img/main/@img.png" alt="" >';
                }
                _html += '<div><p class="gallery-tit"><b>'+ calByte.cutByteLength( _title, 130 ) +'</b></p></div></a>';

                _html += '</div>';
            }
        }
        $("#mainBn1").find(".swiper-wrapper").html(_html);
        swiper2.update();

        _html = "";
        if(data.listMain3) {
            for (var i=0; i<data.listMain3.length; i++) {
                var propseSn       = data.listMain3[i].propseSn;
                var bsnsSj         = data.listMain3[i].bsnsSj;
                var cntrAmountSum  = !gf_isNull(data.listMain3[i].cntrAmountSum) ? data.listMain3[i].cntrAmountSum : 0;
                var cntrAmountCnt  = !gf_isNull(data.listMain3[i].cntrAmountCnt) ? data.listMain3[i].cntrAmountCnt : 0;
                var goalAmount     = !gf_isNull(data.listMain3[i].goalAmount) ? data.listMain3[i].goalAmount : 0;

                var fundRate       = gf_round((cntrAmountSum / goalAmount) * 100, 0) + '%';

                var serverFileNm = data.listMain3[i].serverFileNm;
                var fileExtsn    = data.listMain3[i].fileExtsn;
                var flpth        = data.listMain3[i].flpth;
                var thumbImg     = '';
                var thumbFileNm = data.listMain3[i].thumbFileNm;

                if(!gf_isNull(thumbFileNm)){
                    thumbImg    = flpth + '/' +thumbFileNm;
                }
                _html += '<div class="swiper-slide">';
                _html += '  <a href="javascript:;" class="gallery-link" onClick="javascript:goCrwdfundDetail(this);" data-propse_sn="' + propseSn + '">';
                if(thumbImg != ''){
                    _html += '<img src="${genFilePath}' + thumbImg + '" alt="' + bsnsSj + '">';
                }else{
                    _html += '<img src="/common/img/main/@img.png" alt="">';
                }
                _html += '<div><p class="gallery-tit"><b>'+ calByte.cutByteLength( bsnsSj, 130 ) +'</b></p>';

                _html += '          <div class="donate-point">';
                _html += '              <strong class="percent">' + fundRate + '</strong>';
                _html += '              <div class="bar-wrap">';
                _html += '                  <div class="bar" style="height:4px; width:' + fundRate+ '"></div>';
                _html += '              </div>';
                _html += '              <div class="fl-wrap">';
                _html += '                  <div class="fl-item-l">';
                _html += '                      <b>' + gf_comma(cntrAmountSum) + ' 원</b> 기부 <b>( '+gf_comma(cntrAmountCnt)+' 명 )</b>';
                _html += '                  </div>';
                _html += '                  <div class="fl-item-r">' + gf_comma(goalAmount) + ' 원 목표</div>';
                _html += '              </div>';
                _html += '          </div>';
                _html += '</div></a></div>';
            }
        }
        $("#mainBn2").find(".swiper-wrapper").html(_html);
        swiper3.update();

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

</script>

<!-- body Html -->
<div class="base-main" id="baseMain">
    <!-- <div class="main-vs">
        <div class="swiper-container" id="mainVs" >
            <div class="swiper-control">
                <button type="button" class="btn-stop">
                    <span class="hide">정지</span>
                </button>
                <button type="button" class="btn-start">
                    <span class="hide">실행</span>
                </button>
            </div>
            <div class="swiper-wrapper" id="banrList"></div>
            Add Pagination
            <div class="swiper-pagination"></div>
            Add Arrows
            <div class="swiper-navi">
                <button type="button" class="btn-swiper-prev main-vs-prev" id="btn-swiper-prev1">
                    <span class="hide">이전</span>
                </button>
                <button type="button" class="btn-swiper-next main-vs-next" id="btn-swiper-next1">
                    <span class="hide">다음</span>
                </button>
            </div>
        </div>
        
        추가
        <div><img src="http://placehold.it/456x0" /></div>
    </div> -->
    
               <!-- main hero 배너(2type) -->
                <div class="main__vs">
                    <div class="main-vs2" >
                        <!-- Swiper -->
                        <div class="swiper-container"  id="mainVs" >
                            <div class="swiper-wrapper" id="banrList"></div>
                            <!-- Add Pagination -->
                            <div class="swiper-pagination"></div>
                            <!-- Add Arrows -->
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                    
                    <div class="main__aside">
                        <div class="main__aside--top">
                            <ul class="left">
                                <li class="active" data-tab="tab-1" id="tab-1-t">공지사항</li>
                                <li data-tab="tab-2" id="tab-2-t">지원안내</li>
                            </ul>
                            <div class="right">
                                <p><span class="aside__icon--off"></span>종료</p>
                                <p>&nbsp;<span class="aside__icon--on"></span>진행중</p>
                            </div>
                        </div>
                        <div class="main__aside--bottom">
                            <ul class="aside_notice active" id="tab-1"></ul>

                            <ul class="aside_notice" id="tab-2"></ul>

                            <p class="line"></p>
                        </div>
                    </div>
                </div>

                <!--// main hero 배너(2type) -->

    <div class="main-type2 mini">
        <h3>나눔과 <br>변화의스토리</h3>
        <div class="main-type-wrap">
            <div class="swiper-container" id="mainBn1">
                <div class="swiper-wrapper"></div>
            </div>
        </div>
        <button type="button" class="btn-swiper-prev" id="btn-swiper-prev2">
            <span class="hide">이전</span>
        </button>
        <button type="button" class="btn-swiper-next" id="btn-swiper-next2">
            <span class="hide">다음</span>
        </button>

        <button type="button" class="btn-more" id="mainBn1_more" title="나눔과 변화의스토리 더보기">
            <span class="hide">나눔과 변화의스토리 더보기</span>
        </button>
    </div>

    <div class="box-sns">
        <div class="box-sns-vod">
            <div>
                <iframe id="player" type="text/html" width="344" height="222"  src="https://www.youtube.com/embed/uhB4Am0Aakk"  title="이영지, 나눔으로 세상을 움직이다" frameborder="0"></iframe>
                <strong>이영지, 나눔으로 세상을 움직이다</strong>
                <div class="sns-wrap">
                    <a href="javascript:snsMoveEvent('SNS_PB');"title="새 창 열림"  class="ico-f" ><span class="hide">페이스북</span></a>
                    <a href="https://www.youtube.com/channel/UCbHsnc9llMcA9ypjVAnpcuQ" title="새 창 열림" class="ico-u" target="_blank"><span class="hide">유튜브</span></a>
                    <a href="javascript:snsMoveEvent('SNS_BG');" title="새 창 열림" class="ico-b" ><span class="hide">블로그</span></a>
                    <a href="javascript:snsMoveEvent('SNS_IS');"title="새 창 열림"  class="ico-i" ><span class="hide">인스타그램</span></a>
                </div>
            </div>
        </div>
        <div class="box-sns-slide">
            <div class="swiper-container" id="mainBn3">
                <div class="swiper-wrapper" id="fbList"></div>
                <button type="button" class="btn-swiper-prev" id="btn-swiper-prev4">
                    <span class="hide">이전</span>
                </button>
                <button type="button" class="btn-swiper-next" id="btn-swiper-next4">
                    <span class="hide">다음</span>
                </button>

            </div>

        </div>
    </div>

    <!-- 임시 HIDE
    <div class="box-now">
        <div class="box-now-area">
            <p class="box-now-tit">사랑의열매와 함께<br> 지금도 많은분들이 <strong>사랑</strong>을 나누고 있습니다.</p>
            <ul class="box-now-contents">
                <li class="box-now-item">
                    <i class="sprite-main-01"></i>
                    <span class="box-now-subt">진행중인 기부</span>
                    <span class="box-now-data">200+</span>
                </li>
                <li class="box-now-item">
                    <i class="sprite-main-02"></i>
                    <span class="box-now-subt">기부 참여자</span>
                    <span class="box-now-data">5000+</span>
                </li>
                <li class="box-now-item">
                    <i class="sprite-main-03"></i>
                    <span class="box-now-subt">진행중인 지원</span>
                    <span class="box-now-data">80+</span>
                </li>
                <li class="box-now-item">
                    <i class="sprite-main-04"></i>
                    <span class="box-now-subt">진행중인 펀딩</span>
                    <span class="box-now-data">20+</span>
                </li>
            </ul>
        </div>
    </div>
     -->

    <div class="main-type2 solo">
        <h3>사랑의열매 <br>크라우드펀딩</h3>
        <div class="main-type-wrap">
            <div class="swiper-container" id="mainBn2">
                <div class="swiper-wrapper"></div>
            </div>
        </div>
        <button type="button" class="btn-swiper-prev" id="btn-swiper-prev3">
            <span class="hide">이전</span>
        </button>
        <button type="button" class="btn-swiper-next" id="btn-swiper-next3">
            <span class="hide">다음</span>
        </button>

        <button type="button" class="btn-more" id="mainBn2_more" title="사랑의열매 크라우드펀딩 더보기">
            <span class="hide">사랑의열매 크라우드펀딩 더보기</span>
        </button>
    </div>

    <div class="box-card">
        <ul class="box-card-area">
            <li class="box-card-item box-img01">
                <h3 class="box-card-title">착한가정</h3>
                <a href="/ct/cntrpt/initNicehome.do" class="box-link">바로가기</a>
            </li>
            <li class="box-card-item box-img02">
                <h3 class="box-card-title">착한가게</h3>
                <a href="/ct/cntrpt/initNicestore.do" class="box-link">바로가기</a>
            </li>
            <li class="box-card-item box-img03">
                <h3 class="box-card-title">착한일터</h3>
                <a href="/ct/cntrpt/initNicespt.do" class="box-link">바로가기</a>
            </li>
            <li class="box-card-item box-img04">
                <h3 class="box-card-title">나눔리더</h3>
                <a href="/ct/cntrpt/initShareleadr.do" class="box-link">바로가기</a>
            </li>
            <li class="box-card-item box-img05">
                <h3 class="box-card-title">나눔리더스클럽</h3>
                <a href="/ct/cntrpt/initShareleadrclub.do" class="box-link">바로가기</a>
            </li>
            <li class="box-card-item box-img06">
                <h3 class="box-card-title">아너 소사이어티</h3>
                <a href="/ct/cntrpt/initHonorsociety.do" class="box-link">바로가기</a>
            </li>
            <li class="box-card-item box-img07">
                <h3 class="box-card-title">기부자맞춤기금</h3>
                <a href="/ct/cntrpt/initCntrendw.do" class="box-link">바로가기</a>
            </li>
            <li class="box-card-item box-img08">
                <h3 class="box-card-title">기업사회공헌</h3>
                <a href="/ct/entcntrb/initSoctycntrbdntncntr.do" class="box-link">바로가기</a>
            </li>
        </ul>
    </div>

    <div class="main-bbs">
        <div class="box-bbs">
            <h3 class="box-bbs-title">공지사항</h3>
            <ul class="bbs-list" id="noticeList"></ul>
            <a href="/bbs/1000/initPostList.do" class="bbs-more" alt="공지사항 더 보기" title="공지사항 더 보기">more</a>
        </div>
        <div class="box-bbs">
            <h3 class="box-bbs-title">최근보도</h3>
            <ul class="bbs-list" id="mediaList"></ul>
            <a href="/bbs/1003/initPostList.do" class="bbs-more"  alt="최근보도 더 보기" title="최근보도 더 보기">more</a>
        </div>
        <div class="box-bbs">
            <h3 class="box-bbs-title">지원안내</h3>
            <ul class="bbs-list" id="supportList"></ul>
            <a href="/bbs/1004/initPostList.do" class="bbs-more" alt="지원안내 더 보기" title="지원안내 더 보기">more</a>
        </div>
    </div>

    <div class="box-banner">
        <ul class="box-banner-area">
           <li class="box-banner-item">
<!--                <a href="/bn/sca/initChildse.do" class="box-banner-link"> -->
               <a href="javascript:;" OnClick="gf_msg();" class="box-banner-link">
                   <i class="sprite-mainbn-01"></i>
                   나눔체험관 <span class="mobile-block">견학신청</span>
               </a>
           </li>
            <li class="box-banner-item">
<!--                 <a href="/cm/sereqst/init.do" class="box-banner-link"> -->
               <a href="javascript:;" OnClick="gf_msg();" class="box-banner-link">
                    <i class="sprite-mainbn-02"></i>
                    기관방문<span class="mobile-block">신청</span>
                </a>
            </li>
            <li class="box-banner-item">
<!--                 <a href="/cm/rentreqst/init.do" class="box-banner-link"> -->
               <a href="javascript:;" OnClick="gf_msg();" class="box-banner-link">
                    <i class="sprite-mainbn-03"></i>
                    대관<span class="mobile-block">신청</span>
                </a>
            </li>
            <li class="box-banner-item">
                <a href="http://proposal.chest.or.kr" target="_blank" class="box-banner-link">
                    <i class="sprite-mainbn-04"></i>
                    온라인 <span class="mobile-block">배분신청</span>
                </a>
            </li>
        </ul>
    </div>
</div>
