class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :flash_to_headers

  add_flash_types :danger, :info, :warning, :success
  
  include SessionsHelper

  def logged_in?
    current_user
  end

  helper_method :logged_in?


  def flash_to_headers
    return unless request.xhr?
    response.headers['X-Message'] = flash[:error]  unless flash[:error].blank?
    response.headers['X-Message'] = flash[:alert]  unless flash[:alert].blank?
    response.headers['X-Message'] = flash[:notice]  unless flash[:notice].blank?
   
    flash.discard 
  end


  protected

  def authorize
    redirect_to login_path unless current_user
  end 

  def authorize_for_users
    if current_user.admin? || current_user.superadmin?
       redirect_to admin_dashboard_path
    end
  end       
  
  def authorize_for_admins
    unless current_user.admin? || current_user.superadmin?
      redirect_to root_path, danger: 'Permisson denied!'
    end
  end  
end