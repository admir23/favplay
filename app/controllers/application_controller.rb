class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def logged_in?
    current_user
  end

  helper_method :logged_in?

  protected

  def authorize
    redirect_to login_path unless current_user
  end

  def authorize_for_superadmins
    unless current_user.superadmin?
      flash[:notice] = 'Unauthorized access, you shall not pass!'
      redirect_to root_path
    end
  end  
  
  def authorize_for_admins
    unless current_user.admin?
      flash[:notice] = 'Unauthorized access, you shall not pass!'
      redirect_to root_path
    end
  end  
end