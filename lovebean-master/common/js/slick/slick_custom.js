
  //main_hero
      var $main_hero = $('.slider-hero .slider.hero-imgs');
      var $main_v_notice = $('.main_v_notice .slider');
      // var $slick_crowd_camp = $('.slick-crowd-camp .slider');
      // var $slick_camp_namum = $('.slick-camp-namum .slider');
      // var $slick_beanTube = $('.slick-beanTube .slider');
      // var slideCount = null;
      
      //   window.onload = function(){
      //     $('.slider').css("visibility","visible")
      // }

      //$('.slick-beanTube .slider').unbind();
      

      $( document ).ready(function() {

        // hero_slider
        $(".slider-hero .slider.hero-imgs").slick({
          lazyLoad:'ondemaand',
          autoplay:true,
          infinite: true,
          slidesToShow: 1,
          slidesToScroll: 1,
          asNavFor: '.slider-hero .slider.hero-bgs',
          centerMode: true,
          focusOnSelect: true,
          draggable:true,
          autoplay: false,
          arrows: true,
          nextArrow: '.main-hero__next',
          prevArrow: '.main-hero__prev',
          slideCount:10,
        });


        $(".slider-hero .slider.hero-bgs").slick({
          lazyLoad:'ondemaand',
          infinite: true,
          slidesToShow: 1,
          slidesToScroll: 1,
          dots: false,
          autoplay: false,
          focusOnSelect: false,
          asNavFor: '.slider-hero .slider.hero-imgs',
          arrows: false,
        });

    
    
     //<!--notice&campaign-->
    
    $('.main_v_notice .slider').slick({
      lazyLoad:'ondemaand',
      infinite: true,
      dots: false,
      speed: 300,
      slidesToShow: 4,
      slidesToScroll: 1,
      vertical: true,
      verticalSwiping: true,
      focusOnSelect: true,
      adaptiveHeight: true,
      draggable:true,
      arrows:true,
      nextArrow: '.main_notice___next',
      prevArrow: '.main_notice___prev',
      responsive: [
        {
         breakpoint: 1025,
          settings: {
          slidesToShow: 4
        }
        },
        {
          breakpoint: 769,
          settings: {
          slidesToShow: 3 }
        },
        {
          breakpoint: 461,
          settings: {
          slidesToShow: 1,
          slidesToScroll: 1}
        },
        
        ]
    
    });
    
    
    
    //<!--notice&campaign-->
    //강제 이벤트 걸기..
    // slick.main_v_notice();
    //$('.sns_campaign').unbind();
    
    // var slick = {
    // 	main_v_notice : function() {
    // 	$('.main_v_notice .slider').slick({
    // 	 infinite: true,
    // 	 dots: false,
    // 	 speed: 300,
    // 	 slidesToShow: 4,
    // 	 slidesToScroll: 4,
    // 	 vertical: true,
    // 	 verticalSwiping: true,
    // 	 focusOnSelect: true,
    // 	 adaptiveHeight: true,
    // 	 draggable:true,
    // 	 arrows:true,
    // 	 nextArrow: '.main_notice___next',
    // 	 prevArrow: '.main_notice___prev',
    // 	 autoplay: false,
    // 	 autoplaySpeed: 1000,
    // 	 responsive: [
    // 	     {
    // 	      breakpoint: 1024,
    // 	       settings: {
    // 	       slidesToShow: 4,
    // 	       infinite: true,
    // 	       dots: false }
    // 	     },
    // 	     {
    // 	       breakpoint: 768,
    // 	       settings: {
    // 	       slidesToShow: 3,
    // 	       infinite: true,
    // 	       dots: false }
    // 	     },
    // 	     {
    // 	       breakpoint: 480,
    // 	       settings: {
    // 	       slidesToShow: 3,
    // 	       infinite: true,
    // 	       dots: false }
    // 	     },
           
    // 	     ]
      
    // 	});
    // 	}
    // 	}
     
    
      // crowd
    
    $('.slick-crowd-camp .slider').slick({
      lazyLoad:'ondemaand',
      infinite: true,
      autoplay: false,
      dots: false,
      slidesToShow: 3,
      slidesToScroll: 1,
      focusOnSelect: true,
      swipe:true,
      draggable:true,
      arrows:true,
      nextArrow: '.crowd-camp_next',
      prevArrow: '.crowd-camp_prev',
      responsive: [
          {
           breakpoint: 1025,
            settings: { 
            slidesToShow: 3,
            slidesToScroll: 3} 
          },
          {
            breakpoint: 769,
            settings: { 
            slidesToShow: 2,
            slidesToScroll: 2} 
          },
          {
            breakpoint: 461,
            settings: { 
              slidesToShow: 1,
              slidesToScroll: 1} 
          },
          ]
    });
    
    
    // nanum
    
    $('.slick-camp-namum .slider').slick({
      lazyLoad:'ondemaand',
      infinite: true,
      autoplay: false,
      dots: false,
      slidesToShow: 3,
      slidesToScroll: 1,
      focusOnSelect: true,
      swipe:true,
      draggable:true,
      arrows:true,
      nextArrow: '.crowd-nanum_next',
      prevArrow: '.crowd-nanum_prev',
      responsive: [
        {
         breakpoint: 1025,
          settings: { 
          slidesToShow: 3,
          slidesToScroll: 3} 
        },
        {
          breakpoint: 769,
          settings: { 
          slidesToShow: 2,
          slidesToScroll: 2} 
        },
        {
          breakpoint: 461,
          settings: { 
          slidesToShow: 1,
          slidesToScroll: 1} 
        },
        ]
    });
    
    // beanTube
    
    $('.slick-beanTube .slider').slick({
      lazyLoad:'ondemaand',
      infinite: true,
      autoplay: false,
      dots: false,
      slidesToShow: 3,
      slidesToScroll: 1,
      focusOnSelect: true,
      swipe:true,
      draggable:true,
      arrows:true,
      nextArrow: '.beanTube_next',
      prevArrow: '.beanTube_prev',
      responsive: [
          {
           breakpoint: 1025,
            settings: { 
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true } 
          },
          {
            breakpoint: 769,
            infinite: true,
            settings: { 
            slidesToShow: 3,
            slidesToScroll: 3 } 
          },
          {
            breakpoint: 461,
            infinite: true,
            settings: { 
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            arrows:false } 
          },
          ]
    });


    // sns

        $('.sns_campaign').slick({
        lazyLoad:'ondemaand',
        slide: 'a',
        slidesToShow: 1,
        slidesToScroll: 1, 
        arrows: true,
        prevArrow: '<span class="slick-prev">Previous</span>',
        nextArrow: '<span class="slick-next">Next</span>',
        dots: false,
        infinite: true,
        speed: 300,
        swipeToSlide: false,
        cssEase: 'cubic-bezier(0,0,.18,1)',
        responsive: [
          {
           breakpoint: 1025,
            settings: { 
            slidesToShow: 5,
            slidesToScroll: 1,
            infinite: true } 
          },
          {
            breakpoint: 769,
            settings: {
              slidesToShow: 4,
              slidesToScroll: 4,
            }
          },
          {
            breakpoint: 461,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2,
            }
          }
        ]
        });

        /* [START] Custom Rewind function for slick.js */
        let slickRewindDetector = false;

        // A better solution to prevent nest the event handlers
        $('.sns_campaign.rewind').on('click', $('.slick-prev, .slick-next'), function(){
        slickRewindDetector = true;
        });

        $('.sns_campaign.rewind').on('afterChange', function(event, slick){
        if ( slickRewindDetector ) {
          slickRewindDetector = false; // Reset the trigger


          let slickSlideToShow = $(this).slick('slickGetOption', 'slidesToShow');

          if ( slick.currentSlide == 0 ) { // If current slide is first page
            $(this).slick('slickGoTo', slick.slideCount - 1); // Then go to the last page
          } else if ( slick.slideCount - slick.currentSlide <= slickSlideToShow ) { // If last slide has 'active' class
            $(this).slick('slickGoTo', 0); // Then go to the firs page
          }

        }
        });


    });
    

    
    $main_hero.on('init', function(event, slick){
      slideCount = slick.slideCount;
      setSlideCount();
      setCurrentSlideNumber(slick.currentSlide);
    });

    $main_hero.on('beforeChange', function(event, slick, currentSlide, nextSlide){
      setCurrentSlideNumber(nextSlide);
    });

    function setSlideCount() {
      var $el = $('.pagination').find('.total');
      $el.text(slideCount);
    }

    function setCurrentSlideNumber(currentSlide) {
      var $el = $('.pagination').find('.current');
      $el.text(currentSlide + 1);
    }

    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
      $(e.target).find('.slider-hero .slider').each(function() {
        $(this).slick('setPosition');
      })
    });






