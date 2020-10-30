
  //main_hero
  $(".slider-hero .slider.hero-imgs").slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    asNavFor: '.slider-hero .slider.hero-bgs',
    centerMode: true,
    focusOnSelect: true,
    draggable:true,
    autoplay: false,
    dots: false,
    arrows: true,
    nextArrow: '.main-hero__next',
    prevArrow: '.main-hero__prev',
    // lazyLoad: 'ondemand',
    // nextArrow: '<button class="slick-next" type="button"><span class="slick-visually-hidden">Next</span><svg class="ico" aria-hidden="true" focusable="false" width="20" height="20"><use xlink:href="#ico-arrow-right"></use></svg></button>',
    // prevArrow: '<button class="slick-prev" type="button"><span class="slick-visually-hidden">Previous</span><svg class="ico" aria-hidden="true" focusable="false" width="20" height="20"><use xlink:href="#ico-arrow-left"></use></svg></button>'
    
    // nextArrow: '.next_caro',
    // prevArrow: '.previous_caro'
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
  

      
  // $(".v_notice_contents").on('mouseover', function(){
  //   $('strong:after').text('마우스 포인터가 노란색원 안에 있습니다. ');
  // });
  
  // $(".v_notice_contents").on('mouseleave', function(){
  //   $('strong:after').text('');
  // });\

  // $('.carousel-content').slick({
  //     prevArrow:"<img class='a-left control-c prev slick-prev' src='../images/shoe_story/arrow-left.png'>",
  //     nextArrow:"<img class='a-right control-c next slick-next' src='../images/shoe_story/arrow-right.png'>"
  // });
  
    $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
      $(e.target).find('.slider-hero .slider').each(function() {
        $(this).slick('setPosition');
      })

  });



  // main_sidebanner

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
            slidesToShow: 2,
            slidesToScroll: 2
        }
    }
  ]
});






