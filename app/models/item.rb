class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categry
  belongs_to :condition
  belongs_to :charge
  belongs_to :shipment
  belongs_to :area

  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments
  
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'を半角数字のみで入力してください' }
  
  with_options presence: true do
    validates :image
    validates :name
    validates :text   
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を300~9,999,999円の間で入力してください' }
  end
  
  with_options numericality: { other_than: 0, message: "を選んでください" } do
    validates :categry_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :shipment_id
  end
end