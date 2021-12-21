## users Tabel

|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |

### Association

- has_many :items
- has_many :purchase_histories

## items Tabel

|Column           |Type        |Options                         |
|-----------------|------------|--------------------------------|
| items_name      | string     | null: false                    |
| items_profile   | text       | null: false                    |
| category        | integer    | null: false                    |
| items_situation | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| shipment_source | integer    | null: false                    |
| shipping_date   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :item_purchase_histories
- belongs_to :user

## purchase_histories Tabel

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| shipping_addresses | references | null: false                    |

 ### Association

- belongs_to :items
- belongs_to :user
- has_one :shipping_addresses

## shipping_addresses Tabel

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| post_code          | integer    | null: false                    |
| prefectures        | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | integer    | null: false                    |
| purchase_histories | references | null: false                    |

 ### Association

- belongs_to :purchase_histories