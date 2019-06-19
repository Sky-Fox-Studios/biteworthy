require 'rails_helper'

RSpec.describe "points/index", type: :view do
  before(:each) do
    assign(:points, [
      Point.create!(
        :user_id => 2,
        :object_id => 3,
        :object_class => "Object Class",
        :change_type => 4,
        :worth => 5
      ),
      Point.create!(
        :user_id => 2,
        :object_id => 3,
        :object_class => "Object Class",
        :change_type => 4,
        :worth => 5
      )
    ])
  end

  it "renders a list of points" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Object Class".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
