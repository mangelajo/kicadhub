require "spec_helper"

describe AssemblyStepsController do
  describe "routing" do

    it "routes to #index" do
      get("/assembly_steps").should route_to("assembly_steps#index")
    end

    it "routes to #new" do
      get("/assembly_steps/new").should route_to("assembly_steps#new")
    end

    it "routes to #show" do
      get("/assembly_steps/1").should route_to("assembly_steps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/assembly_steps/1/edit").should route_to("assembly_steps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/assembly_steps").should route_to("assembly_steps#create")
    end

    it "routes to #update" do
      put("/assembly_steps/1").should route_to("assembly_steps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/assembly_steps/1").should route_to("assembly_steps#destroy", :id => "1")
    end

  end
end
