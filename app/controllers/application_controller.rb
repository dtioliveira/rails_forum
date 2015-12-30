require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :name, :email, :password, :password_confirmation,
    )}
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_url
  end
end
