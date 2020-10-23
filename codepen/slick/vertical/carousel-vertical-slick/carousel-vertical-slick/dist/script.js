var slickCarousel = $('.slider-vertical');
slickCarousel.slick({
    infinite: true,
    speed: 300,
    slidesToShow: 2,
    slidesToScroll: 1,
    vertical: true,
    verticalSwiping: true,
    dots: false,
    autoplay: true,
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