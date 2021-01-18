class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]


  def index
  end

  def new
    @item = Item.new
    # @category_id = Category_id.all
    # @condition_id = Condition_id.all
    # @shipping_cost_id = Shipping_cost_id.all
    # @prefecture_id = Prefecture_id.all
    # @days_to_ship_id = Days_to_ship_id.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end


end
