class Item < ApplicationRecord
  
  attachment :image
  
  validates :genre_id,:name,:introduction,:price,:image, presence: true
  
  belongs_to :genre
  
  has_many :cart_items, dependent: :destroy
  
  has_many :order_details, dependent: :destroy
  
end
