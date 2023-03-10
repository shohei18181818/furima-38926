## users テーブル

| Column              | Type     | Options                  |
| ------------------- | -------- | ------------------------ |
| nickname            | string   | null: false              |
| email               | string   | null: false,unique: true |
| encrypted_password  | string   | null: false　            |
| first_name          | string   | null: false              |
| last_name           | string   | null: false              |
| first_name_kana     | string   | null: false              |
| last_name_kana      | string   | null: false              |
| birth_date          | date     | null: false              |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| situation_id       | integer    | null: false                   |
| shipping_charge_id | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| number_of_day_id   | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| user              | references | null: false,foreign_key: true |
| product           | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_code     | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| municipality  | string     | null: false                   |
| address       | string     | null: false                   |
| building_name | string     |                               |
| phone_number  | string     | null: false                   |
| buy           | references | null: false,foreign_key: true |


### Association

- belongs_to :buy
