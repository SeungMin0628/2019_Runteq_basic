class BoardsController < ApplicationController
  before_action :find_board, only: %i[edit update destroy]

  def index
    @boards = Board.includes(:user).recent.search(params[:search]).page(params[:page])
  end

  def bookmarks
    @boards = current_user.boards.recent.search(params[:search]).page(params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)

    # Image cache
    if !@board.board_image.present? && @board.board_image_cache.present?
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

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.exists? ? @board.comments.includes(:user) : nil
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to @board, success: t('flash.success.boards.update')
    else
      flash.now[:danger] = t('flash.danger.boards.update')
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, success: t('flash.success.boards.delete')
  end

  private
  def find_board
    @board = Board.find_by!(id: params[:id], user_id: current_user)
  end

  def board_params
    params.require(:board).permit(
      :title,
      :body,
      :board_image,
      :board_image_cache
    ).merge(
      user_id: current_user.id
    )
  end
end
