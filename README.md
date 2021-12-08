# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column              | Type   |  Options                  |
|---------------------|--------|---------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name1          | string | null: false               |
| first_name1         | string | null: false               |
| last_name2          | string | null: false               |
| first_name2         | string | null: false               |
| birthday            | integer| null: false               |

### association
- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       |  Options                        |
|---------------------|------------|---------------------------------|
| item_name           | string     | null: false                     |
| explain             | text       | null: false                     |
| category            | text       | null: false                     |
| status              | text       | null: false                     |
| charge              | text       | null: false                     |
| area                | text       | null: false                     |
| days                | integer    | null: false                     |
| price               | integer    | null: false                     |
| user_id             | references | null: false, foreign_key: true  |

### association
- has_one :order
- belongs_to :user

## orders テーブル

| Column              | Type       |  Options                        |
|---------------------|------------|---------------------------------|
| user_id             | references | null: false, foreign_key: true  |
| item_id             | references | null: false, foreign_key: true  |

### association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column              | Type       |  Options                        |
|---------------------|------------|---------------------------------|
| postal_code         | integer    | null: false                     |
| prefecture          | string     | null: false                     |
| municipalities      | string     | null: false                     |
| house_number        | text       | null: false                     |
| building            | text       | null: false                     |
| phone_number        | integer    | null: false                     |
| order_id            | references | null: false, foreign_key: true  |

### association
-belongs_to :order