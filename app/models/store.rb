class Store < ApplicationRecord
  mount_uploader :logo, ImageUploader
  has_many :products, dependent: :destroy

  validates :store_name, uniqueness: {message: "already exists"}
  validates :description, presence: {message: " needs to be filled"}
end
