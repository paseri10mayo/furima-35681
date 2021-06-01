# README

## users テーブル

| Column     | Type          | Options                          |
| ---------- | ------------- | ----------------------------- |
| nickname   | string        | null: false                   |
| email      | string        | null: false                   |
| password   | string        | null: false                   |
| first_name | string        | null: false                   |
| last_name  | string        | null: false                   |
| birthday   | date          | null: false                   |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column    | Type          | Options                       |
| --------- | ------------- | ----------------------------- |
| name      | string        | null: false                   |
| price     | string        | null: false                   |
| category  | text          | null: false                   |
| seller    | string        | null: false                   |
| condition | text          | null: false                   |
| charges   | string        | null: false                   |
| area      | string        | null: false                   |
| shipment  | text          | null: false                   |
| user      | references    | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| name      | string        | null: false                    |
| item      | string        | null: false                    |
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
| prefcture    | integer        | null: false                    |
| city         | string        | null: false                    |
| address      | string        | null: false                    |
| building     | string        | null: false                    |
| phone        | string        | null: false                    |
| order        | references    | null: false, foreign_key: true |
| user         | references    | null: false, foreign_key: true |

### Association

- belongs_to :order
