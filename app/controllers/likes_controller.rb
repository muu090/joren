class LikesController < ApplicationController

  def create
    @store = Store.find(params[:store_id])
    @comment = Comment.find(params[:comment_id])
    like = @comment.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    @store = Store.find(params[:store_id])
    @comment = Comment.find(params[:comment_id])
    like = current_user.likes.find_by(comment_id: @comment.id)
    like.destroy
  end
end
