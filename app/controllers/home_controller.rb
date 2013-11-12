class HomeController < ApplicationController

   def signin
    if user_signed_in?
      redirect_to :index
    end
  end

  def index
    @user = current_user
    @boards = Board.all
    @board = Board.new
  end

  def action
  end



end
