class CartItem < ApplicationRecord

  with_options presence: true do
   validates :item_id
   validates :customer_id
   validates :amount
  end

  belongs_to :customer

  belongs_to :item

end
