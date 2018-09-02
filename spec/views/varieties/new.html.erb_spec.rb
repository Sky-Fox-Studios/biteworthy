require 'rails_helper'

RSpec.describe "varieties/new", type: :view do
  before(:each) do
    assign(:variety, Variety.new(
      :name => "MyString",
      :ingredient_id => 1
    ))
  end

  it "renders new variety form" do
    render

    assert_select "form[action=?][method=?]", varieties_path, "post" do

      assert_select "input#variety_name[name=?]", "variety[name]"

      assert_select "input#variety_ingredient_id[name=?]", "variety[ingredient_id]"
    end
  end
end
