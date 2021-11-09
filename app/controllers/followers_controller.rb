class FollowersController < ApplicationController
    skip_before_action :authorize_request
    before_action :authenticate_user!

  def index
    @followers = current_user.followers
  end

  def create
    @user = User.find(params[:user_id])
    @follow = @user.followers.new(follow_id: params[:follow_id])

    flash[:notice] = if @follow.save
                       "Now following #{@follow.follow.name}!"
                     else
                       @follow
                     end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = @user.followers.find_by(follow_id: params[:follow_id])
    if @follow
      @follow.destroy
      flash[:notice] = "You stop following #{@follow.follow.name}!"
    else
      flash[:notice] = "Error while removing #{@follow.follow.name} from your follower list!"
    end
    redirect_back(fallback_location: root_path)
  end
end
