class Address < ApplicationRecord
  belongs_to :user

  validates :zipcode, presence: true, length: {is: 6, message: "must be 6 digits"}
  validates :house, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :area, presence: true
end
