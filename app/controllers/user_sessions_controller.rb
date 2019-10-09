class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      # ログイン成功
      redirect_back_or_to boards_path, success: t('flash.success.user_sessions.create')
    else
      # ログイン失敗
      flash.now[:danger] = t('flash.danger.user_sessions.create')
      render :new
    end
  end

  def destroy
    # ログアウト
    logout
    redirect_to root_path, success: t('flash.success.user_sessions.destroy')
  end
end
