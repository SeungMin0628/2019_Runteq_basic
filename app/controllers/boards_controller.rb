class BoardsController < ApplicationController
  def index
    @boards = Board.includes(:user).recent.search(params[:search]).page(params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)

    # Image cache
    if !@board.board_image.present?
      @board.board_image.retrieve_from_cache! @board.board_image_cache
    end
    @board.board_image_cache = @board.board_image.cache_name

    if @board.save
      redirect_to boards_path, success: t('flash.success.boards.create')
    else
      flash.now[:danger] = t('flash.danger.boards.create')
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(
      :title,
      :body,
      :board_image,
      :board_image_cache
    )
  end
end
