require "spec_helper"

describe TextPinsController do
  describe "routing" do

    it "routes to #index" do
      get("/text_pins").should route_to("text_pins#index")
    end

    it "routes to #new" do
      get("/text_pins/new").should route_to("text_pins#new")
    end

    it "routes to #show" do
      get("/text_pins/1").should route_to("text_pins#show", :id => "1")
    end

    it "routes to #edit" do
      get("/text_pins/1/edit").should route_to("text_pins#edit", :id => "1")
    end

    it "routes to #create" do
      post("/text_pins").should route_to("text_pins#create")
    end

    it "routes to #update" do
      put("/text_pins/1").should route_to("text_pins#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/text_pins/1").should route_to("text_pins#destroy", :id => "1")
    end

  end
end
