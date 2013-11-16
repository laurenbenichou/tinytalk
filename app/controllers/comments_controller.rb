class CommentsController < ApplicationController

  def create
    @comment = Comment.create(params[:comment])
    @comment.user_id = current_user.id
    @comment.save

    render :json => {
      comment: @comment,
      user: @current_user
    }, status: 201
  end
end
