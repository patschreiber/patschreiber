var animationDone = true;
var timeout;

$(document).ready(function() {
  $(".nav-menu").bind("mousewheel", function (ev, delta) {
      var scrollTop = $(window).scrollTop();
      $(window).scrollTop(scrollTop - Math.round(delta * 20));
  });

  if( getCookie("collapsed_nav") ) {
    $(".nav-menu").hide();
    $(".nav-arrow").hide();
    $(".content").css({"margin-left" : "0"});
    $(".nav-expand").addClass("collapsed").css({
      "left" : "0", 
      "width" : "100%",
      "height" : "10px"
    });
  }

  
  $(".nav-expand").click(function() {
    collapseHeader();
  });

  // Stops the click event bubbling to the nav-expand click handler, which deletes the collapsed_nav cookie.
  $(".nav-expand a").click(function(e) {
    e.stopPropagation();
  });


  $('.nav-menu').on("mouseenter", function() {
    $('.nav-menu-arrow').stop(true, false).fadeIn("fast");
  }).on("mouseleave", function() {
    $('.nav-menu-arrow').stop(true, false).fadeOut("fast");
  });


  $('#nav-menu-arrow-top').on("mouseenter", function() {
    var scroll = $('.nav-menu-content').scrollTop();
    timeout = setInterval(function() {
      scroll = scroll - 60;
      $('.nav-menu-content').animate({
        scrollTop: scroll
      });
    }, 100);
  }).on("mouseup mouseleave", function() {
    scroll = $('.nav-menu-content').scrollTop();
    $('.nav-menu-content').stop(true, false);
    clearInterval(timeout);
  });


  $('#nav-menu-arrow-bottom').on("mouseenter", function() {
    var scroll = $('.nav-menu-content').scrollTop();
    timeout = setInterval(function() {
      scroll = scroll + 60;
      $('.nav-menu-content').animate({
        scrollTop: scroll
      });
    }, 100);
  }).on("mouseup mouseleave", function() {
    scroll = $('.nav-menu-content').scrollTop();
    $('.nav-menu-content').stop(true, false);
    clearInterval(timeout);
  });


  $(".nav-expand").on("mouseenter", function() {
    if( $(this).hasClass("collapsed") ) {
      $(this).stop().animate({"height" : "50px"}, function() {
        $(".collapsed-nav").fadeIn("fast");
      });
    }
  }).on("mouseleave", function() {
    if( $(this).hasClass("collapsed") ) {
      if(animationDone) {
        $(".collapsed-nav").fadeOut();
        $(this).stop().animate({"height" : "10px"});
      }
    }
  });
});


function collapseHeader( ) {
  if( $(".nav-menu").css("display") != 'none' ) {
    if(animationDone) {
      animationDone = false;
      $(".nav-arrow").fadeOut("fast");
      $(".nav-menu").stop(true, true).toggle('slide', 400);
      $(".collapsed-nav").fadeIn("fast");
      $(".nav-expand").stop(true, true).animate({
        "left" : "0",
        "width" : "100%",
      }, function() {
        $(this).animate({"height" : "10px"}, function() {
          $(this).addClass("collapsed");
          $(".collapsed-nav").fadeOut();
          $(this).stop().animate({"height" : "10px"});
        });
      });

      $(".content").stop(true, true).animate({"margin-left": "0"}, function() {
        animationDone = true;
      });

      //Sets cookie to always load the collapsed nav
      setCookie( "collapsed_nav", "true", 30, "patschreiber.com" );
    }
  }
  else {
    if(animationDone) {
      animationDone = false;
      $(".collapsed-nav").hide();
      $(".content").stop(true, true).animate({"margin" : "0 0 0 300px"});
      $(".nav-expand").stop(true, true).animate({
        "left" : "315px",
        "width" : "50px",
        "height" : "50px"
      }, function() {
        $(this).removeClass("collapsed");
      });
      $(".nav-menu").stop(true, true).toggle('slide', 400, function() {
        $(".collapsed-nav").hide();
        $(".nav-arrow").fadeIn("fast");
        animationDone = true;
      });

      deleteCookie( "collapsed_nav", "patschreiber.com" );
    }
  }
}