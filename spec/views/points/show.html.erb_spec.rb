require 'rails_helper'

RSpec.describe "points/show", type: :view do
  before(:each) do
    @point = assign(:point, Point.create!(
      :user_id => 2,
      :object_id => 3,
      :object_class => "Object Class",
      :change_type => 4,
      :worth => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Object Class/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
