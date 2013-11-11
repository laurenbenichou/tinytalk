class BoardsController < ApplicationController
  def index
    @boards = Board.all
    @board = Board.new
    @post = Post.new
  end

  def create
    @board = Board.create(params[:board])
    redirect_to boards_path
  end
end
