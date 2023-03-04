## users テーブル

| Column      | Type     | Options                  |
| ----------- | -------- | ------------------------ |
| nickname    | string   | null: false              |
| email       | string   | null: false              |
| password    | string   | null: false,unique: true |
| first_name  | string   | null: false              |
| last_name   | string   | null: false              |
| first_name  | string   | null: false              |
| last_name   | string   | null: false              |
| birth_date  | datetime | null: false              |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| product                | product    | null: false       |
| image                  | text       | null: false       |
| explanation            | text       | null: false       |
| category               | string     | null: false       |
| situation              | string     | null: false       |
| shipping_origin_region | text       | null: false       |
| number_of_days         | datetime   | null: false       |
| price                  | integer    | null: false       |
| comment                | text       | null: false       |
| user_id                | references | foreign_key: true |
| buyer_id               | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :buys


## buys テーブル

| Column         | Type       | Options                   |
| -------------- | ---------- | ------------------------- |
| card_number    | Integer    | null: false, unique: true |
| date_of_expiry | Integer    | null: false, unique: true |
| security_code  | Integer    | null: false, unique: true |
| user_id        | references | foreign_key: true         |

### Association

- belongs_to :users
- has_many :products
- has_many :addresss

## addresss テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | Integer | null: false |
| prefectures   | string  | null: false |
| municipality  | string  | null: false |
| address       | string  | null: false |
| Building name | string  | null: false |
| phone_number  | string  | null: false |

### Association

- belongs_to :buys
