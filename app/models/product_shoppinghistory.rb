class ProductShoppinghistory
  
  include ActiveModel::Model
  attr_accessor :token, :post_code, :deliveryarea_id, :city, :address, :building_name, :phone_number
  with_options presence: true do
    validates :post_code, :deliveryarea_id, :city, :address, :phone_number
    validates :city, :phone_number, :building_name
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :deliveryarea_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    @shoppinghistory_id = Shoppinghistory.create(product_id: product_id, user_id: user_id)
    Order.create(post_code: post_code, deliveryarea_id: deliveryarea_id, city: city, address: address, building_name: building_name, phone_number: phone_number, shoppinghistory_id: @shoppinghistory.id)
  end

end