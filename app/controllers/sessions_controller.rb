class SessionsController < ApplicationController
  skip_before_action :authorize_request
  def create
    @current_user = User.find_by(username: params[:username])
    if @current_user.nil?
      redirect_to login_path
      flash[:notice] = 'Username not found'
    elsif @current_user.password == params[:password]
      session[:user_id] = @current_user.id
      flash[:notice] = "Welcome back #{@current_user.name}"
      redirect_to root_path
    else
      @current_user = nil
      flash[:notice] = 'Wrong password!'
      redirect_to login_path
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    redirect_to login_path
  end
end
