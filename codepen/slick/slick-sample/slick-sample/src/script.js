let slider = $('.slider');
let nav = slider.clone().removeClass().addClass("slider-nav").appendTo(slider.parent());

slider.slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false,
  fade: true,
  asNavFor: '.slider-nav'
});

nav.slick({
  slidesToShow: 3,
  slidesToScroll: 1,
  asNavFor: '.slider',
  dots: true,
  centerMode: true,
  focusOnSelect: true
});