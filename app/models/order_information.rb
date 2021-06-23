class OrderInformation
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :area_id, :city, :address, :building, :phone, :item_id, :user_id

  with_options presence: true do

    validates :token

    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "に半角のハイフンを入れて入力してください"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を全角のみで入力してください"}
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "を入力してください"}
    validates :user_id
    validates :item_id
  end

  validates :area_id, numericality: { other_than: 0, message: "を選んでください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Information.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end