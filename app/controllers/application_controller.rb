class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #切换语言
  before_action :set_locale
  #时区
  before_action :set_timezone

  #设置默认语言
  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end

  #设置时区
  def set_timezone
    if current_user && current_user.time_zone
      time_zone = current_user.time_zone
    end
  end

end
