class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # ユーザー登録成功
      redirect_to boards_path, success: t('flash.success.users.create')
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
