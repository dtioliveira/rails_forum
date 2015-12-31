require 'application_responder'

# I'm pretty sure I'm a top-level class documentation comment
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_locale

  def current_locale
    case I18n.locale.to_s
    when 'es'
      'es'
    when 'pt-BR'
      'pt'
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_url
  end

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
