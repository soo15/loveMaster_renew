; (function ($, win, doc, undefined) {
    'use strict';

    var menuArrayH = GV_ARR_MENU_H; // Header Menu Variable
    var menuArrayF = GV_ARR_MENU_F; // Footer Menu Variable

    $plugins.common = {
        init: function (opt) {
            // Header Menu Html !!
            $plugins.common.headerMenus();
            $plugins.common.footerMenus();

            var menuId   = opt.menuId;
            var menuType = opt.menuType;


            // Middle Navigation and Pre/Next Link Setting !!
            // menuId 가 없으면 menuArrayH or menuArrayF에서 menuId 를 찾는다.
            var pathName = window.location.pathname;

            if(pathName != "/base.do"){
                if(gf_isNull(menuId)){
                    var arrMenuInfo = $plugins.common.findMenuId(pathName, menuType);

                    menuId   = arrMenuInfo[0];
                    menuType = arrMenuInfo[1];
                }
            }

            // Header Event Setting !!
            $plugins.common.header(menuId, menuType);

            // Footer Event Setting : 현제는 구성되어 있지 않음. 후에 필요하면 구현 필요.!!
            $plugins.common.footer();

            if(!gf_isNull(menuId)){
                // 업무페이지인 경우 Body 부분 Class 추가
                $("#baseBody").addClass("type-sub");

                // Navigation
                
//                console.log( menuId );
//                console.log( menuType );
                $plugins.common.breadCrumbs(menuId, menuType);

                // Middle Previous and Next
                $plugins.common.middlePreNext(menuId, menuType);
            }
            
            $.cookie("__branchCd",  opt.branchCd);
            $.cookie("__branchId",  opt.branchId);
            $.cookie("__branchNm",  opt.branchNm);
            $.cookie("__branchUrl", opt.branchUrl);
            $.cookie("__menuId",    menuId);
            $.cookie("__menuType",  menuType);

            $plugins.uiInputClear();
            $plugins.uiCaption();

            (!$plugins.browser.mobile) ? $plugins.uiSelect() : '';

            $(win).on('scroll', function () {
                scrollChange($(win).scrollTop());
            });

            $plugins.uiHasScrollBar({ selector:$('body') }) ? $('html').addClass('is-scroll') : $('html').removeClass('is-scroll');

            function scrollChange(v) {
                var win_h = $(win).outerHeight();
                v > 0
                    ? $('body').addClass('scrolled')
                    : $('body').removeClass('scrolled');

                v + win_h + 10 > $(doc).outerHeight()
                    ? $('body').addClass('scrolled-b')
                    : $('body').removeClass('scrolled-b');

                v > win_h / 2
                    ? $('body').addClass('scroll-top')
                    : $('body').removeClass('scroll-top');
            }
            scrollChange($(win).scrollTop());
            $plugins.common.uiToggleBtn();
            
            //인증화면에서 휴대폰 번호 , 이름을 클릭 했을 경우에 알림메시지 제공
            $plugins.common.identity();
            
            //title 제공
            $plugins.common.setTitle( opt.branchNm );
            
        },
        setTitle : function( branchNm ) {
        	var txt = $("#uiNavDep3").text() ;
            var title4 = $("#title4").val() ;
        	var jihoe = "( "+branchNm+" ) 사랑의열매";
        	var title = "";
        	
        	if (title4 != undefined) {
        	    title = " > " + $("#uiNavDep1").text() + " > " + $("#uiNavDep2").text() + " > " + $("#uiNavDep3").text() + " > " + title4;
        	} else {
                title = " > " + $("#uiNavDep1").text() + " > " + $("#uiNavDep2").text() + " > " + $("#uiNavDep3").text();
        	}
        	if( txt != "" ) 
        		$("title").text( jihoe + title );
        	else $("title").text( jihoe + $(".contents-hd>h3>strong").text() );
        },
        identity : function() {
        	var ids = "#nm , #phone1 , #phone2 , #phone3 , #companyNm , #companyPhone1 , #companyPhone2 , #companyPhone3";
            $( ids ).off("click").on("click" , function() {
            	alert("휴대폰 번호, 이름 ,생년월일은 인증을 통해 자동입력됩니다.\n오른쪽 인증 버튼을 클릭해주세요.");
            	return false;
            });
        },
        uiToggleBtn: function(){
            $('.ui-togglebtn button').off('click.tg').on('click.tg', function(){
                $(this).closest('.ui-togglebtn').find('button').removeClass('btn-base-imp').addClass('btn-base');
                $(this).removeClass('btn-base').addClass('btn-base-imp')
            });
        },
        header: function (menuId, menuType) {
            var $nav   = $('#baseNav');
            var $li_1  = $nav.find('.nav-main-1');
            var $btn_1 = $nav.find('.nav-btn-1');
            var timer;
            var menucode = menuId.split('_');

            $('.ui-menu').on('click', function(){
                $('.header-mobile').addClass('on');
            });
            $('.menu-wrap .btn-close').on('click', function(){
                $('.header-mobile').removeClass('on');
            });

            //메뉴 빨간색 강조 다시 
            if(Number(menucode[0]) == "00" || Number(menucode[0]) > 0) {
            	//1depth 강조
            	$li_1.eq(Number(menucode[0])).find('.nav-btn-1').addClass('selected');
            	//2depth 강조
                var _that = $li_1.eq(Number(menucode[0])).find('.nav-sub > div');
                $(_that).find('li[_iid="'+menuId+'"]').parent().parent().addClass('selected');
                //3depth 강조
                $(_that).find('li[_iid="'+menuId+'"]').find('a').addClass('selected');
            }

            $btn_1.on('mouseover focus', function(){
                clearTimeout(timer);
                $plugins.common.navShow(this);
            }).on('mouseleave blur', function(){
                hideTimer();
            });

            $('.nav-sub, .nav-sub a').on('mouseover focus', function(){
                clearTimeout(timer);
            }).on('mouseleave blur', function(){
                hideTimer();
            });

            function hideTimer() {
                timer = setTimeout(function(){
                    $plugins.common.navHide();
                },200);
            }

            /* navigation 주석처리
            if($('#baseBreadcrumbs').length) {
                $plugins.uiAjax({
                    id:'baseBreadcrumbs',
                    url:'/inc/breadcrumbs.html',
                    page:true,
                    callback: function(){
                        $plugins.common.breadCrumbs(menucode[0], menucode[1], menucode[2], menuType);
                    }
                });
            }
            */

            $plugins.uiDropdown({
                id:'uiNavUtil1',
                ps:'bc',
                eff:'st'
            });
            $plugins.uiDropdown({
                id:'uiNavUtil2',
                ps:'bc',
                eff:'st'
            });
            $plugins.uiDropdown({
                id:'uiNavUtil1_m',
                ps:'bc',
                eff:'st'
            });
            $plugins.uiDropdown({
                id:'uiNavUtil2_m',
                ps:'bc',
                eff:'st'
            });
            $plugins.uiAccordion({
                id:'AccoNavDepth1',
                current:null,
                autoclose:true,
                callback:function(v){console.log(v)}
            });
            $plugins.uiAccordion({
                id:'AccoNavDepth2-1',
                current:null,
                autoclose:true,
                callback:function(v){console.log(v)}
            });
            $plugins.uiAccordion({
                id:'AccoNavDepth2-2',
                current:null,
                autoclose:true,
                callback:function(v){console.log(v)}
            });
            $plugins.uiAccordion({
                id:'AccoNavDepth2-3',
                current:null,
                autoclose:true,
                callback:function(v){console.log(v)}
            });
            $plugins.uiAccordion({
                id:'AccoNavDepth2-4',
                current:null,
                autoclose:true,
                callback:function(v){console.log(v)}
            });
        },
        navShow: function(t){
            $(t).closest('.nav-main-1').siblings('li').find('.nav-btn-1').data('selected',false);
            if (!$(t).data('selected')) {
                $(t).data('selected', true);
                $('.nav-main-1').removeClass('on');
                $('.nav-sub').css({
                    height: 0,
                    opacity:0
                })
                $(t).closest('.nav-main-1').addClass('on').find('.nav-sub').stop().animate({
                    height: 415,
                    opacity:1
                },200);

                $('.dim-nav').addClass('on').stop().animate({
                    top: 121,
                    height: 420
                },150)
            }

        },
        navHide: function(){
            $('.nav-btn-1').data('selected', false);
            $('.nav-main-1').removeClass('on').find('.nav-sub').stop().animate({
                height: 0,
                opacity:0
            },150);
            $('.dim-nav').removeClass('on').stop().animate({
                top: 121,
                height: 0
            },200)
        },
        headerMenus: function(){
            var $navPc = $('#baseNav');
            var $navMb = $('#baseNav2');	//모바일

            var ma = menuArrayH.menu;

            var headerPcHtml = '';
            var headerMbHtml = '';

            for (var i=0; i<ma.length; i++) {
                headerPcHtml += '<li class="nav-main-1">';
                headerPcHtml += '<a href="javascript:;" class="nav-btn-1"><i>' + ma[i].name + '</i></a>';
                headerPcHtml += '<div class="nav-sub">';

                headerMbHtml += '<li class="ui-acco-wrap">';
                headerMbHtml += '<div class="ui-acco-tit">';
                headerMbHtml += '<button type="button" class="ui-acco-btn">' + ma[i].name;
                headerMbHtml += '<span class="ui-acco-arrow">열기</span>';
                headerMbHtml += '</button>';
                headerMbHtml += '</div>';
                headerMbHtml += '<div class="ui-acco-pnl">';
                headerMbHtml += '<ul class="ui-acco" role="group" id="AccoNavDepth2-1">';

                for (var ii=0; ii<ma[i].dep2.length; ii++) {
                    headerPcHtml += '<div>';
                    headerPcHtml += '<h3>' + ma[i].dep2[ii].name + '</h3>';

                    headerMbHtml += '<li class="ui-acco-wrap">';
                    headerMbHtml += '<div class="ui-acco-tit">';
                    headerMbHtml += '<button type="button" class="ui-acco-btn">' + ma[i].dep2[ii].name;
                    headerMbHtml += '<span class="ui-acco-arrow">열기</span>';
                    headerMbHtml += '</button>';
                    headerMbHtml += '</div>';

                    if (ma[i].dep2[ii].dep3 !== undefined) {
                        headerPcHtml += '<ul>';

                        headerMbHtml += '<div class="ui-acco-pnl">';
                        headerMbHtml += '<ul>';

                        for (var iii=0; iii<ma[i].dep2[ii].dep3.length; iii++) {
                            var dep3Code   = ma[i].dep2[ii].dep3[iii].code;
                            var dep3Name   = ma[i].dep2[ii].dep3[iii].name;
                            var dep3Link   = ma[i].dep2[ii].dep3[iii].link;
                            var dep3Target = ma[i].dep2[ii].dep3[iii].target;

                            var comMenuHtml = "<li _iid='"+dep3Code+"'>";

                            // 새창 띄우기 예외 처리 !!
                            if(dep3Target == "_blank"){
                                comMenuHtml += '<a href="' + dep3Link + '" target="' + dep3Target + '"  >'+ dep3Name +'</a>';
                            } else {
                                comMenuHtml += '<a href="javascript:;" OnClick="headerMenuClickEvent(\''+ dep3Link +'\',\''+ dep3Code +'\',\'header\');"  >'+ dep3Name +'</a>';
                            }

                            comMenuHtml += "</li>";

                            headerPcHtml += comMenuHtml;
                            headerMbHtml += comMenuHtml;
                        }

                        headerPcHtml += '</ul>';

                        headerMbHtml += '</ul>';
                        headerMbHtml += '</div>';
                    }

                    headerPcHtml += '</div>';

                    headerMbHtml += '</li>';
                }

                headerPcHtml += '</div>';
                headerPcHtml += '</li>';

                headerMbHtml += '</ul>';
                headerMbHtml += '</div>';
                headerMbHtml += '</li>';
            }

            $("ul", $navPc).html(headerPcHtml);   // Pc Menu
            $("ul", $navMb).html(headerMbHtml);   // Mobil Menu
        },
        footerMenus: function(){
            var $navFooter = $('.footer-link');

            var ma = menuArrayF.menu;

            var footerHtml = '';

            for (var i=0; i<ma.length; i++) {
                var dep1Code = ma[i].code;
                var dep1Name = ma[i].name;

                var classNo = "";

                footerHtml += dep1Code == "03_00_00" ? '<dl class="footer-sns">' : '<dl>';
                footerHtml += '<dt>' + dep1Name + '</dt>';

                for (var ii=0; ii<ma[i].dep2.length; ii++) {
                    var dep2Code   = ma[i].dep2[ii].code;
                    var dep2Name   = ma[i].dep2[ii].name;
                    var dep2Link   = ma[i].dep2[ii].link;
                    var dep2Target = ma[i].dep2[ii].target;

                    footerHtml += '<dd>';

                    // 새창 띄우기 예외 처리 !!
                    if(dep2Target == "_blank"){
                        footerHtml += '<a href="' + dep2Link + '" target="' + dep2Target + '">';
                    } else {

                        if(dep2Link == "gf_msg();"){
                            footerHtml += '<a href="javascript:;" OnClick="gf_msg();">';
                        } else  if(dep2Target && dep2Target.indexOf("SNS_") > -1) {
                            footerHtml += '<a href="javascript:;" OnClick="snsMoveEvent(\''+dep2Target +'\');" + title="새 창 열림">';
                        } else {
                            footerHtml += '<a href="javascript:;" OnClick="headerMenuClickEvent(\''+ dep2Link +'\',\''+ dep2Code +'\',\'footer\',\'' + dep2Target + '\');">';
                        }
                    }

                         if(dep2Code == "03_00_00") classNo = "2";
                    else if(dep2Code == "03_01_00") classNo = "3";
                    else if(dep2Code == "03_02_00") classNo = "1";
                    else if(dep2Code == "03_03_00") classNo = "4";

                    footerHtml += dep1Code == "03_00_00" ? '<i class="sprite-footer_sns' + classNo + '">' : '';
                    footerHtml += dep2Name;
                    footerHtml += dep1Code == "03_00_00" ? '</i>' : '';
                    footerHtml += '</a>';
                    footerHtml += '</dd>';
                }

                footerHtml += '</dl>';
            }

            $navFooter.html(footerHtml);
        },
        middlePreNext: function(menuId, menuType){

            if($('.contents-menu-nav').length == 0) return;

            var ma = menuType == "header" ? menuArrayH.menu : menuArrayF.menu;

            if(gf_isNull(menuId)){
                return false;
            }

            var menucode = menuId.split('_');

            var d1 = Number(menucode[0]);
            var d2 = Number(menucode[1]);

            var preObj  = null;
            var nextObj = null;
            
//            console.log( "menuId ===" + menuId );
            if(menuType == "header"){
                if (ma[d1].dep2[d2].dep3 !== undefined) {
                	//나눔 캠페인 메뉴 처리
                	if( d1 == '0' ) {
                		for( var xx=0; xx<ma[d1].dep2.length; xx++ ) {
//                			console.log( "length ===" + ma[d1].dep2.length );
                    		if( ma[d1].dep2[xx].code == "0"+d1 + "_0" + d2 + "_00" )  {
                    			for(var i=0; i< ma[d1].dep2[xx].dep3.length; i++) {
                    				console.log( "menuId ===" + menuId );
                    				console.log( "length ===" + ma[d1].dep2[xx].dep3.length );
        	                        if( menuId == ma[d1].dep2[xx].dep3[i].code) {
        	                            if(i > 0) {
        	                                preObj  = ma[d1].dep2[xx].dep3[i - 1];
        	                            }
        	                            if(ma[d1].dep2[xx].dep3.length > i+1) {
        	                                nextObj = ma[d1].dep2[xx].dep3[i + 1];
        	                            }
        	                        }
        	                    }
                    		}
                		}
                	} else {
                		for(var i=0; i<ma[d1].dep2[d2].dep3.length; i++) {
	                        if(menuId == ma[d1].dep2[d2].dep3[i].code) {
	                            if(i > 0) {
	                                preObj  = ma[d1].dep2[d2].dep3[i - 1];
	                            }
	                            if(ma[d1].dep2[d2].dep3.length > i+1) {
	                                nextObj = ma[d1].dep2[d2].dep3[i + 1];
	                            }
	                        }
	                    }
                	}
                }
            } else {
                preObj  = ma[d1].dep2[d2 - 1];
                nextObj = ma[d1].dep2[d2 + 1];
            }

            var preNextHtml = "";

            if(preObj != null){
                preNextHtml += '<button type="button" OnClick="headerMenuClickEvent(\'' + preObj.link + '\',\'' + preObj.code + '\',\'' + menuType + '\');" class="prev-menu">' + preObj.name + '</button>';
            }

            if(nextObj != null){
                preNextHtml += '<button type="button" OnClick="headerMenuClickEvent(\'' + nextObj.link + '\',\'' + nextObj.code + '\',\'' + menuType + '\');" class="next-menu">' + nextObj.name + '</button>';
            }


            var $midMenu = $(".contents-menu-nav");

            if($midMenu.length > 0){
                $midMenu.html(preNextHtml);
            }
        },
        breadCrumbs: function(menuId, menuType){
        	//menuId = 00_02_00
        	//menuType = header

            if($('#breadcrumbDep1').length == 0) return;

            var ma = menuType == "header" ? menuArrayH.menu : menuArrayF.menu;

            var menucode = menuId.split('_');
            
            var d1 = Number(menucode[0].replace("F", ""));
            var d2 = Number(menucode[1]);

            var html_dep1 = '';
            var html_dep2 = '';
            var html_dep3 = '';

            html_dep1 += '<button type="button" class="breadcrumb-btn ui-drop" id="uiNavDep1">'+ ma[d1].name +'</button>';
            html_dep1 += '<div class="ui-drop-pnl breadcrumb-list" data-id="uiNavDep1">';
            html_dep1 += '<ul>';

            for(var i=0; i<ma.length; i++) {
                var selCls = d1 === i ? ' class="selected"' : "";

                html_dep1 += '<li><a OnClick="headerMenuClickEvent(\''+ ma[i].link +'\',\''+ ma[i].code +'\',\''+ menuType + '\');" ' + selCls + ' href="javascript:void(0);">'+ ma[i].name +'</a></li>';
            }

            html_dep1 += '</ul>';
            html_dep1 += '</div>';
            
            if( d1 != '0' ) {
            	html_dep2 += '<button type="button" class="breadcrumb-btn ui-drop" id="uiNavDep2">'+ ma[d1].dep2[d2].name +'</button>';
            } else {
            	//나눔캠페인 일 경우 메뉴처리
            	html_dep2 += '<button type="button" class="breadcrumb-btn ui-drop" id="uiNavDep2">';
            	for( var xx=0; xx<ma[d1].dep2.length; xx++ ) {
            		if( ma[d1].dep2[xx].code == "0"+d1 + "_0" + d2 + "_00" )  {
            			html_dep2 += ma[d1].dep2[xx].name;
            			break;
            		}
            	}
            	html_dep2 += '</button>';
            }
            
            html_dep2 += '<div class="ui-drop-pnl breadcrumb-list" data-id="uiNavDep2">';
            html_dep2 += '<ul>';
            
            if( d1 != '0' ) {
            	for(var ii=0; ii<ma[d1].dep2.length; ii++) {
	                var selCls = d2 === ii ? ' class="selected"' : "";
	                html_dep2 += '<li><a OnClick="headerMenuClickEvent(\''+ ma[d1].dep2[ii].link +'\',\''+ ma[d1].dep2[ii].code +'\',\''+ menuType + '\');" ' + selCls + '  href="javascript:void(0);" >'+ ma[d1].dep2[ii].name +'</a></li>';
	            }
            } else {
            	//그냥 하드코딩 하자.뒤죽박죽  나눔캠페인 일 경우 메뉴처리
            	var d2Arr = ["2","0","1"];
            	for( var ii=0; ii<d2Arr.length; ii++ ) {
	            	var link =  ma[d1].dep2[ d2Arr[ii] ].link;
	            	var code =  ma[d1].dep2[ d2Arr[ii] ].code;
	            	var name =  ma[d1].dep2[ d2Arr[ii] ].name;
	            	var selCls = "00_0"+d2+"_00" == ma[d1].dep2[ d2Arr[ii] ].code ? ' class="selected"' : "";
	            	html_dep2 += '<li><a OnClick="headerMenuClickEvent(\''+ link+'\',\''+ code +'\',\''+ menuType + '\');" ' + selCls + '  href="javascript:void(0);" >'+ name +'</a></li>';
            	}
            }

            html_dep2 += '</ul>';
            html_dep2 += '</div>';

            var html_dep3_temp = "";
            if (ma[d1].dep2[d2].dep3 !== undefined) {
                html_dep3 += '<div class="ui-drop-pnl breadcrumb-list" data-id="uiNavDep3">';
                html_dep3 += '<ul>';
                
                if( d1 != '0' ) {
	                for(var iii=0; iii<ma[d1].dep2[d2].dep3.length; iii++) {
	                    var selCls =  "";
	                    if(menuId == ma[d1].dep2[d2].dep3[iii].code) {
	                        html_dep3_temp += '<button type="button" class="breadcrumb-btn ui-drop" id="uiNavDep3">'+ ma[d1].dep2[d2].dep3[iii].name +'</button>';
	                        selCls =  ' class="selected"';
	                    }
	                    html_dep3 += '<li><a OnClick="headerMenuClickEvent(\''+ ma[d1].dep2[d2].dep3[iii].link +'\',\''+ ma[d1].dep2[d2].dep3[iii].code +'\',\''+ menuType + '\');" ' + selCls + ' href="javascript:void(0);">'+ ma[d1].dep2[d2].dep3[iii].name +'</a></li>';
	                }
	                if(html_dep3_temp == "") {
	                    html_dep3_temp = '<button type="button" class="breadcrumb-btn ui-drop" id="uiNavDep3">'+ ma[d1].dep2[d2].dep3[0].name +'</button>';
	                }
                } else {
                	//나눔캠페인 일 경우 메뉴처리
                	for( var xx=0; xx<ma[d1].dep2.length; xx++ ) {
                		if( ma[d1].dep2[xx].code == "0"+d1 + "_0" + d2 + "_00" )  {
                			for( var xxx=0; xxx<ma[d1].dep2[xx].dep3.length; xxx++ ) {
                				var selCls =  "";
        	                    if(menuId == ma[d1].dep2[xx].dep3[xxx].code) {
        	                        html_dep3_temp += '<button type="button" class="breadcrumb-btn ui-drop" id="uiNavDep3">'+ ma[d1].dep2[xx].dep3[xxx].name +'</button>';
        	                        selCls =  ' class="selected"';
        	                    }
        	                    html_dep3 += '<li><a OnClick="headerMenuClickEvent(\''+ ma[d1].dep2[xx].dep3[xxx].link +'\',\''+ ma[d1].dep2[xx].dep3[xxx].code +'\',\''+ menuType + '\');" ' + selCls + ' href="javascript:void(0);">'+ ma[d1].dep2[xx].dep3[xxx].name +'</a></li>';		
                			}
						}
	                }
	                if(html_dep3_temp == "") {
	                    html_dep3_temp = '<button type="button" class="breadcrumb-btn ui-drop" id="uiNavDep3">'+ ma[d1].dep2[d2].dep3[0].name +'</button>';
	                }
                }
                html_dep3 += '</ul>';
                html_dep3 += '</div>';
                html_dep3 = html_dep3_temp + html_dep3;
            }
            
            $('#breadcrumbDep1').append(html_dep1);
            $('#breadcrumbDep2').append(html_dep2);
            $('#breadcrumbDep3').append(html_dep3);

            $plugins.uiDropdown({
                id:'uiNavDep1',
                ps:'bc',
                eff:'st',
                auto: false,
                dim:false,
                openback: function() { console.log('open callback'); },
                closeback: function() { console.log('close callback'); },
                offset:false
            });
            $plugins.uiDropdown({
                id:'uiNavDep2',
                ps:'bc',
                eff:'st',
                auto: false,
                dim:false,
                openback: function() { console.log('open callback'); },
                closeback: function() { console.log('close callback'); },
                offset:false
            });
            $plugins.uiDropdown({
                id:'uiNavDep3',
                ps:'bc',
                eff:'st',
                auto: false,
                dim:false,
                openback: function() { console.log('open callback'); },
                closeback: function() { console.log('close callback'); },
                offset:false
            });
        },
        footer: function () {

        },
        findMenuId: function (pathName, menuType){
            var arrMenuInfo = new Array(2);

            var menuId = "";

            var dep1Bool = true;
            var dep2Bool = true;

            // menuType이 있으면 바로 분기하여 찾고, 없으면 Header Menu에서 먼저 찾고 없으면 Footer Menu에서 추가로 찾는다.
            if(!gf_isNull(menuType)){
                var ma = menuType == "header" ? menuArrayH.menu : menuArrayF.menu;

                for(var i=0; i<ma.length; i++) {
                    for (var ii=0; ii<ma[i].dep2.length; ii++) {

                        if(menuType == "header"){
                            for (var iii=0; iii<ma[i].dep2[ii].dep3.length; iii++) {
                                var link = ma[i].dep2[ii].dep3[iii].link;

                                if(link == pathName){
                                    menuId = ma[i].dep2[ii].dep3[iii].code;

                                    dep2Bool = false;
                                    break;
                                }
                            }

                            if(!dep2Bool){
                                dep1Bool = false;
                                break;
                            }
                        } else {
                            var link = ma[i].dep2[ii].link;

                            if(link == pathName){
                                menuId = ma[i].dep2[ii].code;

                                dep1Bool = false;
                                break;
                            }
                        }
                    }

                    if(!dep1Bool){
                        break;
                    }
                }
            } else {
                // Header Menu 에서 찾기
                var maH = menuArrayH.menu;
                var maF = menuArrayF.menu;

                for(var i=0; i<maH.length; i++) {
                    for (var ii=0; ii<maH[i].dep2.length; ii++) {
                        for (var iii=0; iii<maH[i].dep2[ii].dep3.length; iii++) {
                            var link = maH[i].dep2[ii].dep3[iii].link;

                            if(link == pathName){
                                menuId = maH[i].dep2[ii].dep3[iii].code;

                                dep2Bool = false;
                                break;
                            }
                        }

                        if(!dep2Bool){
                            dep1Bool = false;
                            break;
                        }
                    }

                    if(!dep1Bool){
                        break;
                    }
                }

                dep1Bool = true;
                dep2Bool = true;

                if(!gf_isNull(menuId)){
                    menuType = "header";
                } else {
                    // Header 에 없으면 Footer 에서 찾기
                    for(var i=0; i<maF.length; i++) {
                        for (var ii=0; ii<maF[i].dep2.length; ii++) {
                            var link = maF[i].dep2[ii].link;

                            if(link == pathName){
                                menuId = maF[i].dep2[ii].code;

                                dep1Bool = false;
                                break;
                            }
                        }

                        if(!dep1Bool){
                            break;
                        }
                    }

                    if(gf_isNull(menuId)){
                        menuType = "footer";
                    }
                }
            }

            arrMenuInfo[0] = menuId;
            arrMenuInfo[1] = menuType;

            return arrMenuInfo;
        }
    };

    //page
    $plugins.page = {}

    //callback
    $plugins.callback = {
        modal: function (modalId) {
            $plugins.uiInputClear();
            $plugins.uiCaption();
            (!$plugins.browser.mobile) ? $plugins.uiSelect() : '';

            switch (modalId) {
                case 'modalTest2':
                    break;
            }
        }
    }
})(jQuery, window, document);
