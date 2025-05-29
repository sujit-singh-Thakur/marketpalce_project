class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # redirect_to new_person_session_path
  # def after_sign_in_path_for(resource)
  #   new_person_session_path(current_) 
  # end
  
end
