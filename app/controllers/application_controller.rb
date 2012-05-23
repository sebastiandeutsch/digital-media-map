class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_admin_user
  
  def authenticate_admin_user!
    redirect_to new_user_session_url and return false unless current_user.admin?
  end
  
  def current_admin_user
    current_user
  end
end
