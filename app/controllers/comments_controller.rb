class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)

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
      :body,
    ).merge(
      board_id: params[:board_id]
    )
  end
end
