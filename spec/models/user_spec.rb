require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

describe 'ユーザー新規登録' do
  context '新規登録がうまくいくとき' do
    it 'nickname,email,password,password_comfirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayの値が存在すれば登録できること' do
      expect(@user).to be_valid
    end
  end
end

  context '新規登録がうまくいかないとき' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it '同じメールアドレスを登録できないこと' do
      user1 = FactoryBot.create(:user)
      @user.email = user1.email
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    it '@のないメールアドレスを登録できないこと' do
      @user.email = Faker::Lorem.characters(number: 10, min_alpha: 10) 
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end

    it 'paswordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'paswordが文字数５文字以下では登録できないこと' do
      @user.password = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1) 
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'paswordが半角アルファベットでは登録できないこと' do
      @user.password = Faker::Lorem.characters(number: 6, min_alpha: 6) 
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数で入力して下さい")
    end

    it 'paswordが数字のみでは登録できないこと' do
      @user.password = Faker::Lorem.characters(number: 6, min_numeric:6) 
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数で入力して下さい")
    end

    it 'paswordが全角英数のみでは登録できないこと' do
      password_zen = Faker::Lorem.characters(number: 1, min_numeric:1) 
      require 'nkf'
      password_zen.tr("A-Z0-9","Ａ-Ｚ０-９")
      @user.password = password_zen
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数で入力して下さい")
    end

    it 'pasword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード確認とパスワードの入力が一致しません")
    end

    it 'passworとpasword_confirmationが一致しないと登録できないこと' do
      @user.password = Faker::Lorem.characters(number: 7, min_alpha: 3, min_numeric: 1) 
      @user.password_confirmation =  Faker::Lorem.characters(number: 6, min_alpha: 3, min_numeric: 2) 
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード確認とパスワードの入力が一致しません")
    end

    it 'pasword_confirmationが文字数５文字以下では登録できないこと' do
      @user.password_confirmation = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1) 
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード確認とパスワードの入力が一致しません")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end

    it 'first_nameが半角では登録できないこと' do
      @user.first_name = Faker::Alphanumeric.alphanumeric(number: 4)
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end

    it 'last_nameが半角では登録できないこと' do
      @user.last_name = Faker::Alphanumeric.alphanumeric(number: 4)
      @user.valid?
      expect(@user.errors.full_messages).to include("名字は全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カタカナ)を入力してください")
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カタカナ)を入力してください")
    end

    it 'first_name_kanaが半角では登録できないこと' do
      require 'nkf'
      first_half_kana = Gimei.first.katakana
      @user.first_name_kana = NKF.nkf('-w -Z4 -x', first_half_kana)
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(カタカナ)は全角カタカナで入力して下さい")
    end

    it 'last_name_kanaが半角では登録できないこと' do
      require 'nkf'
      last_half_kana = Gimei.last.katakana
      @user.first_name_kana = NKF.nkf('-w -Z4 -x', last_half_kana)
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名字(カタカナ)は全角カタカナで入力して下さい")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
end