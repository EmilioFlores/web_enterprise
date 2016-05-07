$(function(){
  $(".enabled-checkbox").bootstrapSwitch({
    onText: '<i class="fa fa-icon fa-check"></i>',
    offText: '<i class="fa fa-icon fa-times"></i>',
    onSwitchChange: function(){
      checkbox = this;
      $.ajax({
        url: '/admin/users_manage',
        type: 'POST',
        data: { enabled: $(checkbox).is(':checked'),
                id: $(checkbox).data('userId')},
        success: function(){

        },
        error: function(){
          swal('Error', 'Something went wrong', 'error');
        }
      });
    }
  });
})