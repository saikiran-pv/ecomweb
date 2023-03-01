class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { 
    user: 'user',
    super_admin: 'super_admin',
    store_admin: 'store_admin',
    staff: 'staff'
  }

  has_many :orders
  # has_one :cart
  attribute :additional_address, :string

  validates :name, presence: true, length: { maximum: 20 }

  validates :email, presence: true, length: { maximum: 30 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> { role == 'User' },
                    uniqueness: { case_sensitive: false, message: "has already been taken" }
  
  validates :email, presence: true, length: { maximum: 30 },
                    format: { with: /\A[\w+\-.]+@shopify\.com\z/i }, if: -> { role == 'Admin' },
                    uniqueness: { case_sensitive: false, message: "has already been taken" }
  
  validates :email, presence: true, length: { maximum: 30 },
                    format: { with: /\A[\w+\-.]+@shopify\.com\z/i }, if: -> { role == 'Store Admin' },
                    uniqueness: { case_sensitive: false, message: "has already been taken" }

  validates :email, presence: true, length: { maximum: 30 },
                    format: { with: /\A[\w+\-.]+@shopify\.com\z/i }, if: -> { role == 'Staff' },
                    uniqueness: { case_sensitive: false, message: "has already been taken" }

  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10 digit phone number" }
end
