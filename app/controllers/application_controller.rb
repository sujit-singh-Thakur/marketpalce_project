class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  user_profile_path(resource)
end

def after_sign_up_path_for(resource)
  user_profile_path(resource)
end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

  
  # redirect_to new_person_session_path
  # def after_sign_in_path_for(resource)
  #   new_person_session_path(current_) 
  # end
  
end
