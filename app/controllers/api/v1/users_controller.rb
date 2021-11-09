class Api::V1::UsersController < ApplicationController

  skip_before_action :authorize_request, only: :create

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    render json: Message.account_created, auth_token: auth_token
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