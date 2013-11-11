class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @post = Post.create(params[:post])
    redirect_to boards_path
  end
end
