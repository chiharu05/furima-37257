class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :items_name,         null: false
      t.text       :items_profile,      null: false
      t.integer    :category_id,        null: false
      t.integer    :items_situation_id, null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :shipment_source_id, null: false
      t.integer    :shipping_date_id,   null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
