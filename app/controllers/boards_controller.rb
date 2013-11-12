class BoardsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @board = Board.create(params[:board])
    redirect_to boards_path
  end
end
