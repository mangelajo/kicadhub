require 'spec_helper'

describe "AssemblyGuides" do
  describe "GET /assembly_guides" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get assembly_guides_path
      response.status.should be(200)
    end
  end
end
