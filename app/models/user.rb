class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
     validates :nickname, :birthday, :password_confirmation
     validates :first_name, :last_name, format: { with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
     validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい" }
   end
  validates :password, :password_confirmation,
  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数で入力して下さい" }

  has_many :items
 end