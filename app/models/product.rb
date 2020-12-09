class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :deliveryarea
  belongs_to_active_hash :deliveryday

  with_options presence: true do
    validates :title, :text, :category_id, :sales_status_id, :deliveryfee_id, :deliveryarea_id, :deliveryday_id

    with_options format: {with: /\A[0-9]+\z/} do
      validates :price, numericality: { greater_than: 300 }, numericality: { less_than: 9999999}
    end
  end
end