class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to root_path, success: 'Logged in successfully!'
    else
      redirect_to login_path, danger: 'Incorrect username or password!'
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
  

