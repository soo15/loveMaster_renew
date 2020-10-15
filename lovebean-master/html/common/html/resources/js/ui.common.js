
; (function ($, win, doc, undefined) {

	'use strict';
	console.log('mobile common');

	$plugins.common = {
		init: function (opt) {

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

			$plugins.uiAjax({ 
                id:'baseHeader', 
                url:'/inc/header.html',
                page:true,
				callback:function(){
                    $plugins.common.header(opt);
                }
            });

			$plugins.uiAjax({ 
                id:'baseFooter', 
                url:'/inc/footer.html',
                page:true,
				callback:function(){
                    $plugins.common.footer(opt);
                }
            });

            
		},

		header: function (opt) {
			var $nav = $('#baseNav'),
				$li_1 = $nav.find('.nav-main-1'),
				$btn_1 = $nav.find('.nav-btn-1'),
				timer,
				menucode = opt.menuid.split('_');

			console.log(Number(menucode[0]))
			
			$('.ui-menu').on('click', function(){
				$('.header-mobile').addClass('on');
			});
			$('.menu-wrap .btn-close').on('click', function(){
				$('.header-mobile').removeClass('on');
			});


			$li_1.eq(Number(menucode[0]) - 1).find('.nav-btn-1').addClass('selected');
			$li_1.eq(Number(menucode[0]) - 1)
			.find('.nav-sub > div').eq(Number(menucode[1])).addClass('selected')
			.find('li').eq(Number(menucode[2]) - 1).find('a').addClass('selected');

			$btn_1.on('mouseover focus', function(){
				clearTimeout(timer);
				$plugins.common.navShow(this);
			}).on('mouseleave blur', function(){
				hideTimer();
			});
			$('.nav-sub, .nav-sub a').on('mouseover focus', function(){
				clearTimeout(timer);
			}).on('mouseleave', function(){
				hideTimer();
			});

			function hideTimer() {
				timer = setTimeout(function(){
					$plugins.common.navHide();
				},200);
			}

            $plugins.uiAjax({
                id:'baseBreadcrumbs',
                url:'/inc/breadcrumbs.html',
                page:true,
                callback: function(){
                    $plugins.common.breadCrumbs(menucode[0], menucode[1]);
                }
            });


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
                current:[0], 
                autoclose:true, 
                callback:function(v){console.log(v)} 
            });
            $plugins.uiAccordion({ 
                id:'AccoNavDepth2-1', 
                current:[0], 
                autoclose:true, 
                callback:function(v){console.log(v)} 
            });
            $plugins.uiAccordion({ 
                id:'AccoNavDepth2-2', 
                current:[0], 
                autoclose:true, 
                callback:function(v){console.log(v)} 
            });
            $plugins.uiAccordion({ 
                id:'AccoNavDepth2-3', 
                current:[0], 
                autoclose:true, 
                callback:function(v){console.log(v)} 
            });
            $plugins.uiAccordion({ 
                id:'AccoNavDepth2-4', 
                current:[0], 
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

        breadcrumb: function (opt) {
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
			console.log('footer');
		}
	};
	//page
	$plugins.page = {}

	//callback
	$plugins.callback = {
		modal: function (modalId) {

			switch (modalId) {
				case 'modalTest2':

					break;
			}
		}
	}
})(jQuery, window, document);
