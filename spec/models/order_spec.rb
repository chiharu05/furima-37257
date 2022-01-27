require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '購入手続き' do
    context '購入手続きができる場合' do
      it '全ての項目が存在すれば手続きができる' do
        expect(@order).to be_valid
      end
      it 'building_nameが空でも手続きができる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
      it 'tokenがあれば手続きができる' do
        expect(@order).to be_valid
      end
    end

    context '購入手続きができない場合' do
      it 'post_codeが空では手続きができない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号を入力してください', '郵便番号は不正な値です')
      end
      it 'post_codeが全角文字では手続きができない' do
        @order.post_code = '１２３－４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'post_codeが数字のみでは手続きができない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'shipment_source_idが空では手続きができない' do
        @order.shipment_source_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'municipalitiesが空では手続きができない' do
        @order.municipalities = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'house_numberが空では手続きができない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('番地を入力してください')
      end
      it 'telephone_numberが空では手続きができない' do
        @order.telephone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号を入力してください', '電話番号は不正な値です')
      end
      it 'telephone_numberが10桁以下では手続きができない' do
        @order.telephone_number = '1234567890'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'telephone_numberが12桁以上では手続きができない' do
        @order.telephone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号は半角数値以外が入っていたら登録できない' do
        @order.telephone_number = '123-456-78'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空では手続きができない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
      it 'userが存在しなければ購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'itemが存在しなければ購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('商品を入力してください')
      end
    end
  end
end
