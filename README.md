# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_reading  | string | null: false |
| first_name_reading | string | null: false |

### Association

- has_many               :items
- has_many               :orders
- belongs_to_active_hash :birth

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| text     | text       | null: false                    |
| price    | integer    | null: false                    |
| sold_out | boolean    |                                |
| user     | references | null: false, foreign_key: true |

### Association

- has_one                :order
- belongs_to             :users
- has_one_attached       :image
- belongs_to_active_hash :genre
- belongs_to_active_hash :condition
- belongs_to_active_hash :ship_fee
- belongs_to_active_hash :ship_from
- belongs_to_active_hash :ship_days

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| price   | references | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to             :order
- belongs_to_active_hash :prefecture