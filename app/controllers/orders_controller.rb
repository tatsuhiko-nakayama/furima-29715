class OrdersController < ApplicationController
  before_action :move_to_login
  before_action :move_to_toppage

  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_toppage
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
  end

end