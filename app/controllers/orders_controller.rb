class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  def index
      @order = ProductShoppinghistory.new
      if current_user.id == @product.user_id ||@product.shoppinghistory.present?
        redirect_to root_path
      else
        render :index
      end
    end

  def create
    @order = ProductShoppinghistory.new(order_params)
   
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.require(:product_shoppinghistory).permit(:token, :post_code, :deliveryarea_id, :city, :address, :building_name, :phone_number,).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
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