class PurchaseHistoryController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_history = PurchaseHistory.new
    @shipping_adress = ShippingAdress.new
    @item = Item.find(params[:item_id])
  end

  def new
    @shipping_adress = ShippingAdress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_adress = ShippingAdress.new(shipping_adress_params)
    if @shipping_adress.valid?
      @shipping_adress.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_adress_params
    params.require(:shipping_adress).permit(:post_code, :shipment_source_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
