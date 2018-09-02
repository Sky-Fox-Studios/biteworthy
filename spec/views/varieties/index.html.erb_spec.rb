require 'rails_helper'

RSpec.describe "varieties/index", type: :view do
  before(:each) do
    assign(:varieties, [
      Variety.create!(
        :name => "Name",
        :ingredient_id => 2
      ),
      Variety.create!(
        :name => "Name",
        :ingredient_id => 2
      )
    ])
  end

  it "renders a list of varieties" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
