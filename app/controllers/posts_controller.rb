class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(session[:user_id])
    @post = @user.posts.new
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.new(post_params)
    flash[:notice] = if @post.save
                       'New post updated!'
                     else
                       'Post is empty or image have an invalid format'
                     end
    redirect_back(fallback_location: root_path)
  end

  def index
    @user = User.find(session[:user_id])
    ids = @user.followers.pluck(:follow_id) << @user.id
    @posts = Post.where(user_id: ids)
  end

  def ousers
    @user = User.find(session[:user_id])
    ids = @user.followers.pluck(:follow_id) << @user.id
    @oposts = Post.where.not(user_id: ids)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post
      @post.destroy
      flash[:notice] = 'Post destroyed!'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = 'Could not delete this post'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :picture)
  end
end
