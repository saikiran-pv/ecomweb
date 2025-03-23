require "rails_helper"

RSpec.describe Cart, type: :model do
  it "belongs_to user" do
    t = Cart.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
end
