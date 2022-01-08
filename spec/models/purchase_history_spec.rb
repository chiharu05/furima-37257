require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  before do
    @purchase_history = FactoryBot.build(:purchase_history)
  end

  describe '商品の購入' do
    context '商品が購入できない場合' do
      it 'userが存在しなければ購入できない' do
        @purchase_history.user = nil
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include('User must exist')
      end
      it 'itemが存在しなければ購入できない' do
        @purchase_history.item = nil
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
