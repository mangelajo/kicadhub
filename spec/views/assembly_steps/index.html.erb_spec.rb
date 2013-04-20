require 'spec_helper'

describe "assembly_steps/index" do
  before(:each) do
    assign(:assembly_steps, [
      stub_model(AssemblyStep,
        :name => "Name",
        :assemblyguide => nil,
        :reference => nil,
        :index => 1
      ),
      stub_model(AssemblyStep,
        :name => "Name",
        :assemblyguide => nil,
        :reference => nil,
        :index => 1
      )
    ])
  end

  it "renders a list of assembly_steps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
