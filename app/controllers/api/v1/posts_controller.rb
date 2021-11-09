class Api::V1::PostsController < ApplicationController
  skip_before_action :authorize_request
  skip_before_action :verify_authenticity_token

  def index 
    @posts = Post.all
    render json: @posts
  end
end