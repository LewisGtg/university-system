class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?, :admin?
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def admin?
    current_user&.admin?
  end
  
  def authenticate_user!
    redirect_to login_path unless logged_in?
  end
  
  def require_admin
    redirect_to root_path, alert: 'Access denied.' unless admin?
  end
end
