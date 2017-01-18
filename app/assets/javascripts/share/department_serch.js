// Ajax検索用
$(document).on('change', '#faculty_id', function() {
  $.ajax({
    type: 'GET',
    url: '/users/departments_select',
    data: {
      faculty_id: $(this).val()
    }
  }).done(function(departmentdata) {
    $('#department_id').html(departmentdata);
  });
  // $.ajax({
  //   type: 'GET',
  //   url: '/result/lessons_select',
  //   data: {
  //     faculty_id: $(this).val()
  //   }
  // }).done(function(lessondata) {
  //   $('#lessons_select').html(lessondata);
  //   $('#lessons_select').attr('name', 'result[lesson_id]')
  // });

});

$(document).on('change', '.for_hidden', function() {
  var idValue = $(this).val(),
      target = $(this).attr("id");
  console.log(idValue);
  $('#user_'+target).val(idValue);
});
