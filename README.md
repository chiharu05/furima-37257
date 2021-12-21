## users Tabel

|Column              |Type     |Options                    |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| date_of_birth      | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_histories

## items Tabel

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| items_name         | string     | null: false                    |
| items_profile      | text       | null: false                    |
| category_id        | integer    | null: false                    |
| items_situation_id | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :purchase_history
- belongs_to :user

## purchase_histories Tabel

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

 ### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address

## shipping_addresses Tabel

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| post_code          | string     | null: false                    |
| shipment_source_id | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |
| purchase_history   | references | null: false                    |

 ### Association

- belongs_to :purchase_history