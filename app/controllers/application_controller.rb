class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  # redefinition of 'sorcery#not_authenticated'
  # ログインしなかったユーザーがアクセスした際、警告メッセージを表示しログイン画面に遷移させる
  def not_authenticated
    flash[:danger] = t('flash.danger.user_sessions.need_login')
    redirect_to login_path
  end

  def render_404(exception = nil)
    logger.info "Rendering 404 with exception: #{exception.message}" if e

    render :file => "#{Rails.root}/public/404.html", status: 404
  end
end
