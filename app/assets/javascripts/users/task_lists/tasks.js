$(document).ready(function(){
  $(document).on('keypress', '#new_task', function(e){
    if (e.which == 13) {
      $(this).submit();
      return false
    }    
  });

  $(document).on('keypress', '.task-desc', function(e){
    if (e.which == 13) {
      input = $(this).find('input:text');
      var desc = input.val();
      var task_id = $(this).closest('.task-form').data('id');
      var user_id = $(this).closest('.task-form').data('user-id');
      var task_list_id = $(this).closest('.task-form').data('task-list-id');
      $.ajax({
        url: Routes.user_task_list_task_path(user_id, task_list_id, task_id),
        data: {
          task: { description: desc }
        },
        type: 'PATCH',
        success: function(data) {
          input.val(data.description);
        },
        error: function() {
          alert("algum error ocorreu");
        }
      });
    }
  });

  $(document).on('dblclick', '.task-desc', function(e){
   
    input = $(this).find('input:text');
    var completed = !$(this).closest('.task-form').data('completed');
    var task_id = $(this).closest('.task-form').data('id');
    var user_id = $(this).closest('.task-form').data('user-id');
    var task_list_id = $(this).closest('.task-form').data('task-list-id');

    $.ajax({
      url: Routes.user_task_list_task_path(user_id, task_list_id, task_id),
      data: {
        task: { completed: completed }
      },
      type: 'PATCH',
      success: function(data) {
        debugger;
        input.closest('.task-form').data('completed', data.completed)

        
        if (data.completed) {
          input.addClass('line-through');
        } else {
          input.removeClass('line-through');
        }
      },
      error: function() {
        alert("algum error ocorreu");
      }
    });
  });  
});



// os usuarios que estavam aparecendo devem aparecer mesmo e o problema de acesso deve ser resolvido