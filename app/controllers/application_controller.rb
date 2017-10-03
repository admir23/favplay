class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  add_flash_types :danger, :info, :warning, :success

  def logged_in?
    current_user
  end

  helper_method :logged_in?

  protected

  def authorize
    redirect_to login_path unless current_user
  end 
  
  def authorize_for_admins
    unless current_user.admin? || current_user.superadmin?
      flash[:notice] = 'Permisson denied!'
      redirect_to root_path
    end
  end  
end