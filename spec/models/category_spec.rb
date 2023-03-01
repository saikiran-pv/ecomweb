require 'rails_helper'

RSpec.describe Category, type: :model do
  it "should have many products" do
    t = Category.reflect_on_association(:products)
    expect(t.macro).to eq(:has_many)
  end
end
