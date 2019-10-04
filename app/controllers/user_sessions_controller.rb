class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_path
      flash[:success] = "こんにちは、#{@user.first_name}さん"
    else
      flash.now[:alert] = "メールアドレスやパスワードが間違っています。"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトに成功しました。"
    redirect_to root_path
  end
end