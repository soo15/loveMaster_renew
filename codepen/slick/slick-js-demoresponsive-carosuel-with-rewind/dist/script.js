$(document).ready(function(){
  $('.js-carousel').slick({
    slide: 'a',
    slidesToShow: 4,
    slidesToScroll: 4, // swipeToSlide has to set to false
    arrows: true,
    prevArrow: '<span class="slick-prev">Previous</span>',
    nextArrow: '<span class="slick-next">Next</span>',
    dots: false,
    infinite: false,
    speed: 300,
    swipeToSlide: false,
    cssEase: 'cubic-bezier(0,0,.18,1)',
    responsive: [
      {
        breakpoint: 961,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3
        }
      },
      {
        breakpoint: 769,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 667,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
  
  /* [START] Custom Rewind function for slick.js */
  let slickRewindDetector = false;

  // A better solution to prevent nest the event handlers
  $('.js-carousel.rewind').on('click', $('.slick-prev, .slick-next'), function(){
    // console.log('currentSlide: ' + $(this).slick('slickCurrentSlide'));
    slickRewindDetector = true;
  });

  $('.js-carousel.rewind').on('afterChange', function(event, slick){
    if ( slickRewindDetector ) {
      slickRewindDetector = false; // Reset the trigger

      // console.log(slick);
      // console.log('currentSlide: ' + $(this).slick('slickCurrentSlide'));
      // console.log('slidesToShow: ' + $(this).slick('slickGetOption', 'slidesToShow'));
      // console.log('slidesToScroll: ' + $(this).slick('slickGetOption', 'slidesToScroll'));

      let slickSlideToShow = $(this).slick('slickGetOption', 'slidesToShow');

      if ( slick.currentSlide == 0 ) { // If current slide is first page
        $(this).slick('slickGoTo', slick.slideCount - 1); // Then go to the last page
      } else if ( slick.slideCount - slick.currentSlide <= slickSlideToShow ) { // If last slide has 'active' class
        $(this).slick('slickGoTo', 0); // Then go to the firs page
      }

    }
  });
  /* [END] Custom Rewind function for slick.js */
});