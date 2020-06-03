class CheckInsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @check_ins = @user.check_ins
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    check_in = current_user.check_ins.new
    check_in.user_id = params[:user_id]
    check_in.store_id = params[:store_id]
    
    if check_in.save
      redirect_back(fallback_location: store_path(params[:store_id]))
    end
  end
end
