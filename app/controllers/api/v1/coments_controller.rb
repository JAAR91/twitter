class Api::V1::ComentsController < ApplicationController

    skip_before_action :authorize_request
    skip_before_action :verify_authenticity_token
  
    def create
        @user = User.find_by(username: body_params[:username])
        # render json: body_params[:post_id]
        @coment = Coment.new(post_id: body_params[:post_id], user_id: @user.id, body: body_params[:comment])
        if @coment.save
            render json: "Your comment was created."
        else
            render json: "Comment was not created."
        end
    end

    private

    def body_params
        params.permit(:username, :comment, :post_id)
    end
end