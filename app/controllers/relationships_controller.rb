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
    @user = User.find(params[:user_id])
    @users = @user.following_user
    @users.each do |user|
      @joren = user.check_ins.group(:store_id).having('count(*) >= 20')  # 20個以上同じstore_idカラムが20個以上重複しているデータを配列で取得
    end
  end
  
  def follower_index
    @user = User.find(params[:user_id])
    @users = @user.followed_user
    @users.each do |user|
      @joren = user.check_ins.group(:store_id).having('count(*) >= 20')  # 20個以上同じstore_idカラムが20個以上重複しているデータを配列で取得
    end
  end
end
