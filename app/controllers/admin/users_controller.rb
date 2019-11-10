class Admin::UsersController < Admin::AdminController
  before_action :find_user, except: %i[index]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).preload(:roles).id_desc.page(params[:page])
  end

  def edit; end

  def update
    if @user.update(user_params)
      # update role if role is changed
      unless @user.has_role? (new_role = params[:user][:role].to_sym)
        @user.roles.destroy_all
        @user.add_role new_role
      end

      redirect_to admin_users_path, success: 'update success';
    else
      flash.now[:danger] = 'update false';
      render :edit
    end
  end

  def destroy
    return @user.destroy unless @user == current_user
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
    )
  end
end
