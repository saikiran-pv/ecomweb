require 'rails_helper'

RSpec.describe Product, type: :model do
  it "should have many line_items" do
    t = Product.reflect_on_association(:line_items)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many orders" do
    t = Product.reflect_on_association(:orders)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many reviews" do
    t = Product.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end

  it "belongs_to category" do
    t = Product.reflect_on_association(:category)
    expect(t.macro).to eq :belongs_to
  end
  it "belongs_to store" do
    t = Product.reflect_on_association(:store)
    expect(t.macro).to eq :belongs_to
  end

  subject { described_class.new(product_name: "test", description: "test", discount: 7, rating: 3, code: 10307) }

  it "is valid with valid product_name" do
    subject.product_name = nil 
    expect(subject).to_not be_valid
  end

  it "is valid with valid description" do
    subject.description = nil 
    expect(subject).to_not be_valid
  end

  it "is valid with valid discount" do
    subject.discount = nil 
    expect(subject).to_not be_valid
  end

  it "is valid with valid rating" do
    subject.rating = nil 
    expect(subject).to_not be_valid
  end

  it "is valid with valid code" do
    subject.code = nil 
    expect(subject).to_not be_valid
  end
end
