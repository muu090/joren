class CheckInsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @check_ins = @user.check_ins
  end

  def show
    @user = User.find(params[:id])
  end
end
