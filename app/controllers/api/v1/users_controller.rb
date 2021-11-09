class Api::V1::UsersController < ApplicationController

  skip_before_action :authorize_request, only: :create

  def index
    render json: 'hello there'
  end  
    # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    render json: Message.account_created, auth_token: auth_token
    #render json: response, status: :created
  end

  private

  def user_params
    params.permit(
      :name,
      :username,
      :password
    )
  end
end