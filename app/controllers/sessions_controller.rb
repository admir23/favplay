class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    # @user = User.where(username: params[:username]).first

    if @user && @user.authenticate(params[:password])
      flash[:notice] = 'Logged in successfully!'
      log_in @user
      redirect_to root_path
    else
      flash[:error] = 'Incorrect username or password! :\'('
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
