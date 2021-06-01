class SessionsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    if @user.nil?
      redirect_to login_path
    else
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    redirect_to login_path
  end
end
