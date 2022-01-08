FactoryBot.define do
  factory :shipping_adress do
    association :purchase_history
  end
end
