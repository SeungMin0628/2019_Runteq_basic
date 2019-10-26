class BookmarksController < ApplicationController
  def index
    @boards = current_user.bookmarked_boards.recent.search(params[:search]).page(params[:page])
  end

  def create
    @bookmark = current_user.bookmarks.create(board_id: params[:board_id])

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy

    respond_to do |format|
      format.js
    end
  end
end
