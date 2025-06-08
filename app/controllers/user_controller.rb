class UserController < ApplicationController
  
  def index
     @users = User.all
  end
  
  def home
    redirect_to new_user_registration_path
  end
                  
end
