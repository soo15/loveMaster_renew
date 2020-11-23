		$(document).ready(function (){
			var $quickMenu = $(".quick_menu");		//quick_menu 변수선언

			//스크롤이벤트 발생
			$(window).scroll(function(){
				var scrollValue = $(window).scrollTop();		//스크롤 위치변수선언

				//퀵메뉴 가운데 위치값 계산
				var centerPosition = ( $(window).height() - $quickMenu.height() ) / 2 + $(window).scrollTop();

				if (scrollValue < 100) {		//스크롤 위치값이 100 이하
					$quickMenu.stop().animate({'top' : 100 + 'px' }, 1000);
				} else if (scrollValue > 100 ) {		//스크롤 위치값이 100이하
					$quickMenu.stop().animate({'top' : centerPosition + 'px' }, 1000);
				}
				});
			});