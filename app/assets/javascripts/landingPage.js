$(document).ready(function() {
  $(".nav-menu").bind("mousewheel", function (ev, delta) {
      var scrollTop = $(window).scrollTop();
      $(window).scrollTop(scrollTop - Math.round(delta * 20));
  });


  $(".clicktest").click(function() {

    if( $(".nav-menu").css("display") != 'none' ) {
      $(".nav-menu").toggle("slide", function() {
        $(".content").css({"margin": "0 auto"});
      });
    }
    else {
      $(".nav-menu").toggle("slide", function() {
        $(".content").css({"margin": "0 0 0 300px"});
      });      
    }
  });
});