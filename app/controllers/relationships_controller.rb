class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
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
