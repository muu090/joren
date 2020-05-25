class CheckInsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:id])
  end
end
