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
    date = Time.now
    date = params[:lastpostdate] unless params[:lastpostdate].nil?
    @user = User.find(session[:user_id])
    ids = @user.followers.pluck(:follow_id) << @user.id
    @posts = Post.where(user_id: ids).where('created_at < ?', date).ordered_posts.includes(:coments).limit(10)
    @lastpostdate = @posts.last.created_at
    @lastpostdate = 0 if @posts.last.id == Post.where(user_id: ids).ordered_posts.last.id
  end

  def ousers
    date = Time.now
    date = params[:lastpostdate] unless params[:lastpostdate].nil?
    @user = User.find(session[:user_id])
    ids = @user.followers.pluck(:follow_id) << @user.id
    @oposts = Post.where.not(user_id: ids).where('created_at < ?', date).ordered_posts.includes(:coments).limit(10)
    @lastpostdate = @oposts.last.created_at
  end

  def destroy
    @post = Post.find(params[:id])
    if @post
      @post.destroy
      flash[:notice] = 'Post destroyed!'
    else
      flash[:notice] = 'Could not delete this post'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:body, :picture)
  end
end
