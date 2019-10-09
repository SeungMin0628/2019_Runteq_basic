class BoardsController < ApplicationController
  PER = 12

  def index
    @boards = Board.includes(:user).where(['title LIKE ?', "%#{params[:search]}%"]).page(params[:page]).per(PER)
  end
end
