class ItemsController < ApplicationController
  #現段階で不使用 before_action :move_to_index, except: [:index, :show]

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text)
  end

  #現段階で不使用def move_to_index
    #現段階で不使用 unless user_signed_in?
      #現段階で不使用 redirect_to action: :index
    #現段階で不使用 end
  #現段階で不使用 end

end
