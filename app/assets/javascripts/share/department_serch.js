// Ajax検索用
$(document).on('change load', '#faculty_id', function() {
  $.ajax({
    type: 'GET',
    url: '/users/departments_select',
    data: {
      faculty_id: $(this).val()
    }
  }).done(function(departmentdata) {
    $('#department_id').html(departmentdata);
  });
});

$(document).on('change load', '.for_hidden', function() {
  var idValue = $(this).val(),
      target = $(this).attr("id");
  console.log(idValue);
  $('#user_'+target).val(idValue);
});

$(function(){
  var department_name = $('.Form__hidden').text();

  $('#department_id').find("option").text(department_name);
});
