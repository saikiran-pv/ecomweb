class Product < ApplicationRecord
  CATEGORIES = %i[women men kids accessories]

  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  belongs_to :category
  belongs_to :store

  mount_uploader :image, ImageUploader
  
  validates :product_name, presence: true
  validates :description, presence: true
  validates :discount, presence: true,numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "Discount percentage must be between 0 and 100" }
  validates :rating, presence: true,  numericality: {greater_than: 0.0, less_than: 5.0, message: "Rating must be between 0 and 5"}
  validates :price,  numericality: { greater_than_or_equal_to: 0.01 }
  validates :image, allow_blank: false, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
    }
  validates :code, numericality: { only_integer: true}, presence: true, uniqueness: true, length: { is: 5 , message: "Assign product code with 5 digits"}
  
  def to_param
    code
  end
  
  private
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
