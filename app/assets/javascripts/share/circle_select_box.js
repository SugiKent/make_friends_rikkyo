$(function(){

  $('.Form__item--circle').on('change', function(){
    var value = $(this).val();
    console.log(value);

    $('.Form__hidden--circle').val(value);
  });

});
