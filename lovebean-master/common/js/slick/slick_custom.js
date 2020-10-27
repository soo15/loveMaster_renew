
  //main_hero
  $(".slider-hero .slider.hero-imgs").slick({
    infinite: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    asNavFor: '.slider-hero .slider.hero-bgs',
    dots: false,
    arrows: false,
    centerMode: true,
    focusOnSelect: true,
    arrows: true,
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
  
  
  $('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
    $(e.target).find('.slider-hero .slider').each(function() {
      $(this).slick('setPosition');
    })
  })



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
  arrows: true,
  centerPadding: '50px',
});
 

  // crowd

$('.slick-crowd-camp .slider').slick({
  infinite: true,
  autoplay: false,
  dots: false,
  slidesToShow: 3,
  slidesToScroll: 1,
  swipe:true,
  arrows: true,
});

// nanum

$('.slick-camp-namum .slider').slick({
  infinite: true,
  autoplay: false,
  dots: false,
  slidesToShow: 3,
  slidesToScroll: 1,
  swipe:true,
  arrows: true,
});

// beanTube

$('.slick-beanTube .slider').slick({
  infinite: true,
  autoplay: false,
  dots: false,
  slidesToShow: 3,
  slidesToScroll: 1,
  swipe:true,
  arrows: true,
});






