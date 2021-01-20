class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]


  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if  @item.update(item_params)
        redirect_to root_path
    else
      render :edit 
    end
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end


end
