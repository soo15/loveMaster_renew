
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
$('.vertical-mode .slider').slick({
  autoplay: false,
  dots: true,
  slidesToShow: 5,
  vertical: true,
});


$('.slick-2-2 .slider').slick({
  autoplay: false,
  dots: true,
  slidesToShow: 2,
  slidesToScroll: 2,
});


  //CENTER MODE AND AS NAV FOR
$(".centerMode-asNavFor .slider.thumbs").slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  asNavFor: '.centerMode-asNavFor .slider.text',
  dots: false,
  arrows: false,
  centerMode: true,
  focusOnSelect: true
});
$(".centerMode-asNavFor .slider.text").slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  autoplay: false,
  asNavFor: '.centerMode-asNavFor .slider.thumbs'
});

$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
  $(e.target).find('.slider').each(function() {
    $(this).slick('setPosition');
  })
})



