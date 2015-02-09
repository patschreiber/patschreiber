(function(){
  var animationDone = true;
  var timeout;

  var styles = {
    collapsed: {
      content: {
        "margin-left" : "0"
      },
      navExpand: {
        "left" : "0",
        "width" : "100%",
        "height" : "50px"
      }
    },
    expanded: {
      content: {
        "margin" : "0 0 0 300px"
      },
      navExpand: {
        "left" : "310px",
        "width" : "20px",
        "height" : "50px"
      }
    }
  }

  $(document).ready(function() {
    $(".nav-menu").bind("mousewheel", function (ev, delta) {
        var scrollTop = $(window).scrollTop();
        $(window).scrollTop(scrollTop - Math.round(delta * 20));
    });

    if( getCookie("collapsed_nav") ) {
      if ( Modernizr.touch ) {
        $(".nav-menu, .nav-arrow, #navigation-icon").hide();
        $('.collapsed-nav, #navigation-icon-collapsed').show();
        $(".content").css(styles.collapsed.content);
        $(".nav-expand").addClass("collapsed").css(styles.collapsed.navExpand);
      }
      else {
        $(".nav-menu, .nav-arrow, #navigation-icon").hide();
        $(".content").css({"margin-left" : "0"});
        $(".nav-expand").addClass("collapsed").css({
          "left" : "0", 
          "width" : "100%",
          "height" : "10px"
        });
      }
    }

    
    $(".nav-expand").click(function() {
      if ( Modernizr.touch ) {
        collapseHeaderMobile();
      }
      else {
        collapseHeader();
      }
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

    if ( !Modernizr.touch ) {
      $(".nav-expand").on("mouseenter", function() {
        if( $(this).hasClass("collapsed") ) {
          $(this).stop().animate({"height" : "50px"}, function() {
            $(".collapsed-nav, #navigation-icon-collapsed").fadeIn("fast");
          });
        }
      }).on("mouseleave", function() {
        if( $(this).hasClass("collapsed") ) {
          if(animationDone) {
            $(".collapsed-nav, #navigation-icon-collapsed").fadeOut();
            $(this).stop().animate({"height" : "10px"});
          }
        }
      });
    }

  });
  

  function collapseHeaderMobile() {
    if( $(".nav-menu").css("display") != 'none' ) {
      $('.content').css(styles.collapsed.content);
      $('.nav-expand').css(styles.collapsed.navExpand);
      $('.nav-menu, #navigation-icon').hide()
      $('.collapsed-nav, #navigation-icon-collapsed').show();
      setCookie( "collapsed_nav", "true", 30, "patschreiber.com" );
    }
    else {
      $('.content').css(styles.expanded.content);
      $('.nav-expand').css(styles.expanded.navExpand);
      $('.nav-menu, #navigation-icon').show()
      $(".collapsed-nav, #navigation-icon-collapsed").hide();
      deleteCookie( "collapsed_nav", "patschreiber.com" );
    }
  }

  function collapseHeader() {
    if( $(".nav-menu").css("display") != 'none' ) {
      if(animationDone) {
        animationDone = false;
        $(".nav-arrow, #navigation-icon").fadeOut("fast");
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
        $(".nav-expand").stop(true, true).animate(styles.expanded.navExpand, function() {
          $(this).removeClass("collapsed");
        });
        $(".nav-menu").stop(true, true).toggle('slide', 400, function() {
          $(".collapsed-nav, #navigation-icon-collapsed").hide();
          $(".nav-arrow, #navigation-icon").fadeIn("fast");
          animationDone = true;
        });

        deleteCookie( "collapsed_nav", "patschreiber.com" );
      }
    }
  }
}());