class Admin::UsersController < ApplicationController
    load_and_authorize_resource
    
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
