class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Devise configuration

  include DeviseHelper

  def configure_permitted_parameters
    added_attrs = [:password, :password_confirmation, :current_password, :first_name, :last_name, :about, :role, :img] 
	  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end  
  

  def after_sign_in_path_for(user)
  	admin_posts_path
  end

  # def after_update_path_for(user)
      # user_path(resource)
  # end

   def after_sign_out_path_for(user)
    "/login"
  end 



end
