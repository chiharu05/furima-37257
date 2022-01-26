require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '全ての項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it 'items_nameが空では出品できない' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'items_profileが空では出品できない' do
        @item.items_profile = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品説明を入力してください')
      end
      it 'category_idが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'items_situation_idが空では出品できない' do
        @item.items_situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it 'delivery_charge_idが空では出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it 'shipment_source_idが空では出品できない' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it 'shipping_date_idが空では出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが¥300以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが¥9,999,999以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'priceが全角では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'userが存在しなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
