class Comment < ApplicationRecord
  validates :c_text, presence: true, length: { maximum: 60 }
  
  belongs_to :user
  belongs_to :item
end