require "spec_helper"

describe AssemblyGuidesController do
  describe "routing" do

    it "routes to #index" do
      get("/assembly_guides").should route_to("assembly_guides#index")
    end

    it "routes to #new" do
      get("/assembly_guides/new").should route_to("assembly_guides#new")
    end

    it "routes to #show" do
      get("/assembly_guides/1").should route_to("assembly_guides#show", :id => "1")
    end

    it "routes to #edit" do
      get("/assembly_guides/1/edit").should route_to("assembly_guides#edit", :id => "1")
    end

    it "routes to #create" do
      post("/assembly_guides").should route_to("assembly_guides#create")
    end

    it "routes to #update" do
      put("/assembly_guides/1").should route_to("assembly_guides#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/assembly_guides/1").should route_to("assembly_guides#destroy", :id => "1")
    end

  end
end
