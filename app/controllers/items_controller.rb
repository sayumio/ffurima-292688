class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit,:show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :freight_id, :ship_region_id, :ship_bate_id, :price)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
