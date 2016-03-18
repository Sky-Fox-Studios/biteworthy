require "rails_helper"

RSpec.describe CreateUserFavoritesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/create_user_favorites").to route_to("create_user_favorites#index")
    end

    it "routes to #new" do
      expect(:get => "/create_user_favorites/new").to route_to("create_user_favorites#new")
    end

    it "routes to #show" do
      expect(:get => "/create_user_favorites/1").to route_to("create_user_favorites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/create_user_favorites/1/edit").to route_to("create_user_favorites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/create_user_favorites").to route_to("create_user_favorites#create")
    end

    it "routes to #update" do
      expect(:put => "/create_user_favorites/1").to route_to("create_user_favorites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/create_user_favorites/1").to route_to("create_user_favorites#destroy", :id => "1")
    end

  end
end
