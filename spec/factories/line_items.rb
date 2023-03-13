FactoryBot.define do
  factory :line_item do
    product_id { 1 }
    order_id { 1 }
    quantity { 1 }
    price { 1 }
  end
end
