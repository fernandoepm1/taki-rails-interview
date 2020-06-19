class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to current_user
    else
      redirect_to login_path
    end
  end
end
