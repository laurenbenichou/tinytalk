class BoardsController < ApplicationController

  def index
    # @posts = Post.all
    # @post = Post.new
    @board= Board.find(params[:board_id])
    @text_pins = @board.text_pins
    @pins = @board.pins
    @all = @text_pins + @pins

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
    @text_pins = @board.text_pins.order("created_at DESC")
    @all = @text_pins + @pins
  end

end
