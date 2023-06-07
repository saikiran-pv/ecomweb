require "rails_helper"

RSpec.describe Store, type: :model do
  it "should have many products" do
    t = Store.reflect_on_association(:products)
    expect(t.macro).to eq(:has_many)
  end
end
