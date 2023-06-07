require "rails_helper"

RSpec.describe Review, type: :model do
  it "should belong to user" do
    t = Review.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
  it "should belong to product" do
    t = Review.reflect_on_association(:product)
    expect(t.macro).to eq(:belongs_to)
  end
end
