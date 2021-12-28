require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品が出品できる場合" do
      it "全ての項目が存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が出品できない場合" do
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "items_nameが空では出品できない" do
        @item.items_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end
      it "items_profileが空では出品できない" do
        @item.items_profile = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Items profile can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "items_situation_idが空では出品できない" do
        @item.items_situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Items situation must be other than 1")
      end
      it "delivery_charge_idが空では出品できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it "shipment_source_idが空では出品できない" do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
      end
      it "shipping_date_idが空では出品できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it "priceが空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが¥300以下では出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが¥9,999,999以上では出品できない" do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが全角では出品できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
