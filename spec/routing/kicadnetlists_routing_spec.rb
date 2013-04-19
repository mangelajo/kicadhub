require "spec_helper"

describe KicadnetlistsController do
  describe "routing" do

    it "routes to #index" do
      get("/kicadnetlists").should route_to("kicadnetlists#index")
    end

    it "routes to #new" do
      get("/kicadnetlists/new").should route_to("kicadnetlists#new")
    end

    it "routes to #show" do
      get("/kicadnetlists/1").should route_to("kicadnetlists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/kicadnetlists/1/edit").should route_to("kicadnetlists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/kicadnetlists").should route_to("kicadnetlists#create")
    end

    it "routes to #update" do
      put("/kicadnetlists/1").should route_to("kicadnetlists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/kicadnetlists/1").should route_to("kicadnetlists#destroy", :id => "1")
    end

  end
end
