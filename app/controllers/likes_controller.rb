class LikesController < ApplicationController

  def create
    comment = Comment.find(params[:comment_id])
    like = current_user.likes.build(comment_id: comment.id)
    like.save
    # redirect_back(fallback_location: store_path(params[:store_id]))
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    like = current_user.likes.find_by(comment_id: comment.id)
    like.destroy
    # redirect_back(fallback_location: store_path(params[:store_id]))
  end
end
