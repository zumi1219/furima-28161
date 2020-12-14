class ShoppinghistoryController < ApplicationController
  before_action :authenticate_user!

  def index
    @product = Product.find(params[:product_id])
    @product_ = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    
    @shoppinghistory = ProductShoppinghistory.new(order_params)
    # binding.pry
    if @shoppinghistory.valid?
      pay_item
      @shoppinghistory.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def order_params
    params.permit(:token, :post_code, :deliveryarea_id :city, :adress, :building_name, :phone_number, :product_id).merge(user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end