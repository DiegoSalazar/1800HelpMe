class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :account_update, \
      keys: [:first_name, :middle_name, :last_name]
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || my_contacts_path
  end
end
