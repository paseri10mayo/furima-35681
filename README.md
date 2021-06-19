# README

## users テーブル

| Column             | Type          | Options                       |
| ------------------ | ------------- | ----------------------------- |
| nickname           | string        | null: false                   |
| email              | string        | null: false, unique: true     |
| encrypted_password | string        | null: false                   |
| first_name         | string        | null: false                   |
| last_name          | string        | null: false                   |
| first_name_kana    | string        | null: false                   |
| last_name_kana     | string        | null: false                   |
| birthday           | date          | null: false                   |

### Association

- has_many :items
- has_many :orders
- has_one :comments

## items テーブル

| Column       | Type          | Options                       |
| ------------ | ------------- | ----------------------------- |
| name         | string        | null: false                   |
| text         | text          | null: false                   |
| price        | integer       | null: false                   |
| category_id  | integer       | null: false                   |
| condition_id | integer       | null: false                   |
| charge_id    | integer       | null: false                   |
| area_id      | integer       | null: false                   |
| shipment_id  | integer       | null: false                   |
| user         | references    | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order
- has_one :comments

## orders テーブル

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| user      | references    | null: false, foreign_key: true |
| item      | references    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information

## informations テーブル

| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| postal_code  | string        | null: false                    |
| prefcture_id | integer       | null: false                    |
| city         | string        | null: false                    |
| address      | string        | null: false                    |
| building     | string        |                                |
| phone        | string        | null: false                    |
| order        | references    | null: false, foreign_key: true |

### Association

- belongs_to :order

## comments テーブル

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| text      | text          | null: false                   |
| user      | references    | null: false, foreign_key: true |
| item      | references    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user