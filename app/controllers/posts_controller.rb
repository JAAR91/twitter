class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(session[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'New post updated!'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:notice] = 'Unable to create twitt'
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
