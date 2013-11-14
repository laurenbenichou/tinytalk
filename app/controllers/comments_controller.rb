class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @post.comments.create(params[:comment])
  end

  def create
    @comment = Comment.create(params[:comment])
    @comment.user_id = current_user.id
    @comment.save

    # redirect_to index_path

    if @comment.commentable_type == "Pin"
      redirect_to "/boards/#{@comment.board_id}/pins/#{@comment.commentable_id}"
    end
  end
end
