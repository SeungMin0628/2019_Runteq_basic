class ProfilesController < ApplicationController
  def show; end

  def edit; end

  def update
    if current_user.update(profile_params)
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
