class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:items_name, :image, :items_profile, :category_id, :items_situation_id, :delivery_charge_id, :shipment_source_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
    redirect_to action: :index
    end
  end

end
