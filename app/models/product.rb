class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :reviews, dependent: :destroy, autosave: true

  belongs_to :category
  belongs_to :store

  mount_uploader :image, ImageUploader

  validates :product_name, presence: true
  validates :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image, allow_blank: false, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: "must be a URL for GIF, JPG or PNG image."
  }
  validates :code, numericality: {only_integer: true}, presence: true, uniqueness: true, length: {is: 5, message: "Assign unique product code with 5 digits"}

  def to_param
    code
  end

  def discounted_price
    if discount
      price - (price * (discount.to_f / 100))
    end
  end
end
