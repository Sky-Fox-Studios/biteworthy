require 'rails_helper'

RSpec.describe "points/edit", type: :view do
  before(:each) do
    @point = assign(:point, Point.create!(
      :user_id => 1,
      :object_id => 1,
      :object_class => "MyString",
      :change_type => 1,
      :worth => 1
    ))
  end

  it "renders the edit point form" do
    render

    assert_select "form[action=?][method=?]", point_path(@point), "post" do

      assert_select "input#point_user_id[name=?]", "point[user_id]"

      assert_select "input#point_object_id[name=?]", "point[object_id]"

      assert_select "input#point_object_class[name=?]", "point[object_class]"

      assert_select "input#point_change_type[name=?]", "point[change_type]"

      assert_select "input#point_worth[name=?]", "point[worth]"
    end
  end
end
