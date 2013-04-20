require 'spec_helper'

describe "reference_prints/index" do
  before(:each) do
    assign(:reference_prints, [
      stub_model(ReferencePrint,
        :name => "Name",
        :type => "Type",
        :assembly_guide => nil,
        :reference => nil,
        :index => 1
      ),
      stub_model(ReferencePrint,
        :name => "Name",
        :type => "Type",
        :assembly_guide => nil,
        :reference => nil,
        :index => 1
      )
    ])
  end

  it "renders a list of reference_prints" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
