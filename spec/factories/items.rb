FactoryBot.define do
  factory :item do
    items_name         { '名前' }
    items_profile      { '説明' }
    category_id        { 8 }
    items_situation_id { 2 }
    delivery_charge_id { 2 }
    shipment_source_id { 2 }
    shipping_date_id   { 2 }
    price              { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
