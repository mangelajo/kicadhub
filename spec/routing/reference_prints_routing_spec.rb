require "spec_helper"

describe ReferencePrintsController do
  describe "routing" do

    it "routes to #index" do
      get("/reference_prints").should route_to("reference_prints#index")
    end

    it "routes to #new" do
      get("/reference_prints/new").should route_to("reference_prints#new")
    end

    it "routes to #show" do
      get("/reference_prints/1").should route_to("reference_prints#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reference_prints/1/edit").should route_to("reference_prints#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reference_prints").should route_to("reference_prints#create")
    end

    it "routes to #update" do
      put("/reference_prints/1").should route_to("reference_prints#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reference_prints/1").should route_to("reference_prints#destroy", :id => "1")
    end

  end
end
