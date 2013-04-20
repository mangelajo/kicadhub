require "spec_helper"

describe PcbsController do
  describe "routing" do

    it "routes to #index" do
      get("/pcbs").should route_to("pcbs#index")
    end

    it "routes to #new" do
      get("/pcbs/new").should route_to("pcbs#new")
    end

    it "routes to #show" do
      get("/pcbs/1").should route_to("pcbs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pcbs/1/edit").should route_to("pcbs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pcbs").should route_to("pcbs#create")
    end

    it "routes to #update" do
      put("/pcbs/1").should route_to("pcbs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pcbs/1").should route_to("pcbs#destroy", :id => "1")
    end

  end
end
