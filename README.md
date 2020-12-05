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
| birthday         | date | null: false |

### Association
 has_many :product
 has_many :orders

## productテーブル
|Column|Type|Options|
|------|----|-------|
| title | string | null: false |
| text | text | null: false |
| category_id | integer | null: false |
| sales_status_id | integer | null: false |
| deliveryfee_id | integer | null: false |
| deliveryarea_id | integer | null: false  |
| deliveryday_id | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_many   :images

## orders テーブル
|Column|Type|Options|
|------|----|-------|
| post_code | string | null: false|
| prefecture_id | integer | null: false|
| city | string | null: false|
| adless | string | null: false|
| building_name | string |      |
| phone_number | string | null: false|
| user | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 has_many :product

 ## shoppinghistoryテーブル
|Column|Type|Options|
|------|----|-------|
| user | references | null: false, foreign_key: true |
| prodauct | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :product