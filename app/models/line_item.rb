class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def total_price
    quantity.to_i * (product.discounted_price || product.price)
  end
end
