# require 'rails_helper'

# RSpec.describe OrderInformation, type: :model do
#   describe OrderInformation do
#     before do
#       user = FactoryBot.create(:user)
#       item = FactoryBot.create(:item)
#       @order_information = FactoryBot.build(:order_information, user_id: user.id, item_id: item.id)
#     end

#     context '商品購入情報に問題ない場合' do
#       it 'すべての値が正しく入力されていれば保存できること' do
#         expect(@order_information).to be_valid
#       end
      
    #   it 'buildingは空でも保存できること' do
    #     @order_information.building = ''
    #     expect(@order_information).to be_valid
    #   end
    # end

    # context '内容に問題がある場合' do
    #   it 'postal_codeが空だと保存できないこと' do
    #     @order_information.postal_code = ''
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include("Postal code can't be blank")
    #   end

    #   it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    #     @order_information.postal_code = '1234567'
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    #   end

    #   it 'areaを選択していないと保存できないこと' do
    #     @order_information.area_id = 0
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include("Area can't be blank")
    #   end

    #   it 'cityが空だと保存できないこと' do
    #     @order_information.city = nil
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include("City can't be blank")
    #   end

    #   it 'addressが空だと保存できないこと' do
    #     @order_information.address = nil
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include("Address can't be blank")
    #   end

    #   it 'phoneが空だと保存できないこと' do
    #     @order_information.phone = nil
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include("Phone can't be blank")
    #   end

    #   it 'phoneが半角の数字でないと保存できないこと' do
    #     @order_information.phone = '０８０１２３４５６７８'
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include('Phone is invalid.')
    #   end
      
    #   it 'userが紐付いていないと保存できないこと' do
    #     @order_information.user_id = nil
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include("User can't be blank")

    #   it 'itemが紐付いていないと保存できないこと' do
    #     @order_information.item_id = nil
    #     @order_information.valid?
    #     expect(@order_information.errors.full_messages).to include("Item can't be blank")
    # end
#     end
#   end
# end