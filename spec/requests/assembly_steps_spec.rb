require 'spec_helper'

describe "AssemblySteps" do
  describe "GET /assembly_steps" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get assembly_steps_path
      response.status.should be(200)
    end
  end
end
