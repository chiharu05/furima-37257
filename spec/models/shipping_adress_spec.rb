require 'rails_helper'

RSpec.describe ShippingAdress, type: :model do
  before do
    @shipping_adress = FactoryBot.build(:shipping_adress)
  end

  describe '配送先住所' do
    context '内容に問題がある場合' do
      it 'purchase_historyが存在しなければ配送できない' do
        @shipping_adress.purchase_history = nil
        @shipping_adress.valid?
        expect(@shipping_adress.errors.full_messages).to include('Purchase history must exist')
      end
    end
  end
end
