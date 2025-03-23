FactoryBot.define do
  factory :product do
    product_name { "Test" }
    price { 1999.0 }
    description { "Test" }
    discount { 20 }
    visibility { 0 }
    image { "/path/to/something.jpg" }
    store_id { 1 }
    rating { 1 }
    code { 10303 }
    category_id { 2 }
  end
end
