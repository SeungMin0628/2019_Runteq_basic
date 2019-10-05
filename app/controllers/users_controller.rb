class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = '新規加入に成功しました。'
      redirect_to login_path
    else
      flash.now[:alert] = '新規加入に失敗しました。'
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name
    )
  end
end
