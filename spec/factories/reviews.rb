FactoryBot.define do
  factory :review do
    rating { 1 }
    comment { "MyText" }
    user_id { 1 }
    product_id { 1 }
  end
end
