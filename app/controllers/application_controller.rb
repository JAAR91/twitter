class ApplicationController < ActionController::Base
  def authenticate_user!
    @user = User.find_by(id: session[:user_id])
    redirect_to login_path if @user.nil?
  end
end
