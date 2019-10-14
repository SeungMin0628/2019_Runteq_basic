class CommentsController < ApplicationController
  def create
    @comment = Board.find(params[:board_id]).comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = t('flash.success.comments.create')
    else
      flash[:danger] = t('flash.danger.comments.create')
    end

    redirect_to board_path(params[:board_id])
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body
    )
  end
end
