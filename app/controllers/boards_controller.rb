class BoardsController < ApplicationController
  def index
    @boards = Board.includes(:user).search(params[:search]).page(params[:page])
  end
end
