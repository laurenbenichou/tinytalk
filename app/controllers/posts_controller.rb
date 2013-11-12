class PostsController < ApplicationController
  def index
    @comment = Comment.all
    @comment = Comment.new
  end

  def create
    @board = Board.find(params[:id])
    @board.posts.create(params[:posts])
  end
end
