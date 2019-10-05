class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      flash[:success] = t('flash.success.user_sessions.create', first_name: @user.first_name)
      redirect_back_or_to root_path
    else
      flash.now[:alert] = t('flash.alert.user_sessions.create')
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = t('flash.success.user_sessions.destroy')
    redirect_to root_path
  end
end
