require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do

    before do
      @product = FactoryBot.build(:product)
    end

    describe '商品出品' do
      context '商品出品がうまくいくとき' do

        it '全ての項目が入力されていれば出品ができる' do
          expect(@product).to be_valid
        end

      context '商品出品がうまくいかないとき' do

        it 'imageが空では登録されない' do
          @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end

        it 'titleが空では登録されない' do
          @product.title = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Title can't be blank")
        end

        it 'textが空では登録されない' do
          @product.text = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Text can't be blank")
        end

        it 'category_idが空では登録されない' do
          @product.category_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Category can't be blank")
        end

        it 'sales_status_idが空では登録されない' do
          @product.sales_status_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Sales status can't be blank", "Sales status is not a number")
        end

        it 'deliveryfee_idが空では登録されない' do
          @product.deliveryfee_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Deliveryfee must be other than 1")
        end

        it'deliveryarea_idが空では登録されない' do
          @product.deliveryarea_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Deliveryarea must be other than 1")
        end

        it 'deliveryday_idが空では登録されない' do
          @product.deliveryday_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Deliveryday must be other than 1")
        end

        it 'priceが空では登録されない' do
          @product.price = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is invalid", "Price is not a number")
        end

        it 'priceが半角数字以外では登録できない' do
          @product.price = "１０００"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが300より少ないと登録できない' do
          @product.price = 299
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be greater than 300")
        end

        it 'priceが9999999より多いと登録できない' do
          @product.price = 10000000
          @product.valid?
          expect(@product.errors.full_messages).to include("Price must be less than 9999999")
        end

        it 'category_idは1以外でなければ登録できない' do
          @product.category_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Category must be other than 1")
        end

        it 'sales_status_idが空では登録されない' do
          @product.sales_status_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Sales status must be other than 1")
        end
        end
      end
    end
  end
end