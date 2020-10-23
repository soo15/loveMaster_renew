var slickCarousel = $('.slider-vertical');
slickCarousel.slick({
    dots: true,
    infinite: false,
    speed: 300,
    slidesToShow: 3,
    slidesToScroll: 3,
    vertical: true,
    verticalSwiping: true,
    dots: false,
    centerPadding: '50px',
    arrows: true,
    prevArrow: '<button type="button" data-role="none" class="slick-prev" aria-label="Previous" tabindex="0" role="button">Previous</button>',
    nextArrow: '<button type="button" data-role="none" class="slick-next" aria-label="Next" tabindex="0" role="button">Next</button>',
    responsive: [{
            breakpoint: 1024,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 2,
                infinite: true,
            }
        }, {
            breakpoint: 639,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1,
			    vertical: false,
			    verticalSwiping: false,
            }
        }
        // You can unslick at a given breakpoint now by adding:
        // settings: "unslick"
        // instead of a settings object
    ]
});


//mouse wheel
slickCarousel.mousewheel(function(e) {
e.preventDefault();
    if (e.deltaY < 0) {
        $(this).slick('slickNext'); 
    }
    else {
        $(this).slick('slickPrev');
    }
});