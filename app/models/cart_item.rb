class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def product_details
    ({ buying_quantity: buying_quantity }.merge ProductSerializer.new(product))
  end

end
