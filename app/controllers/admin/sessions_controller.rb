class Admin::SessionsController < Admin::AdminController
  skip_before_action :require_login, only: %i[new create]
  before_action :authenticated, except: %i[destroy]
  layout 'admin_before_login'

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      unless @user.has_role? :admin
        return redirect_to root_path, warning: t('flash.warning.admin.sessions.has_no_role')
      end

      # login success => go to dashboards
      redirect_back_or_to admin_root_path, success: t('flash.success.user_sessions.create')
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

  private

  def authenticated
    if logged_in?
      return redirect_to admin_root_path if current_user.has_role? :admin
    end
  end
end
