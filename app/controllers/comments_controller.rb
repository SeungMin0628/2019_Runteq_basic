class CommentsController < ApplicationController
  before_action :find_comemnt, only: %i[update destroy]
  after_action :render_ajax, only: %i[create update destroy]

  def create
    @comment = current_user.comments.build(comment_params)

    if !(@status = @comment.save)
      @message = t('flash.danger.comments.create')
    end
  end

  def update
    # binding.pry

    if !(@status = @comment.update(comment_params))
      @message = t('flash.danger.comments.update')
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    if params.has_key?(:board_id)
      params.require(:comment).permit(:body).merge(board_id: params[:board_id])
    else
      params.require(:comment).permit(:body)
    end
  end

  def find_comemnt
    @comment = current_user.comments.find(params[:id])
  end

  def render_ajax
    respond_to do |format|
      format.js
    end
  end
end
