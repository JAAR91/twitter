class FollowersController < ApplicationController
    before_action :authenticate_user!

    def index
        @followers = current_user.followers
    end
    
    def create
        @user = User.find(params[:user_id])
        @follow = @user.followers.new(follow_id: params[:follow_id])
    
        if @follow.save
            flash[:notice] = "Now following!"
            redirect_back(fallback_location: root_path)
        else
            flash[:notice] = @follow
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @follow = @user.followers.find_by(follow_id: params[:follow_id])
        if @follow
            @follow.destroy
            flash[:notice] = "You stop following!"
            redirect_back(fallback_location: root_path)
        end
    end
end
