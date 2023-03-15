class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def total_price
    self.quantity * self.product.discounted_price
  end

end


