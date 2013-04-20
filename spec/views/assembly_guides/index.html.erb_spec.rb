require 'spec_helper'

describe "assembly_guides/index" do
  before(:each) do
    assign(:assembly_guides, [
      stub_model(AssemblyGuide,
        :description => "Description",
        :pcb => nil
      ),
      stub_model(AssemblyGuide,
        :description => "Description",
        :pcb => nil
      )
    ])
  end

  it "renders a list of assembly_guides" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
