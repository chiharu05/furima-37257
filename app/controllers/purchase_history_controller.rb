#class PurchaseHistoryController < ApplicationController
  #def index
    #@item = Item.find(params[:item_id])
    #@purchase_history = PurchaseHistory.new
  #end

  #def create
    #@item = Item.find(params[:item_id])
    #@purchase_history = @item.purchase_history.new(purchase_history_params)
    #@purchase_history.save
  #end

  #private

  #def purchase_history_params
    #params.require(:purchase_history).merge(user_id: current_user.id, item_id: params[:item_id])
  #end
#end
