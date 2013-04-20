require 'spec_helper'

describe "assembly_guides/show" do
  before(:each) do
    @assembly_guide = assign(:assembly_guide, stub_model(AssemblyGuide,
      :description => "Description",
      :pcb => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(//)
  end
end
