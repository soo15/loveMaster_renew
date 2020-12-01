

 function slickGroup() {
    slick = new Slick('.sns_campaign', {
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
    slick1 = new Slick('.slider-hero .slider.hero-imgs', {
      lazyLoad:'ondemaand',
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

    slick2 = new Slick('.slick-crowd-camp .slider', {
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

    slick3 = new Slick('.slick-camp-namum .slider', {
      lazyLoad:'ondemaand',
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
}

$('#mainBn1_next').on('click', function () {
    swiper2.slideNext();
});
$('#mainBn1_prev').on('click', function () {
    swiper2.slidePrev();
});
$('#mainBn2_next').on('click', function () {
    swiper3.slideNext();
})
$('#mainBn2_prev').on('click', function () {
    swiper3.slidePrev();
})