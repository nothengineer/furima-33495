# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ----------         | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| familyname         | string | null: false |
| firstname          | string | null: false |
| familyname_kana    | string | null: false |
| firstname_kana     | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items
- has_many :buyers




## items テーブル

| Column           | Type       | Options                        |
| -----------      | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| category         | text       | null: false                    |
| condition        | text       | null: false                    |
| shipping_cost    | integer    | null: false                    |
| shipping_area    | integer    | null: false                    |
| days to ship     | integer    | null: false                    |
| price            | text       | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one :address




## addresses テーブル

| Column              | Type       | Options                        |
| -----------         | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefectures         | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| buyer               | references | null: false, foreign_key: true |


### Association

- belongs_to :buyer