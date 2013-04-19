require 'spec_helper'

describe "kicadnetlists/show" do
  before(:each) do
    @kicadnetlist = assign(:kicadnetlist, stub_model(Kicadnetlist))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
