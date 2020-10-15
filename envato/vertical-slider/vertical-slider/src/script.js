
moreProductsSlider();
function moreProductsSlider() {

  // Cache elements
  var $productsOuter = $('.vs-products-outer');
  // Get row height
  var rowHeight = $('.vs-slides-inner').height();
  // Set control click state
  var canClick = true;

  // Slide Up
  $('.vs-control.down').click(function(){

    var $activeRow = $('.vs-products.active');

    // Check if there is a next row to slide to
    if($activeRow.next().length && canClick){
      canClick = false;
      // Get animation distance
      var distance = -(parseInt($activeRow.data('row-num')) * rowHeight);

      $productsOuter.velocity({
        top: distance
      }, 500, function() {
        canClick = true;
        // Change active row
        $activeRow.removeClass('active').next().addClass('active');
        // Activate other control
        $('.vs-control.up').removeClass('deactivate');

        // If there is no next row
        if(!$('.vs-products.active').next().length){
          $('.vs-control.down').addClass('deactivate');
        }
      });
    }

  });

  // Slide Down
  $('.vs-control.up').click(function(){

    var $activeRow = $('.vs-products.active');

    // Check if there is a next row to slide to
    if($activeRow.prev().length && canClick){
      canClick = false;
      // Get animation distance
      var distance = -(parseInt($activeRow.data('row-num')-2) * rowHeight);

      $productsOuter.velocity({
        top: distance
      }, 500, function() {
        canClick = true;
        // Change active row
        $activeRow.removeClass('active').prev().addClass('active');
        // Activate other control
        $('.vs-control.down').removeClass('deactivate');

        // If there is no next row
        if(!$('.vs-products.active').prev().length){
          $('.vs-control.up').addClass('deactivate');
        }
      });
    }
  });

  return this;
};