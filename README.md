## users テーブル

| Column              | Type     | Options                  |
| ------------------- | -------- | ------------------------ |
| nickname            | string   | null: false              |
| email               | string   | null: false,unique: true |
| encrypteed_password | string   | null: false,unique: true |
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
| name                   | product    | null: false       |
| explanation            | text       | null: false       |
| category               | string     | null: false       |
| situation              | string     | null: false       |
| shipping_origin_region | text       | null: false       |
| number_of_day          | integer    | null: false       |
| price                  | integer    | null: false       |
| user_id                | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy


## buys テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| user_id           | references | null: false,foreign_key: true |
| product_id        | references | null: false,foreign_key: true |

### Association

- has_one :user
- has_many :products
- has_many :addresss

## addresss テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| post_code         | Integer    | null: false                   |
| prefectures       | string     | null: false                   |
| municipality      | Integer    | null: false                   |
| address           | Integer    | null: false                   |
| Building name     | Integer    |                               |
| phone_number      | Integer    | null: false                   |
| Purchase_history  | references | null: false,foreign_key: true |

### Association

- belongs_to :buy
