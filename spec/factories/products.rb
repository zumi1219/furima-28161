FactoryBot.define do
  factory :product do
    title                   {Faker::Name.initials}
    text                    {Faker::Lorem.sentence}
    category_id             { 2 }
    sales_status_id         { 3 }
    deliveryfee_id          { 2 }
    deliveryarea_id         { 3 }
    deliveryday_id          { 2 }
    price                   { 1000 }  
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end