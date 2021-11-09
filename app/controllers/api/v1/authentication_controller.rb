class Api::V1::AuthenticationController < ApplicationController

  skip_before_action :authorize_request
  skip_before_action :verify_authenticity_token

  def authenticate
    auth = AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
    render json: auth
  end

  private

  def auth_params
    params.permit(:username, :password)
  end
end
