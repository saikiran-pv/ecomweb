FactoryBot.define do
  factory :user do
    name { "Renu" }
    email { "renuperiketi@gmail.com" }
    password { "Renu@123" }
    address { "test" }
    phone_number { 9876678998 }
    role { "user" }
    store_id { 1 }
  end
end
