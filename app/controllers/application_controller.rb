class ApplicationController < ActionController::Base
  def authenticate_user!
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to login_path
    end
  end
end
