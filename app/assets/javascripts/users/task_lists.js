$(document).ready(function(){
  $(".user-lists .update-public").click(function(){
    debugger;
    var task_id = $(this).closest("tr").data("id");
    var user_id = $(this).closest("tr").data("userId");
    var public = !$(this).closest("tr").data("public"); 
    
    $.ajax({
      url: Routes.user_task_list_path(user_id,task_id),
      data: {
        task_list: { public: public }
      },
      type: 'PATCH',
      success: function(data) {
        $(this).find('i').removeClass('fa-check-square-o').addClass('fa-square-o');
      },
      error: function() {
        alert("algum error ocorreu");
      }
    });
  });
}); 
