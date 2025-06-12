<<<<<<< HEAD
class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  private

  def ensure_admin!
    unless current_user&.is_a?(Admin)
      flash[:alert] = "Access Denied: You are not authorized to access the admin panel."
      redirect_to root_path
    end
  end
end
=======
class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  private

  def ensure_admin!
    unless current_user&.is_a?(Admin)
      flash[:alert] = "Access Denied: You are not authorized to access the admin panel."
      redirect_to admin_root_path
    end
  end
end
>>>>>>> df7592552b63e8c06f9d78c5e18e3c3bdbd64a80
