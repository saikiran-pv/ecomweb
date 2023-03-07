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
  belongs_to :store, optional: true

  # has_one :cart
  
  attribute :additional_address, :string

  validates :name, length: { maximum: 20 }

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

  validates :phone_number, presence: true, length: { is: 10, message:"must be 10 digits" }, format: { with: /[0-9]{10}/, message: "must be a valid" }

  def is_admin?
    super_admin? || store_admin? || staff?
  end
end
