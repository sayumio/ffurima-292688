# テーブル設計

## users テーブル

| Column                     | Type     | Options                   |
| ---------------------------| -------- | ------------------------- |
| nickname                   | string   | null: false               |
| email                      | string   | null: false, unique: true |
| password                   | string   | null: false               |
| is_password_authenticated  | string   | null: false               |
| family_name                | string   | null: false               |
| first_name                 | string   | null: false               |
| kana_family_name           | string   | null: false               |
| kana_firrst_name           | string   | null: false               |
| birth_date                 | datetime | null: false               |

### Association

- has_many    :items
- has_many    :orders

## items テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| :name           | string  | null: false                    |
| :description    | text    | null: false                    |
| :status_id      | integer | null: false                    |
| :freight_id     | integer | null: false                    |
| :ship_region_id | integer | null: false                    |
| :ship_bate_id   | integer | null: false                    |
| :price          | integer | null: false                    |
| :user_id        | integer | null: false, foreign_key: true |

### Association

- belongs_to  :user
- has_one     :order


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| region_id    | integer    | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :order