jQuery(function($){
  /******************************************
  init
  ******************************************/ 
  var startPos = 0,winScrollTop = 0;
  
  $('.img-container').waypoint(function(direction){
    var activePoint = $(this.element);
    
    if (direction === 'down') {//scroll down
      activePoint.addClass('active');
    }
  },{offset : '70%'});

  $('.text-container').waypoint(function(direction){
    var activePoint = $(this.element);
    
    if (direction === 'down') {//scroll down
      activePoint.addClass('active');
    }
  },{offset : '70%'});
  
  /******************************************
  window scroll
  ******************************************/ 
  $(window).on('scroll',function(){
    winScrollTop = $(this).scrollTop();
    if (winScrollTop >= startPos) {
      if(winScrollTop >= 200){
        $('.site-header').addClass('hide');
      }
    } else {
      $('.site-header').removeClass('hide');
    }
    startPos = winScrollTop;
  });
}); 