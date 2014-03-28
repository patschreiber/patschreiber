$(document).ready(function() {

if(Modernizr.audio) {
  console.log("Yeah");
}
else {
  console.log("no");
}

if(!Modernizr.svg) {
  $('.nav-menu-arrow-top').attr("src", "arrow-up.png");
  $('.nav-menu-arrow-bottom').attr("src", "arrow-down.png");
}

});