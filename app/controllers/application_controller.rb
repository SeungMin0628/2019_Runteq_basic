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

  def not_authenticated
    redirect_to login_path, danger: t('flash.danger.user_sessions.need_login')
  end

  def render_404
    render template: 'errors/error_404', status: 404, layout: nil, content_type: 'text/html'
  end
end
