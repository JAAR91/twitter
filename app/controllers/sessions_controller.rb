class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user.nil?
      redirect_to login_path
      flash[:notice] = 'Username not found'
    elsif @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "Welcome back #{@user.name}"
      redirect_to root_path
    else
      flash[:notice] = 'Wrong password!'
      redirect_to login_path
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    redirect_to login_path
  end
end
