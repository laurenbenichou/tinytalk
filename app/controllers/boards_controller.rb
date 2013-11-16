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

   def show #/boards/:id
    @board = Board.find(params[:id])
    @all = @board.pins + @board.text_pins
    @all.sort! {|a, b| b.created_at <=> a.created_at}
  end

  def destroy
    Board.delete(params[:id])
    render text: "removed board" , status: 200
  end

end
