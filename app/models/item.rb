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
  validates :name
  validates :text
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :categry_id,   numericality: { other_than: 0 }
  validates :condition_id, numericality: { other_than: 0 }
  validates :charge_id,    numericality: { other_than: 0 }
  validates :area_id,      numericality: { other_than: 0 }
  validates :shipment_id,  numericality: { other_than: 0 }
  validates :image
 end
end