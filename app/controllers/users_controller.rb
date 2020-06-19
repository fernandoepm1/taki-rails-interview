class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]

  before_action :set_user, only: %i[show edit update]

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: 'Successfully created user. You can now login!'
    else
      flash.now[:alert] = 'Something went wrong, check the information given.'
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Successfully updated user!'
    else
      flash.now[:alert] = 'Something went wrong, check the information given.'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation
    )
  end
end
