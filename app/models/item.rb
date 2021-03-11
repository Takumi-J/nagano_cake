class Item < ApplicationRecord
  
  attachment :image
  
  validates :genre_id,:name,:introduction,:price,:image, presence: true
  
  belongs_to :genre
  
end
