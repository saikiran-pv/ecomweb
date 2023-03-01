require 'rails_helper'

RSpec.describe Product, type: :model do
  it "belongs_to category" do
    t = described_class.reflect_on_association(:category)
    expect(t.macro).to eq :belongs_to
  end
  it "belongs_to store" do
    t = described_class.reflect_on_association(:store)
    expect(t.macro).to eq :belongs_to
  end
end
