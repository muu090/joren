class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @joren = @user.check_ins.group(:store_id).having('count(*) >= 20')  # 20個以上同じstore_idカラムが20個以上重複しているデータを配列で取得
    @not_joren = @user.check_ins.group(:store_id).having('count(*) <= 19') # 同じstore_idカラムを持つレコードが19以下のデータを配列で取得
  end

  def followings
		@user = User.find(params[:id]) 
		@users = User.all
  end
  
  def followers
		@user = User.find(params[:id])
		@users = User.all
  end	

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(current_user.id), notice: "ユーザ情報を更新しました!"
  	else
  		render "edit"
  	end
  end
end


private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end