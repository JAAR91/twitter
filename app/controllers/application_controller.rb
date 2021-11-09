class ApplicationController < ActionController::Base
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  def authenticate_user!
    @user = User.find_by(id: session[:user_id])
    redirect_to login_path if @user.nil?
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
