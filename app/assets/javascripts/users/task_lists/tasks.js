$(document).ready(function(){
  $(document).on('keypress', '#new_task', function(e){
    if (e.which == 13) {
      $(this).submit();
      return false
    }    
  });

  $(document).on('keypress', '.created-task', function(e){
    if (e.which == 13) {
      alert('enter hited');
      return false
    }
  });
});



// os usuarios que estavam aparecendo devem aparecer mesmo e o problema de acesso deve ser resolvido