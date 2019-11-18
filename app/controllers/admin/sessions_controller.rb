class Admin::SessionsController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :check_admin, only: %i[new create]
  layout 'admin_before_login'

  def new; end

  def create
    if (user = login(params[:email], params[:password]))
      # login success => go to dashboards
      redirect_back_or_to admin_root_path, success: t('flash.success.user_sessions.create', first_name: user.first_name)
    else
      # login fail => back to login form
      flash.now[:danger] = t('flash.danger.user_sessions.create')
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: t('flash.success.user_sessions.destroy')
  end
end
