class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_admin_user, :destroy_admin_user_session_path
  
  def authenticate_admin_user!
    true
  end
  
  def current_admin_user
    User.first
  end
  
  def destroy_admin_user_session_path
    
  end
end
