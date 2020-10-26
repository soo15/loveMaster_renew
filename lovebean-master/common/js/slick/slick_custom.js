
  // $('.slider-for').slick({
  //   slidesToShow: 1,
  //   slidesToScroll: 1,
  //   arrows: false,
  //   fade: true,
  //   asNavFor: '.slider-nav',
  //   focusOnSelect: false
  // });
  // $('.slider-nav').slick({
  //   arrows: true,
  //   dots: false,
  //   infinite: true,
  //   slidesToShow: 1,
  //   asNavFor: '.slider-for',
  //   centerMode: true,
  //   focusOnSelect: true
  // });

  //RESPONSIVE SLICK


//VERTICAL MODE


$('.main_v_notice .slider').slick({
  dots: false,
  infinite: true,
  speed: 300,
  slidesToShow: 4,
  slidesToScroll: 4,
  vertical: true,
  verticalSwiping: true,
  focusOnSelect: true,
  centerPadding: '50px',
  arrows: true,
});


// E


$('.slick-2-2 .slider').slick({
  autoplay: false,
  dots: false,
  slidesToShow: 3,
  slidesToScroll: 3,
  swipe:true,
  arrows: true,
});


  //CENTER MODE AND AS NAV FOR
$(".slider-hero .slider.hero-imgs").slick({
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
  slidesToShow: 1,
  slidesToScroll: 1,
  dots: false,
  autoplay: false,
  focusOnSelect: false,
  asNavFor: '.slider-hero .slider.hero-imgs',
  arrows: false,
});

$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
  $(e.target).find('.slider').each(function() {
    $(this).slick('setPosition');
  })
})



