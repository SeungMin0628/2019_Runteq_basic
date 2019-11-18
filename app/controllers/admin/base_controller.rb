class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin'

  private

  def check_admin
    return redirect_to(root_path, warning: t('flash.warning.admin.sessions.has_no_role')) unless current_user.has_role? :admin
  end

  def not_authenticated
    redirect_to admin_login_path, danger: t('flash.danger.user_sessions.need_login')
  end
end
