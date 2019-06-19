require "rails_helper"

RSpec.describe PointsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/points").to route_to("points#index")
    end

    it "routes to #new" do
      expect(:get => "/points/new").to route_to("points#new")
    end

    it "routes to #show" do
      expect(:get => "/points/1").to route_to("points#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/points/1/edit").to route_to("points#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/points").to route_to("points#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/points/1").to route_to("points#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/points/1").to route_to("points#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/points/1").to route_to("points#destroy", :id => "1")
    end
  end
end
