class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :items_situation
  belongs_to :delivery_charge
  belongs_to :shipment_source
  belongs_to :shipping_date

  belongs_to :user
  #has_one :purchase_history
end
