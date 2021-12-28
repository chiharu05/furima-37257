class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :items_situation
  belongs_to :delivery_charge
  belongs_to :shipment_source
  belongs_to :shipping_date

  with_options presence: true do
    validates :items_name
    validates :image
    validates :items_profile
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :items_situation_id
    validates :delivery_charge_id
    validates :shipment_source_id
    validates :shipping_date_id
  end

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 999}
end
