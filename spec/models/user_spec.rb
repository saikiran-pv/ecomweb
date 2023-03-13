require 'rails_helper'

RSpec.describe User, type: :model do

  it "should have many orders" do
    t = User.reflect_on_association(:orders)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many reviews" do
    t = User.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end

  it "belongs to store" do
    t=User.reflect_on_association(:store)
    expect(t.macro).to eq :belongs_to
  end

  subject { described_class.new(name: "Renu", email: "renuperiketi@gmail.com", password: "Renu@1234", phone_number: 9876678998, role: "user") }

  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end

  it "is valid with valid name" do
    subject.name = nil 
    expect(subject).to_not be_valid
  end

  it "is valid with valid email" do
    subject.email = nil 
    expect(subject).to_not be_valid
  end

  it "is valid with valid password" do
    subject.password = nil 
    expect(subject).to_not be_valid
  end

  it "is valid with valid phone_number" do
    subject.phone_number = nil 
    expect(subject).to_not be_valid
  end

  it "is valid with valid name" do
    subject.role = nil 
    expect(subject).to_not be_valid
  end

  let(:name) { 'Renu' }
  context 'with a name that is over 20  chars' do
    let(:name) { 'long to be validated' }
    specify { expect(user).to be_invalid }
  end

end
