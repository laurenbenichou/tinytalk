class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create
    @user = current_user

    @users = params[:board][:users].map do |username|
      User.find_by_username(username)
    end.compact

    if @users.present?
      @board = @user.boards.create(:title => params[:board][:title])
      @users.each do |user|
        @board.users << user
      end
    end

    render :json => {board: @board, users: @board.users}, status: 201
  end

   def show
    @board = Board.find(params[:id])
    @user = current_user
    @all = @board.pins + @board.text_pins
    @all.sort! {|a, b| b.created_at <=> a.created_at}
    @users = @board.users

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {board: @board, users: @users}}
    end

  end

  def destroy
    Board.delete(params[:id])
    render text: "removed board" , status: 200
  end

  def remove_user_from_board
    board = Board.find(params[:board_id])
    board.users.delete(User.find(params[:user_id]))
    render text: "removed user" , status: 200
  end

  def update
    board = Board.find(params[:id])
    gon.board = @board

    @users = params[:board][:users].map do |username|
      User.find_by_username(username)
    end.compact

    if @users.present? && @users.length > 1
      @board = board.update_attributes(:title => params[:board][:title])
      @users.each do |user|
        board.users << user
      end
    else
      @board = board.update_attributes(:title => params[:board][:title])
      board.users << @users
    end

    render :json => {board: board, users: board.users}, status: 201
  end

end
