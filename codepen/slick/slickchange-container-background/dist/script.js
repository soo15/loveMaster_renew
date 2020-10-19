const setColor = (ele) => {
  if (ele.data("color")) {
    ele.closest(".slider-container").css("background-color", ele.data("color"));
  }
};

$("#your-slider")
  .on("init", (slick) => {
    setColor($(slick.target).find(".slick-active"));
  })
  .slick()
  .on("beforeChange", (event, slick, currentSlide, nextSlide) => {
    setColor(slick.$slider.find(`[data-slick-index=${nextSlide}]`));
  });