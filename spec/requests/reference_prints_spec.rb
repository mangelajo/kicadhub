require 'spec_helper'

describe "ReferencePrints" do
  describe "GET /reference_prints" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get reference_prints_path
      response.status.should be(200)
    end
  end
end
