$(document).ready(function(){
  $(document).on('click', '.user-lists .update-public', function(){

    var input = $(this)
    var task_list_id = input.closest('tr').data('id');
    var user_id = input.closest('tr').data('userId');
    var public = !input.closest('tr').data('public'); 

    $.ajax({
      url: Routes.user_task_list_path(user_id,task_list_id),
      data: {
        task_list: { public: public }
      },
      type: 'PATCH',
      error: function() {
        alert("algum error ocorreu");
      }
    });
  });

  $(document).on('click', '.user-lists .fav', function(){
    
    var input = $(this)
    var task_list_id = input.closest('tr').data('id');
    var user_id = input.closest('tr').data('userId'); 
    
    $.ajax({
      url: Routes.toggle_bookmark_user_task_list_path(user_id,task_list_id),
      type: 'PATCH',
      error: function() {
        alert("algum error ocorreu");
      }
    });
  });

}); 