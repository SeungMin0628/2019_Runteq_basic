$(function() {
  // avatar preview
  function readURL(input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();

      reader.onload = function (e) {
        $('#js-avatar_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#user_avatar").change(function(){
    readURL(this);
  });

  // add user-destroy-link to confirm modal
  $('#js-user-delete-confirm-modal').on('show.bs.modal', function (e) {
    const deleteUrl = e.relatedTarget.dataset.deleteUrl;
    $("#js-user-delete-button").attr("href", deleteUrl);
  });
});
