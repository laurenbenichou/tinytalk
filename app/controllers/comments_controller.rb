class CommentsController < ApplicationController

  def create
    @comment = Comment.create(params[:comment])

    render :json => {
      comment: @comment,
      user: User.find(@comment.user_id)
    }, status: 201
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render text: "removed bucket_item", status: 200
  end
end
