FactoryBot.define do
  factory :shoppinghistory do
    token {'PAYJP_PUBLIC_KEY'}
    post_code { '810-0022' }
    deliveryarea_id               { '40' }
    city         { '福岡' }
    adress { '福岡' }
    phone_number     { '08012345678' }

  end
end