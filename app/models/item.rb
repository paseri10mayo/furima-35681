class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categry
  belongs_to :condition
  belongs_to :charge
  belongs_to :shipment
  belongs_to :area

  belongs_to :user
  has_one_attached :image
  

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :categry_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :charge_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipment_id, numericality: { other_than: 0, message: "can't be blank" }
  end
end