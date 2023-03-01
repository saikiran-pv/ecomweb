require 'rails_helper'

RSpec.describe "line_items/show", type: :view do
  before(:each) do
    assign(:line_item, LineItem.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
