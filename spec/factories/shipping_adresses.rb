FactoryBot.define do
  factory :shipping_adress do
    post_code          { '123-4567' }
    shipment_source_id { 15 }
    municipalities     { '横浜市緑区' }
    house_number       { '青山1-1-1' }
    building_name      { '柳ビル103' }
    telephone_number   { '09012345678' }

    association :purchase_history
    user_id               { 1 }
    item_id               { 1 }
  end
end
