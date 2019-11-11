class Admin::BoardsController < Admin::AdminController
  before_action :find_board, only: %i[show edit update destroy]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).recent.page(params[:page])
  end

  def show
    @comments = @board.comments.includes(:user).all
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to admin_board_path(id: @board.id), success: t('flash.success.boards.update')
    else
      flash.now[:danger] = t('flash.danger.boards.update')
      render :edit
    end
  end

  def destroy
    @board.destroy!
  end

  private

  def find_board
    @board = Board.find(params[:id])
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
