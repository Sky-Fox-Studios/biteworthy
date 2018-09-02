require 'rails_helper'

RSpec.describe "Varieties", type: :request do
  describe "GET /varieties" do
    it "works! (now write some real specs)" do
      get varieties_path
      expect(response).to have_http_status(200)
    end
  end
end
