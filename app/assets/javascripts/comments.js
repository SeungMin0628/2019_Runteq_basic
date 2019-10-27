// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// for edit function 
$(document).ready(() => {
  /*
    TODO : コメントを登録したばかりは編集ボタンをクリックしても反応がない。

    ページをリロードすると利用できる
  */

  // when click edit button, then open edit form 
  $('[name="js-comment-edit"]').click((event) => {
    let commentId = $(event.target).data('commentId');
    $(`#js-comment-${commentId}`).addClass('d-none');
    $(`#js-comment-edit-form-${commentId}`).removeClass('d-none');;
  });

  // when click cancel button, then close edit form 
  $('[name="js-comment-edit-cancel"]').click((event) => {
    let commentId = $(event.target).data('commentId');
    $(`#js-comment-${commentId}`).removeClass('d-none');
    $(`#js-comment-edit-form-${commentId}`).addClass('d-none');;
  });
});
