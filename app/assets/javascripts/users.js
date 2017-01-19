function init() {
  var windowHeight = 0,
      userPosition = 0;
}

function getWindowHeight() {
  windowHeight = $(window).height();
}

function getUserPosition() {
  userPosition = $(window).scrollTop();
}

function scrollUserWindow() {
  getWindowHeight();
  getUserPosition();

  windowHeight = windowHeight + 30;
  var $distance = "-=" + windowHeight;

  $(".User").animate({
    "top": "+=10"
  }, 300).animate({
    "top": $distance
  }, 1000).animate('top', "40%");
}




$(function(){
  init();

  $('.Next__button').on('click', function(){
    scrollUserWindow();
  });
});
