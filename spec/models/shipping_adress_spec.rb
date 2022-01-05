require 'rails_helper'

RSpec.describe ShippingAdress, type: :model do
  before do
    @shipping_adress = FactoryBot.build(:shipping_adress)
  end

  describe '商品の購入手続き' do
    context '商品の購入手続きができる場合' do
      it '全ての項目が存在すれば手続きができる' do
        expect(@shipping_adress).to be_valid
      end
      it 'building_nameが空でも手続きができる' do
        @shipping_adress.building_name = nil
        expect(@shipping_adress).to be_valid
      end
    end

    context '商品の購入手続きができない場合' do
      it 'post_codeが空では手続きができない' do
        @shipping_adress.post_code = nil
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it 'post_codeが全角文字では手続きができない' do
        @shipping_adress.post_code = '１２３－４５６７'
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが数字のみでは手続きができない' do
        @shipping_adress.post_code = '1234567'
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("Post code is invalid")
      end
      it 'shipment_source_idが空では手続きができない' do
        @shipping_adress.shipment_source_id = 1
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'municipalitiesが空では手続きができない' do
        @shipping_adress.municipalities = nil
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空では手続きができない' do
        @shipping_adress.house_number = nil
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空では手続きができない' do
        @shipping_adress.telephone_number = nil
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁以下では手続きができない' do
        @shipping_adress.telephone_number = '123456789'
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが11桁以上では手続きができない' do
        @shipping_adress.telephone_number = '12345678901'
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'purchase_historyが存在しなければ出品できない' do
        @shipping_adress.purchase_history = nil
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include('Purchase history must exist')
      end
    end
  end
end