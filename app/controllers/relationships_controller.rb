class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  
  def follow_index
    @user = current_user
    @users = @user.following_user
  end

  def follower_index
    @user = current_user
    @users = @user.followed_user
  end
end
