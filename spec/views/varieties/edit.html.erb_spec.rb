require 'rails_helper'

RSpec.describe "varieties/edit", type: :view do
  before(:each) do
    @variety = assign(:variety, Variety.create!(
      :name => "MyString",
      :ingredient_id => 1
    ))
  end

  it "renders the edit variety form" do
    render

    assert_select "form[action=?][method=?]", variety_path(@variety), "post" do

      assert_select "input#variety_name[name=?]", "variety[name]"

      assert_select "input#variety_ingredient_id[name=?]", "variety[ingredient_id]"
    end
  end
end
