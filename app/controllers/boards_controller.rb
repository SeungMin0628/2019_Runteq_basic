class BoardsController < ApplicationController
  before_action :find_board, only: %i[edit update destroy]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).recent.page(params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)

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
    binding.pry
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
    @board = current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(
      :title,
      :body,
      :board_image,
      :board_image_cache
    )
  end
end
