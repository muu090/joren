class CommentsController < ApplicationController

  def create
    check_in = current_user.check_ins.find_by(store_id: params[:store_id])
    comment = current_user.comments.new(comment_params) 
    comment.store_id = params[:store_id] 
    comment.check_in_id = check_in.id
    if comment.save
      redirect_back(fallback_location: store_path(params[:store_id]))
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: store_path(user_id: params[:user_id],store_id: params[:store_id]))
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end

