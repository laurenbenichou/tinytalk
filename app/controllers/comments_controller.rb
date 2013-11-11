class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @post.comments.create(params[:comment])
  end
end
