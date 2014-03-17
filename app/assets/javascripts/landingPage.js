$(document).ready(function() {
  $(".nav-menu").bind("mousewheel", function (ev, delta) {
      var scrollTop = $(window).scrollTop();
      $(window).scrollTop(scrollTop - Math.round(delta * 20));
  });

  var animationDone = true;
  
  $(".clicktest").click(function() {

    if( $(".nav-menu").css("display") != 'none' ) {
      if(animationDone) {
        animationDone = false;
        $(".nav-menu").stop(true, true).toggle('slide', 400);
        $(".content").stop(true, true).animate({"margin-left": "0"}, function() {
          animationDone = true;
        });
      }
    }
    else {
      if(animationDone) {
        animationDone = false;
        $(".content").stop(true, true).animate({"margin": "0 0 0 300px"});
        $(".nav-menu").stop(true, true).toggle('slide', 400, function() {
          animationDone = true;
        });
      }
    }
  });
});