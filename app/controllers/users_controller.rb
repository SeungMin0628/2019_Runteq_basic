class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # ユーザー登録成功
      flash[:success] = t('flash.success.users.create')
      redirect_to login_path
    else
      # ユーザー登録失敗
      flash.now[:danger] = t('flash.danger.users.create')
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
