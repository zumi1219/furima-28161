require 'rails_helper'

RSpec.describe ProductShoppinghistory, type: :model do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @product_shoppinghistory = FactoryBot.build(:product_shoppinghistory, user_id: user.id, product_id: product.id)
      sleep(1)
end


context '商品購入ができる時' do

  it '全ての項目が正しく入力されていれば登録できること' do
    expect(@product_shoppinghistory).to be_valid
  end

  it 'building_nameが存在していないなくても保存できること' do
    @product_shoppinghistory.building_name = nil
    expect(@product_shoppinghistory).to be_valid
  end
end

context '商品購入ができない時' do
  it 'post_codeが存在していない場合保存できないこと' do
    @product_shoppinghistory.post_code = nil
    @product_shoppinghistory.valid?
    expect(@product_shoppinghistory.errors.full_messages).to include("Post code can't be blank", "Post code can't be blank", "Post code is invalid. Include hyphen(-)")
  end
end

it 'post_codeにハイフンが含まれていない場合保存できないこと' do
  @product_shoppinghistory.post_code = '123456'
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
end

it 'deliveryarea_idが存在していない場合保存できないこと' do
  @product_shoppinghistory.deliveryarea_id = nil
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Deliveryarea can't be blank", "Deliveryarea can't be blank")
end

it 'deliveryarea_idが空の場合保存できないこと' do
  @product_shoppinghistory.deliveryarea_id = nil
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Deliveryarea can't be blank", "Deliveryarea can't be blank")
end

it 'deliveryarea_idが0の場合保存できないこと' do
  @product_shoppinghistory.deliveryarea_id = 0
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Deliveryarea can't be blank", "Deliveryarea can't be blank")
end

it 'cityが存在していない場合保存できないこと' do
  @product_shoppinghistory.city = nil
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("City can't be blank")
end

it 'addressが存在していない場合保存できないこと' do
  @product_shoppinghistory.address = nil
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Address can't be blank")
end

it 'phone_numberが存在していない場合保存できないこと' do
  @product_shoppinghistory.phone_number = nil
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Phone number can't be blank")
end

it 'phone_numberが11桁でなければ購入できない' do
  @product_shoppinghistory.phone_number = '090123456789'
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
end

it 'phone_numberがハイフン(-)を含む場合保存できないこと' do
  @product_shoppinghistory.phone_number = '090-1234-5678'
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Phone number is invalid", "Phone number is too long (maximum is 11 characters)")
end

it 'tokenが存在していない場合保存できないこと' do
  @product_shoppinghistory.token = nil
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Token can't be blank")
end

it 'user_idが空では購入できない' do
  @product_shoppinghistory.user_id = nil
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("User can't be blank")
end

it 'product_idが空では購入できない' do
  @product_shoppinghistory.product_id = nil
  @product_shoppinghistory.valid?
  expect(@product_shoppinghistory.errors.full_messages).to include("Product can't be blank")
end

it 'phone_numberが英数混合では登録できないこと' do
    @product_shoppinghistory.phone_number = '090abcd5678'
    @product_shoppinghistory.valid?
    expect(@product_shoppinghistory.errors.full_messages).to include("Phone number is invalid")
  end
  
end