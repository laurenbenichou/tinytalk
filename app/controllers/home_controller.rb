class HomeController < ApplicationController

  def index
    @boards = Board.all
    @board = Board.new
  end

  def create
    @board = Board.create(params[:board])
    redirect_to boards_path
  end

  def signin
    if user_signed_in?
      redirect_to :profile
    end
  end

  def action
  end

  def profile
  end

end
