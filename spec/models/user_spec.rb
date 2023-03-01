require 'rails_helper'

RSpec.describe User, type: :model do

  it "should have many orders" do
    t = User.reflect_on_association(:orders)
    expect(t.macro).to eq(:has_many)
  end

  it "should have one cart" do
    t = User.reflect_on_association(:carts)
    expect(t.macro).to eq(:has_one)
  end

  subject { described_class.new(name: name) }

  context "when the name is not present" do
    let(:name) { nil }

    it "is not valid" do
      expect(subject).not_to be_valid
    end

    it "has an error message on name" do
      subject.valid?
      expect(subject.errors[:name]).to include("can't be blank")
    end
  end

  context "when the name is too long" do
    let(:name) { "a" * 21 }

    it "is not valid" do
      expect(subject).not_to be_valid
    end

    it "has an error message on name" do
      subject.valid?
      expect(subject.errors[:name]).to include("is too long (maximum is 20 characters)")
    end
  end

  context "when the name is valid" do
    let(:name) { "John Doe" }

    it "is valid" do
      expect(subject).to be_valid
    end
  end


end
