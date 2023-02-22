class Product < ApplicationRecord
  CATEGORIES = %i[women men kids accessories]
  
  belongs_to :category
  belongs_to :store

  mount_uploader :image, ImageUploader
  
  validates :product_name, :description, :discount, :rating, presence: true
  validates :price,  numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
    }
  validates :code, numericality: { only_integer: true}, presence: true, uniqueness: true, length: { is: 5 }
   

  def to_param
    code
  end
end
