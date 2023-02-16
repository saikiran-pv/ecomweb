class Product < ApplicationRecord
  belongs_to :store
  # belongs_to :user
  mount_uploader :image, ImageUploader
  def self.ransackable_attributes(auth_object = nil)
    %w(product_name description)
  end
end
