class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update destroy]

  def index
    # List all of the Items that are owned by the logged in User's Business
    if current_business.present?
      @items = current_business.items
    else
    # If business not yet created, redirect to create a new business
      redirect_to new_business_path, notice: "Please create a business."
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.business = current_business

    if @item.save
      redirect_to items_path, notice: 'New item successfully added!'
    else
      flash.now[:alert] = 'Something went wrong, check the information given.'
      render :new
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: 'Item successfully updated!'
    else
      flash.now[:alert] = 'Something went wrong, check the information given.'
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path, notice: 'Item successfully deleted!'
    else
      flash.now[:alert] = 'Something went wrong.'
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:description, :price)
  end
end
