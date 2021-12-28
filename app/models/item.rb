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
    validates :price
  end

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :items_situation_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipment_source_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" } 

end
