require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
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
        expect(@order.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid')
      end
      it 'post_codeが全角文字では手続きができない' do
        @order.post_code = '１２３－４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeが数字のみでは手続きができない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid')
      end
      it 'shipment_source_idが空では手続きができない' do
        @order.shipment_source_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'municipalitiesが空では手続きができない' do
        @order.municipalities = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空では手続きができない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空では手続きができない' do
        @order.telephone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁以下では手続きができない' do
        @order.telephone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが11桁以上では手続きができない' do
        @order.telephone_number = '12345678901'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空では手続きができない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
