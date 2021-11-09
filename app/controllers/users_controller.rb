class UsersController < ApplicationController
  skip_before_action :authorize_request
  before_action :authenticate_user!, except: %i[new create]

  def index
    @user = User.all.where('id != ?', session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else

      flash.now[:notice] = 'PLease fill all the necessaary information! '
      flash.now[:notice2] = 'Username cant be empty or already on use' if user_params[:username].nil?
      flash.now[:notice3] = 'Name cant be empty or already exist! ' if user_params[:name] == ''
      flash.now[:notice4] = 'Password is require! ' if user_params[:password] == ''
      render :new
    end
  end

  def show
    date = Time.now
    date = params[:lastpostdate] unless params[:lastpostdate].nil?
    @user = User.find(params[:id])
    @posts = @user.posts.where('created_at < ?', date).ordered_posts.includes(:coments).limit(5)
    if @posts.count.zero?
      @lastpostdate = 'empty'
    else
      @lastpostdate = @posts.last.created_at
      @lastpostdate = 'last' if @posts.last.id == @user.posts.ordered_posts.last.id
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      flash[:success] = 'Profile Updated!'
      redirect_to user_path(@user.id)
    else
      flash.now[:warning] = 'Could not update profile!'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :avatar, :banner)
  end
end
