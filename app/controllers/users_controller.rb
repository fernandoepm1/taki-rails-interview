class UsersController < ApplicationController
  skip_before_action :authenticate_user, :only => [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
end
