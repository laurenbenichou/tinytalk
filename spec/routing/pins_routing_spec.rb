require "spec_helper"

describe PinsController do
  describe "routing" do

    it "routes to #index" do
      get("/pins").should route_to("pins#index")
    end

    it "routes to #new" do
      get("/pins/new").should route_to("pins#new")
    end

    it "routes to #show" do
      get("/pins/1").should route_to("pins#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pins/1/edit").should route_to("pins#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pins").should route_to("pins#create")
    end

    it "routes to #update" do
      put("/pins/1").should route_to("pins#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pins/1").should route_to("pins#destroy", :id => "1")
    end

  end
end
