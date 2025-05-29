class Admin::UsersController < ApplicationController
  
       def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_path, notice: 'User deleted'
  end


end
