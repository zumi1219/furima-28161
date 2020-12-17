FactoryBot.define do
  factory :shoppinghistory do
    post_code { '123-2345' }
    deliveryarea_id               { 40 }
    city         { '福岡' }
    address { '福岡' }
    building_name { '東京ビル' }
    phone_number     { '08012345678' }
    association :user
    association :product
  end
end