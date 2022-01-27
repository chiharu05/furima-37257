class Order
  include ActiveModel::Model
  attr_accessor :post_code, :shipment_source_id, :municipalities, :house_number, :building_name, :telephone_number,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipalities
    validates :house_number
    validates :telephone_number, format: { with: /\A0[0-9]{10,11}\z/ }
    validates :token
  end
  validates :shipment_source_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    ShippingAdress.create(post_code: post_code, shipment_source_id: shipment_source_id, municipalities: municipalities,
                          house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_history_id: purchase_history.id)
  end
end
