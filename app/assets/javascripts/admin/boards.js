$(function() {
  // board image preview
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#js-board_image_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#board_board_image").change(function(){
    readURL(this);
  });

  // add user-destroy-link to confirm modal
  $('#js-board-delete-confirm-modal').on('show.bs.modal', function (e) {
  const deleteUrl = e.relatedTarget.dataset.deleteUrl;
  $("#js-board-delete-button").attr("href", deleteUrl);
});
});
