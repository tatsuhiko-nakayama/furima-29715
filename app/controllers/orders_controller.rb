class OrdersController < ApplicationController
  before_action :set_item_id, only: [:index, :create]
  before_action :move_to_login
  before_action :move_to_toppage

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_toppage
    redirect_to root_path if current_user.id == @item.user.id || @item.order
  end
end
