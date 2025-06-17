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
    redirect_to admin_user_path, notice: "User deleted"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :type)
  end

  def require_admin
    redirect_to root_path, alert: "Access denied" unless current_user.is_a?(Admin)
  end
end
