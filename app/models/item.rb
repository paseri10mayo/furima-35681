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
  
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  
  with_options presence: true do
    validates :image
    validates :name
    validates :text   
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end
  
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :categry_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :shipment_id
  end
end