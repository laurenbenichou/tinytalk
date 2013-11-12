class HomeController < ApplicationController

  def signin
    if user_signed_in?
      redirect_to :profile
    end
  end

  def action
  end

  def profile
   @user = current_user
  end

end
