require "rails_helper"

RSpec.describe VarietiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/varieties").to route_to("varieties#index")
    end

    it "routes to #new" do
      expect(:get => "/varieties/new").to route_to("varieties#new")
    end

    it "routes to #show" do
      expect(:get => "/varieties/1").to route_to("varieties#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/varieties/1/edit").to route_to("varieties#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/varieties").to route_to("varieties#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/varieties/1").to route_to("varieties#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/varieties/1").to route_to("varieties#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/varieties/1").to route_to("varieties#destroy", :id => "1")
    end

  end
end
