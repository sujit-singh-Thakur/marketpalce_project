class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :type])
  end

  def after_sign_in_path_for(resource)
    case resource.type&.downcase
     when 'admin'
    admin_root_path
    when 'contractor'
      contractor_home_path
    when 'worker'
      worker_home_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  # def after_sign_out_path_for(resource)
  #   redirect_to new_user_session_path
  # end

def after_sign_up_path_for(resource)
  if type == "contractor"
  contractor_home_path(resource)
    elsif type == "worker"
      worker_home_url(resource) 
    end
end


  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  # end

  
  # redirect_to new_person_session_path
  # def after_sign_in_path_for(resource)
  #   new_person_session_path(current_) 
  # end
  
end
