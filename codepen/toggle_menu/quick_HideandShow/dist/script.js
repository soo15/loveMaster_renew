$(function() {
  $('.hide-menu-box').css(
    'height', ($(window).height()) + 'px');
  $('.hide-menu-title').css(
    'top', ($(window).height() / 3) + 'px');

  $('.menu-title-show').click(function() {
    $('.menu-title-close, .menu-title-show').toggle();
    $('.hide-menu-box').stop(true).animate({
      marginRight: 0
    }, 600)

    $('.hide-menu-title').stop(true).animate({
      marginRight: 500
    }, 600)
  })

  $('.menu-title-close').click(function() {
    $('.menu-title-show, .menu-title-close').toggle();
    $('.hide-menu-box').stop(true).animate({
      marginRight: -500
    }, 600)
    $('.hide-menu-title').stop(true).animate({
      marginRight: 0
    }, 600)
  })

  $(document).click(function(e) {
    if ($(e.target).parents('.hide-menu').length <= 0 && $('.menu-title-close').is(':visible')) {
      $('.menu-title-close').trigger('click');
    };
  })
})
