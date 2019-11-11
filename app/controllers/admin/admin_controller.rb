class Admin::AdminController < ApplicationController
  before_action :check_admin
  layout 'admin'

  private

  def check_admin
    if logged_in?
      return redirect_to(root_path, warning: t('flash.warning.admin.sessions.has_no_role')) unless current_user.has_role? :admin
    end
  end

  # redefinition of 'sorcery#not_authenticated'
  # ログインしなかったユーザーがアクセスした際、警告メッセージを表示しログイン画面に遷移させる
  def not_authenticated
    redirect_to admin_login_path, danger: t('flash.danger.user_sessions.need_login')
  end
end
