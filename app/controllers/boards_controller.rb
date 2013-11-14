class BoardsController < ApplicationController

  def index
    # @posts = Post.all
    # @post = Post.new
  end

  def new
    @board = Board.new
  end

  def create
    @user = current_user
    @board = @user.boards.create(params[:board])
    render :json => @board, status: 201
  end

   def show #/boards/:id
    @board = Board.find(params[:id])
    @pins = @board.pins.order("created_at DESC")
  end

end
