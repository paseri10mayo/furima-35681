require 'rails_helper'

RSpec.describe OrderInformation, type: :model do
  describe OrderInformation do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_information = FactoryBot.build(:order_information, user_id: user.id, item_id: item.id)
    sleep(1)
    end

    context '商品購入情報に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_information).to be_valid
      end
      
      it 'buildingは空でも保存できること' do
        @order_information.building = ''
        expect(@order_information).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_information.postal_code = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_information.postal_code = '1234567'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include('郵便番号に半角のハイフンを入れて入力してください')
      end

      it 'areaを選択していないと保存できないこと' do
        @order_information.area_id = 0
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("都道府県を選んでください")
      end

      it 'cityが空だと保存できないこと' do
        @order_information.city = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空だと保存できないこと' do
        @order_information.address = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("番地を入力してください")
      end

      it 'phoneが空だと保存できないこと' do
        @order_information.phone = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phoneが半角の数字でないと保存できないこと' do
        @order_information.phone = '０８０１２３４５６７８'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include('電話番号を半角の数字で入力してください')
      end
      
      it 'phoneが英数混合では保存できないこと' do
        @order_information.phone = 'slf84988213'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include('電話番号を半角の数字で入力してください')
      end

      it 'phoneが12桁以上では保存できないこと' do
        @order_information.phone = '23334444444444444'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include('電話番号を半角の数字で入力してください')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_information.user_id = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_information.item_id = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Itemを入力してください")
    end

      it "tokenが空では登録できないこと" do
        @order_information.token = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end