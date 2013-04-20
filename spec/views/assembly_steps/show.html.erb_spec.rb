require 'spec_helper'

describe "assembly_steps/show" do
  before(:each) do
    @assembly_step = assign(:assembly_step, stub_model(AssemblyStep,
      :name => "Name",
      :assemblyguide => nil,
      :reference => nil,
      :index => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
