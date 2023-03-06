## users テーブル

| Column              | Type     | Options                  |
| ------------------- | -------- | ------------------------ |
| nickname            | string   | null: false              |
| email               | string   | unique: true             |
| encrypteed_password | string   | unique: true             |
| first_name          | string   | null: false              |
| last_name           | string   | null: false              |
| first_name          | string   | null: false              |
| last_name           | string   | null: false              |
| birth_date          | date     | null: false              |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| name                   | string     | null: false       |
| explanation            | text       | null: false       |
| category               | string     | null: false       |
| situation              | string     | null: false       |
| shipping_origin_region | text       | null: false       |
| number_of_day          | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address


## buys テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| user              | references | null: false,foreign_key: true |
| product           | references | null: false,foreign_key: true |

### Association

- has_one :user
- has_one :products
- has_one :addresss

## addresses テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| post_code         | string     | null: false                   |
| prefecture_id     | string     | null: false                   |
| municipality      | integer    | null: false                   |
| address           | integer    | null: false                   |
| building name     | integer    |                               |
| phone_number      | string     | null: false                   |
| purchase_history  | references | null: false,foreign_key: true |

### Association

- belongs_to :buy
