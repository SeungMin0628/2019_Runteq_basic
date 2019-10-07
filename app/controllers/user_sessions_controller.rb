class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      # ログイン成功
      flash[:success] = t('flash.success.user_sessions.create')
      redirect_back_or_to root_path
    else
      # ログイン失敗
      flash.now[:danger] = t('flash.danger.user_sessions.create')
      render :new
    end
  end

  def destroy
    # ログアウト
    logout
    flash[:success] = t('flash.success.user_sessions.destroy')
    redirect_to root_path
  end
end
