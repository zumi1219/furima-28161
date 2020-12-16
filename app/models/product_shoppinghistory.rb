class ProductShoppinghistory
  
include ActiveModel::Model
  attr_accessor :token, :post_code, :deliveryarea_id, :city, :address, :building_name, :phone_number, :product_id, :user_id
  
  with_options presence: true do
    validates :token, :deliveryarea_id, :city, :address
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: {maximum: 11}
  end

  validates :deliveryarea_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    shoppinghistory_id = Shoppinghistory.create(product_id: product_id, user_id: user_id)
    Order.create(post_code: post_code, deliveryarea_id: deliveryarea_id, city: city, address: address, building_name: building_name, phone_number: phone_number, shoppinghistory_id: shoppinghistory_id.id)
  end

end