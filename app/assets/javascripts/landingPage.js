$(document).ready(function() {
$(".nav-menu").bind("mousewheel", function (ev, delta) {
    var scrollTop = $(window).scrollTop();
    $(window).scrollTop(scrollTop - Math.round(delta * 20));
});
});