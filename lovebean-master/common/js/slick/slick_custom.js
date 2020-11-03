
  //main_hero
      var $main_hero = $('.slider-hero .slider.hero-imgs');
      var slideCount = null;
      
      $( document ).ready(function() {
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




 //<!--notice&campaign-->

$('.main_v_notice .slider').slick({
  infinite: true,
  dots: false,
  speed: 300,
  slidesToShow: 4,
  slidesToScroll: 4,
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
        dots: true } 
      },
      {
        breakpoint: 768,
        settings: { 
        slidesToShow: 3,
        infinite: true,
        dots: true } 
      },
      {
        breakpoint: 480,
        settings: { 
        slidesToShow: 3,
        infinite: true,
        dots: true } 
      },
       
      ]

});
 

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
        breakpoint: 1024,   //width 1024 이상부터
        settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
        }
    },
    {
        breakpoint: 375,   //width 1024 이상부터
        settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
        }
    }
  ]
});






