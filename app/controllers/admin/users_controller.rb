class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: %i[edit update destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).recent.page(params[:page])
  end

  def edit; end

  def update
    if @user.update(user_params)
      # update role if role is changed
      redirect_to admin_users_path, success: t('flash.success.users.update')
    else
      flash.now[:danger] = t('flash.danger.users.update')
      render :edit
    end
  end

  def destroy
    @user.destroy! unless @user == current_user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :avatar,
      :avatar_cache,
      :role
    )
  end
end
