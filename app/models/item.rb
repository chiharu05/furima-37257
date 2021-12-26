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

  validates :items_name, :items_profile, :price,  presence: true
  validates :category_id, :items_situation_id, :delivery_charge_id, :shipment_source_id, :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" } 

end
