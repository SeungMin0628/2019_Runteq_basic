// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// for edit function 
$(document).ready(() => {
  // add delete link, on delete button
  $('#delete-comment-confirm-modal').on('show.bs.modal', function (e) {
    const deleteUrl = e.relatedTarget.dataset.deleteUrl;
    $("#js-delete-button").attr("href", deleteUrl);
  });

  // when click edit button, then open edit form 
  $(document).on('click', '[name="js-comment-edit"]', (event) => {
    let commentId = $(event.target).data('commentId');
    $(`#js-comment-${commentId}`).addClass('d-none');
    $(`#js-comment-edit-form-${commentId}`).removeClass('d-none');;
  });

  // when click cancel button, then close edit form 
  $(document).on('click', '[name="js-comment-edit-cancel"]', (event) => {
    let commentId = $(event.target).data('commentId');
    $(`#js-comment-${commentId}`).removeClass('d-none');
    $(`#js-comment-edit-form-${commentId}`).addClass('d-none');;
  });
});
