class Payment < ApplicationRecord
  belongs_to :order

  validates :card_number, presence: true, uniqueness: true, numericality: {only_integer: true}, length: {is: 12, message: "must be of 12 digits"}
  validates :cvv, presence: true, numericality: {only_integer: true}, length: {is: 3, message: "must be of 3 digits"}
  validates :expiry_date, presence: true
end
