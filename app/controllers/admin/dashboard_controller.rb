class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  def index
  end
  private
  def ensure_admin!
    unless current_user&.is_a?(Admin)
      flash[:alert] = "Access Denied: You are not authorized to access the admin panel."
      redirect_to admin_root_path
    end
  end
end
