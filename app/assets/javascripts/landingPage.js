$(document).ready(function() {
  $(".nav-menu").bind("mousewheel", function (ev, delta) {
      var scrollTop = $(window).scrollTop();
      $(window).scrollTop(scrollTop - Math.round(delta * 20));
  });

  var animationDone = true;
  
  $(".nav-expand").click(function() {
    if( $(".nav-menu").css("display") != 'none' ) {
      if(animationDone) {
        animationDone = false;
        $(".nav-menu").stop(true, true).toggle('slide', 400);

        $(".nav-expand").stop(true, true).animate({
          "left" : "0",
          "width" : "100%",
        }, function() {
          $(this).animate({"height" : "10px"}, function() {
            $(this).addClass("collapsed");
          });
        });

        $(".content").stop(true, true).animate({"margin-left": "0"}, function() {
          animationDone = true;
        });
      }
    }
    else {
      if(animationDone) {
        animationDone = false;
        $(".content").stop(true, true).animate({"margin": "0 0 0 300px"});
        $(".nav-expand").stop(true, true).animate({
          "left" : "315px",
          "width" : "50px",
          "height" : "50px"
        }, function() {
          $(this).removeClass("collapsed");
        });
        $(".nav-menu").stop(true, true).toggle('slide', 400, function() {
          animationDone = true;
        });
      }
    }
  });


  $(".nav-expand").on("mouseenter", function() {
    if( $(this).hasClass("collapsed") ) {
      $(this).stop().animate({"height" : "50px"}, function() {
        $(".collapsed-nav").fadeIn();
      });
    }
  });

  $(".nav-expand").on("mouseleave", function() {
    if( $(this).hasClass("collapsed") ) {
      if(animationDone) {
        $(this).stop().animate({"height" : "10px"});
      }
    }
  });
});