FactoryBot.define do
  factory :payment do
    card_number { 1 }
    cvv { 1 }
    expiry_date { "2023-03-14" }
  end
end
