class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  after_save :calculate_rating

  def calculate_rating
    if product = self.product
      product.rating = product.reviews.average(:rating)
      product.save
    end
  end
end
