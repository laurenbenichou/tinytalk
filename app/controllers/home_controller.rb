class HomeController < ApplicationController

   def signin
    if user_signed_in?
    redirect_to :index
    end
  end


  def index
    @user = current_user
    @board = Board.new
    @boards = @user.boards.sort!{|a, b| b.created_at <=> a.created_at}
    # @users_board = board.users
    gon.avatar = @user.avatar.url

  end


  def action
  end

#this updates the profile pic
  def update
    @user = current_user
    @user.update_attributes(params[:user])
    redirect_to :index
  end

end
