
class Users::SessionsController < Devise::SessionsController
  def destroy
    reset_session
    redirect_to destroy_user_session_path, notice: "Logged out successfully"
  end
end
