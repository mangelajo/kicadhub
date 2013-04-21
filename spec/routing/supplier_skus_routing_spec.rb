require "spec_helper"

describe SupplierSkusController do
  describe "routing" do

    it "routes to #index" do
      get("/supplier_skus").should route_to("supplier_skus#index")
    end

    it "routes to #new" do
      get("/supplier_skus/new").should route_to("supplier_skus#new")
    end

    it "routes to #show" do
      get("/supplier_skus/1").should route_to("supplier_skus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supplier_skus/1/edit").should route_to("supplier_skus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supplier_skus").should route_to("supplier_skus#create")
    end

    it "routes to #update" do
      put("/supplier_skus/1").should route_to("supplier_skus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supplier_skus/1").should route_to("supplier_skus#destroy", :id => "1")
    end

  end
end
