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
    # comment = Comment.find_by(store_id: params[:id] ) # コメントと結びついた店舗モデルを1件取得
    # comment = current_user.comments.find_by(store_id: book.id)
    # comment.destroy
    # redirect_back(fallback_location: store_path(params[:id]))
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end

