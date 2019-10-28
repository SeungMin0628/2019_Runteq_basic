class ProfilesController < ApplicationController
  def show; end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    
    if @user.update(profile_params)
      redirect_to profile_path, success: t('flash.success.profiles.update')
    else
      flash.now[:danger] = t('flash.danger.profiles.update')
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :avatar
    )
  end
end
