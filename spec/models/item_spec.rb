require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

describe '商品情報入力' do
  context '商品出品がうまくいくとき' do
    it 'name,image,text,categry_id,condition_id,charge_id,area_id,shipment_id,priceの値が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
end

context '商品出品がうまくいかないとき' do
  it 'nameが空では出品できない' do
   @item.name = nil
   @item.valid?
   expect(@item.errors.full_messages).to include("Name can't be blank")
 end

it 'imageが空だと出品できない' do
   @item.image = nil
   @item.valid?
   expect(@item.errors.full_messages).to include("Image can't be blank")
 end

 it 'textが空だと出品できない' do
   @item.text = nil
   @item.valid?
   expect(@item.errors.full_messages).to include("Text can't be blank")
 end

 it 'categryが未選択だと出品できない' do
   @item.categry_id = 0
   @item.valid?
   expect(@item.errors.full_messages).to include("Categry can't be blank")
 end
 it 'conditionが未選択だと出品できない' do
  @item.condition_id = 0
  @item.valid?
  expect(@item.errors.full_messages).to include("Condition can't be blank")
end

it 'chargeが未選択だと出品できない' do
  @item.charge_id = 0
  @item.valid?
  expect(@item.errors.full_messages).to include("Charge can't be blank")
end

it 'areaが未選択だと出品できない' do
  @item.area_id = 0
  @item.valid?
  expect(@item.errors.full_messages).to include("Area can't be blank")
end

it 'shipmentが未選択だと出品できない' do
  @item.shipment_id = 0
  @item.valid?
  expect(@item.errors.full_messages).to include("Shipment can't be blank")
end

it 'priceが空だと出品できない' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank")
end

it '販売価格についての情報が必須であること' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank", "Price Half-width number", "Price Out of setting range")
end

it '商品価格が299円以下では出品できない' do
  @item.price = 299
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Out of setting range")
end

it '商品価格が10_000_000円以上では出品できない' do
  @item.price = 10000001
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Out of setting range")
end

it "商品価格は半角数字のみでないとアイテムは保存できない" do
  @item.price = '２０００'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Half-width number")
end

it "商品価格が半角英数字混合では出品できない" do
  @item.price = 'l2ldd7'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Half-width number")
end

it "商品価格が半角英字のみでは出品できない" do
  @item.price = 'kdjfl'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price Half-width number")
end
end
end
end
