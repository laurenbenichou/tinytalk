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

    @users = params[:board][:users].map do |username|
      User.find_by_username(username)
    end

    if @users.present?
      @board = @user.boards.create(:title => params[:board][:title])
      @users.each do |user|
        @board.users << user
      end
    end

    render :json => {board: @board, users: @board.users}, status: 201
  end

   def show #/boards/:id
    @board = Board.find(params[:id])
    @pins = @board.pins.order("created_at DESC")
    @text_pins = @board.text_pins.order("created_at DESC")
    @all = @text_pins + @pins
  end

  def destroy
    Board.delete(params[:id])
    render text: "removed board" , status: 200
  end

end
