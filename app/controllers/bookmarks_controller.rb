class BookmarksController < ApplicationController
  def create
    current_user.bookmarks.create(board_id: params[:board_id])
    redirect_back fallback_location: root_path, success: t('flash.success.bookmarks.create')
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_back fallback_location: root_path, success: t('flash.success.bookmarks.delete')
  end
end
