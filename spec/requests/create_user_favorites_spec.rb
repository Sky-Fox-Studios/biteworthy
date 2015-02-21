require 'rails_helper'

RSpec.describe "CreateUserFavorites", :type => :request do
  describe "GET /create_user_favorites" do
    it "works! (now write some real specs)" do
      get create_user_favorites_path
      expect(response).to have_http_status(200)
    end
  end
end
