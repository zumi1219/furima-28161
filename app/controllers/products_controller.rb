class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Produc.create(item_params)
  end

  private
  def product_params
  params.require(:product).permit(:title, :text, :category_id, :sales_status_id, :deliveryfee_id, :deliveryarea_id, :deliveryday_id, :price, :image).merge(user_id: current_user.id)
  end
end