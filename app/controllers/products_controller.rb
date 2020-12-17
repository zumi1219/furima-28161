class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  

  def index
    @product = Product.all.order(created_at: "DESC")
  end

  def show
    @product = Product.find(params[:id])
    @shoppinghistory = Shoppinghistory.find_by(product_id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user == @product.user
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
  end
end

  def set_product
    @product = Product.find(params[:id])
  end

  def destroy
    if user_signed_in? && current_user.id == @product.user_id
      @product.destroy
      redirect_to root_path
    end
  end


  private
  
  def product_params
  params.require(:product).permit(:title, :text, :category_id, :sales_status_id, :deliveryfee_id, :deliveryarea_id, :deliveryday_id, :price, :image).merge(user_id: current_user.id)
  end
end