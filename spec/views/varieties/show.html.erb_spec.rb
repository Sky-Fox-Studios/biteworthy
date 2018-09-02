require 'rails_helper'

RSpec.describe "varieties/show", type: :view do
  before(:each) do
    @variety = assign(:variety, Variety.create!(
      :name => "Name",
      :ingredient_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
