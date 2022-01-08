class PurchaseHistoryController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase

  def index
    @order = Order.new
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase_history.present?
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:post_code, :shipment_source_id, :municipalities, :house_number, :building_name, :telephone_number, :purchase_history_id)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
