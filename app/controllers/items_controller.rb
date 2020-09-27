class ItemsController < ApplicationController
  before_action :move_to_show, only: :edit

  def index
    @items = Item.all.order("created_at DESC")
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :genre_id, :condition_id, :ship_fee_id, :ship_from_id, :ship_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_show
    @item = Item.find(params[:id])
    unless current_user == @item.user.id
      redirect_to item_path(@item.id)
    end
  end
end
