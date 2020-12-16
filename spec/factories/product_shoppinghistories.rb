FactoryBot.define do
  factory :product_shoppinghistory do

    token { '12345678' }
    post_code { '123-2345' }
    deliveryarea_id               { 40 }
    city         { 'テスト' }
    address { 'テスト' }
    phone_number     { '08012345678' }
  end
end
