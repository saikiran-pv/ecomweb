class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, :autosave => true, :dependent => :destroy
  has_one :payment, :dependent => :destroy, :autosave => true
  has_many :products, through: :line_items, :autosave => true
  before_save :calculate_total_price

  belongs_to :address, :optional => true

  enum status: {
    in_cart: "in_cart",
    placed: "placed"
  }

  def calculate_total_price
    sum=0
    self.line_items.each do |line_item|
      sum += line_item.total_price
    end
    self.total_price = sum
  end

  def initial_order_status
    self.status = "in_cart"
  end

end

