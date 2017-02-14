function init() {
  // for scroll animation
  $('.scrollAnime').css("opacity","0");
}
/*
* スクロールに合わせたアニメーション
*/
function getScrollPosition() {
  var scroll = $(window).scrollTop();
  return scroll;
}
function getElemPosition(elem) {
  var elemPosition = $(elem).offset().top;
  return elemPosition;
}
function getWindowHeight() {
  var windowHeight = $(window).height();
  return windowHeight;
}
$(function(){
  init();
  // スクロースに合わせて表示
  var timer = null;
  $(window).scroll(function(){
    clearTimeout(timer);
    timer = setTimeout(function() {
      $(".scrollAnime").each(function(){
        if (getScrollPosition() > getElemPosition(this) - getWindowHeight() + getWindowHeight()/3) {
          $(this).css("opacity","1");
        } else {
          $(this).css("opacity","0");
        }
      });
    }, 10);
  });

})
