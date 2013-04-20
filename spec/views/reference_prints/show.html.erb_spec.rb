require 'spec_helper'

describe "reference_prints/show" do
  before(:each) do
    @reference_print = assign(:reference_print, stub_model(ReferencePrint,
      :name => "Name",
      :type => "Type",
      :assembly_guide => nil,
      :reference => nil,
      :index => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Type/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
