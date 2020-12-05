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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name        | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | integer | null: false |

### Association
 has_many :items
 has_many :orders

## productテーブル
|Column|Type|Options|
|------|----|-------|
| imeges_id | references | null: false, foreign_key: true |
| title | string | null: false |
| text | text | null: false |
| category_id | integer | null: false |
| sales_status_id | integer | null: false |
| deliveryfee | integer | null: false |
| deliveryarea | integer | null: false  |
| deliveryday | integer | null: false |
| price | integer | null: false |
| user_id | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_many   :images

## orders テーブル
|Column|Type|Options|
|------|----|-------|
| post_code | string | null: false|
| prefecture | string | null: false|
| city | string | null: false|
| adless | string | null: false|
| building_name | string | null: false|
| phone_number | string | null: false|
| user_id | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order

 ## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|string|null: false|
|expiration_date|string|null: false|
|security_code|string|null: false|

### Association
belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
| image | string | null: false |
| product_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :product

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
| name | string | null: false |
| product_id | integer | null: false, foreign_key: true |

### Association
 has_many :product