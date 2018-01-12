class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Devise configuration

  include DeviseHelper
  include UsersHelper
  

  def after_sign_in_path_for(user)
  	dashboard_root_path
  end

  def after_sign_out_path_for(user)
    new_user_session_path
  end

 private

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :about, :role, :img] 
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end  

end
