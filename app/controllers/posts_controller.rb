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
    @user = User.find(session[:user_id])
    ids = @user.followers.pluck(:follow_id) << @user.id
    @posts = Post.where(user_id: ids)
  end

  private

  def post_params
    params.require(:post).permit(:body, :picture)
  end

end
