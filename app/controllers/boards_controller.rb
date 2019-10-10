class BoardsController < ApplicationController
  def index
    @boards = Board.includes(:user).where(['title LIKE ?', "%#{params[:search]}%"]).page(params[:page])
  end
end
