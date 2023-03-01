require 'rails_helper'

RSpec.describe "line_items/edit", type: :view do
  let(:line_item) {
    LineItem.create!()
  }

  before(:each) do
    assign(:line_item, line_item)
  end

  it "renders the edit line_item form" do
    render

    assert_select "form[action=?][method=?]", line_item_path(line_item), "post" do
    end
  end
end
