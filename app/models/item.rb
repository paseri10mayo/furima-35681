class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
  validates :name
  validates :text
  validates :price
  validates :categry_id
  validates :condition_id
  validates :charge_id
  validates :area_id
  validates :shipment_id
  validates :image
 end
end