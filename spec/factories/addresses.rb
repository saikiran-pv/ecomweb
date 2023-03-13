FactoryBot.define do
  factory :address do
    user { nil }
    house { "MyString" }
    area { "MyString" }
    city { "MyString" }
    zipcode { 1 }
    country { "MyString" }
  end
end
