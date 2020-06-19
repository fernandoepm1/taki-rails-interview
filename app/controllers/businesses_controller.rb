class BusinessesController < ApplicationController
  before_action :set_business, only: %i[edit update]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user

    if @business.save
      redirect_to @business.user, notice: 'Successfully registered your business!'
    else
      flash.now[:alert] = 'Something went wrong, check the information given.'
      render :new
    end
  end

  def edit; end

  def update
    if @business.update(business_params)
      redirect_to @business.user, notice: 'Successfully updated your business!'
    else
      flash.now[:alert] = 'Something went wrong, check the information given.'
      render :edit
    end
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :address, :city)
  end
end
