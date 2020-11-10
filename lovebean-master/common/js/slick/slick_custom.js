
  //main_hero
      var $main_hero = $('.slider-hero .slider.hero-imgs');
      var $main_v_notice = $('.main_v_notice .slider');
      var $slick_crowd_camp = $('.slick-crowd-camp .slider');
      var $slick_camp_namum = $('.slick-camp-namum .slider');
      var $slick_beanTube = $('.slick-beanTube .slider');
      var slideCount = null;
      
      $( document ).ready(function() {

        // hero_slider
        $(".slider-hero .slider.hero-imgs").slick({
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
         breakpoint: 1024,
          settings: {
          slidesToShow: 4,
          infinite: true,
          dots: false }
        },
        {
          breakpoint: 768,
          settings: {
          slidesToShow: 3,
          infinite: true,
          dots: false }
        },
        {
          breakpoint: 460,
          settings: {
          slidesToShow: 1,
          infinite: true,
          dots: false }
        },
        
        ]
    
    });
    
    
    
    //<!--notice&campaign-->
    //강제 이벤트 걸기..
    // slick.main_v_notice();
    
    
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
      infinite: true,
      autoplay: false,
      dots: false,
      slidesToShow: 3,
      slidesToScroll: 3,
      focusOnSelect: true,
      swipe:true,
      draggable:true,
      arrows:true,
      nextArrow: '.crowd-camp_next',
      prevArrow: '.crowd-camp_prev',
      responsive: [
          {
           breakpoint: 1024,
            settings: { 
            slidesToShow: 2,
            infinite: true,
            dots: false } 
          },
          {
            breakpoint: 768,
            settings: { 
            slidesToShow: 2,
            infinite: true,
            dots: false } 
          },
          {
            breakpoint: 460,
            settings: { 
            slidesToShow: 2,
            infinite: true,
            dots: false } 
          },
           
          ]
    });
    
    
    // nanum
    
    $('.slick-camp-namum .slider').slick({
      infinite: true,
      autoplay: false,
      dots: false,
      slidesToShow: 3,
      slidesToScroll: 3,
      focusOnSelect: true,
      swipe:true,
      draggable:true,
      arrows:true,
      nextArrow: '.crowd-nanum_next',
      prevArrow: '.crowd-nanum_prev',
      responsive: [
          {
           breakpoint: 1024,
            settings: { 
            slidesToShow: 2,
            infinite: true,
            dots: false } 
          },
          {
            breakpoint: 768,
            settings: { 
            slidesToShow: 2,
            infinite: true,
            dots: false } 
          },
          {
            breakpoint: 460,
            settings: { 
            slidesToShow: 2,
            infinite: true,
            dots: false } 
          },
           
          ]
    });
    
    // beanTube
    
    $('.slick-beanTube .slider').slick({
      infinite: true,
      autoplay: false,
      dots: false,
      slidesToShow: 3,
      slidesToScroll: 3,
      focusOnSelect: true,
      swipe:true,
      draggable:true,
      arrows:true,
      nextArrow: '.beanTube_next',
      prevArrow: '.beanTube_prev',
      responsive: [
          {
           breakpoint: 1024,
            settings: { 
            slidesToShow: 3,
            infinite: true,
            dots: false } 
          },
          {
            breakpoint: 768,
            infinite: true,
            settings: { 
            slidesToShow: 3,
            dots: false } 
          },
          {
            breakpoint: 460,
            infinite: true,
            settings: { 
            slidesToShow: 2,
            infinite: true,
            arrows:false,
            dots: true } 
          },
          ]
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
        
   
  

        
   



