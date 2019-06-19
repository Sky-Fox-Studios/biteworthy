require 'rails_helper'

RSpec.describe "points/new", type: :view do
  before(:each) do
    assign(:point, Point.new(
      :user_id => 1,
      :object_id => 1,
      :object_class => "MyString",
      :change_type => 1,
      :worth => 1
    ))
  end

  it "renders new point form" do
    render

    assert_select "form[action=?][method=?]", points_path, "post" do

      assert_select "input#point_user_id[name=?]", "point[user_id]"

      assert_select "input#point_object_id[name=?]", "point[object_id]"

      assert_select "input#point_object_class[name=?]", "point[object_class]"

      assert_select "input#point_change_type[name=?]", "point[change_type]"

      assert_select "input#point_worth[name=?]", "point[worth]"
    end
  end
end
