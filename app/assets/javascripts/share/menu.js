$(function(){
  $('.Button__menu').on('click', function(){
    $('.Menu').animate({
      height: "toggle"
    });
  });

  $('.Menu').on('click', function(){
    $('.Menu').animate({
      height: "hide"
    });
  });
});
