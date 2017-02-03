// function init() {
//   var windowHeight = 0,
//       userPosition = 0,
//       bodyHeight = 0,
//       scrollTopPosition = 0,
//       scrollPosition = 0,
//       key = $('.key'),
//       keyTitle = $('.key__title'),
//       scrollRate = 0;
//
// }



// function setUserHeight(){
//   getWindowHeight();
//   $('.User').height(windowHeight);
//   $('.Wrapper').height(windowHeight);
// }


// function getWindowHeight() {
//   windowHeight = $(window).height();
// }
//
// function getScrollPosition() {
//   scrollPosition = $(window).scrollTop();
// }

// function scrollUserWindow() {
//   getWindowHeight();
//   getUserPosition();
//
//   windowHeight = windowHeight + 10;
//   var $distance = "-=" + windowHeight;
//
//   $(".User").animate({
//     "top": "+=10"
//   }, 300).animate({
//     "top": $distance
//   }, 1000).animate('top', "40%");
// }

function showCheckGroup(elem) {
  $('.Check__label').removeClass('clickCancel');
  $(elem).addClass('clickCancel');
  $('.Check__group').animate({
    height: "hide",
    opacity: 0
  }, {
    duration: 500,
    queue: false
  });
  $(elem).next().animate({
    height: "show",
    opacity: 1
  }, {
    duration: 500,
    queue: false
  });
}



$(function(){
  // init();

  // $('.Next__button').on('click touchstart', function(){
    // クリックをキャンセリングする
    // $(".Next").toggleClass('clickCancel');
    // scrollUserWindow();
    // 1.5秒後にクリックok
    // setTimeout(function(){
    //   $(".Next").toggleClass('clickCancel');
    // }, 1500);
  // });

  $('.Check__label').on('click', function(){
    showCheckGroup(this);
  });

  showCheckGroup($('.Check__label:first'));
  // var timer = false;
  // $(window).on("load resize", function(){
  //   if (timer !== false) {
  //     clearTimeout(timer);
  //   }
  //   timer = setTimeout(function() {
  //     setUserHeight();
  //   }, 200);
  // });
  // setUserHeight();

});
