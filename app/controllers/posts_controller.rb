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
    @posts = Post.where(user_id: ids).where('created_at < ?',
                                            date).ordered_posts.limit(10).includes(:coments).includes(:user)
    if @posts.count.zero?
      @lastpostdate = 'emtpy'
    else
      @lastpostdate = @posts.last.created_at
      @lastpostdate = 'last' if @posts.last.id == Post.where(user_id: ids).ordered_posts.last.id
    end
  end

  def ousers
    date = Time.now
    date = params[:lastpostdate] unless params[:lastpostdate].nil?
    @user = User.find(session[:user_id])
    ids = @user.followers.pluck(:follow_id) << @user.id
    @posts = Post.where.not(user_id: ids).where('created_at < ?',
                                                date).ordered_posts.limit(10).includes(:coments).includes(:user)
    if @posts.count.zero?
      @lastpostdate = 'empty'
    else
      @lastpostdate = @posts.last.created_at
      @lastpostdate = 'last' if @posts.last.id == Post.where.not(user_id: ids).ordered_posts.last.id
    end
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

  def show
    date = Time.now
    date = params[:lastcomentdate] unless params[:lastcomentdate].nil?
    @post = Post.find(params[:id])
    @coments = @post.coments.where('created_at < ?', date).ordered_coments.limit(15).includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:body, :picture)
  end
end
