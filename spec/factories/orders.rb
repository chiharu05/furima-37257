FactoryBot.define do
  factory :order do
    token               { 'tok_abcdefghijk00000000000000000' }
    post_code           { '123-4567' }
    shipment_source_id  { 15 }
    municipalities      { '横浜市緑区' }
    house_number        { '青山1-1-1' }
    telephone_number    { '09012345678' }
  end
end
