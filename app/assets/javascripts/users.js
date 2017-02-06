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

function toggleSearchForm(){
  $('.toggleHeight').animate({
    height: 'toggle'
  });
}



$(function(){

  $('.Check__label').on('click', function(){
    showCheckGroup(this);
  });

  showCheckGroup($('.Check__label:first'));

  $('.toggleHeightArea .toggleHeightButton').on('click', function(){
    toggleSearchForm();
  })

});
