class CommentsController < ApplicationController
  before_action :find_comemnt, only: %i[update destroy]

  def create
    @comment = current_user.comments.create(comment_params)
  end

  def update
    @status = @comment.update(comment_update_params)
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end

  def find_comemnt
    @comment = current_user.comments.find(params[:id])
  end
end
