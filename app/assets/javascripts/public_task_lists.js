  $(document).on('click', '.user-lists .pub-fav', function(){
    debugger
    var input = $(this)
    var task_list_id = input.closest('tr').data('id');
    var user_id = input.closest('tr').data('userId'); 
    
    $.ajax({
      url: Routes.toggle_bookmark_public_task_list_path(task_list_id),
      type: 'PATCH',
      error: function() {
        alert("algum error ocorreu");
      }
    });
  });