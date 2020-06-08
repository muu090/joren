class CheckInsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @check_ins = CheckIn.where(user_id: @user.id).order(created_at: :desc) # 最新順に表示
  end

  def show
    @user = User.find(params[:user_id])
    @check_ins = CheckIn.where(user_id: @user.id, store_id: params[:store_id]).order(created_at: :desc) # 最新順に表示
    @check_ins.each do |check_in|
      @comments = Comment.where(check_in_id: check_in.id)
    end
  end

  def create
    check_in = current_user.check_ins.new
    check_in.user_id = params[:user_id]
    check_in.store_id = params[:store_id]
    check_in.store_name = params[:store_name]
    
    if check_in.save
      redirect_back(fallback_location: store_path(params[:store_id]))
    end
  end
end
