$('.slick-slider').slick({
  // centerMode: true,
  slidesToShow: 4,
  dots: false,
  arrows: true,
  swipe: true,
  swipeToSlide: true,

   responsive: [
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 1,
        centerMode: true
      }
    },
    {
      breakpoint: 800,
      settings: {
        slidesToShow: 2,
        centerMode: true
      }
    },
    {
      breakpoint: 1000,
      settings: {
        slidesToShow: 3,
      }
    },
  ]
   
});


/*$('.slick-slider').on('beforeChange', function(event, slick, currentSlide, nextSlide){
  changecolor("white", 0);
});
$('.slick-slider').on('afterChange', function(event, slick, currentSlide, nextSlide){
  changecolor("red", 30);
});
function changecolor(color, padding) { 
  $('.slick-slider .slick-current').css("background-color", color);
  $('.slick-slider .slick-current').css("padding", padding);
  //$('.slick-slider').slick("setPosition");
//  $('.slick-slider').slick('resize');
}
changecolor("red", 30);*/