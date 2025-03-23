FactoryBot.define do
  factory :order do
    user_id { 1 }
    total_price { 999.0 }
    status { "Test" }
    payment_status { "in_cart" }
  end
end
