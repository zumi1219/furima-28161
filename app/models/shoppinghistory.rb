class Shoppinghistory < ApplicationRecord
  validates :price, presence: true
  validates :token, presence: true
  belongs_to :user
  belongs_to :product
  has_one :order
end