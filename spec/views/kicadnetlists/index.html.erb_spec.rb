require 'spec_helper'

describe "kicadnetlists/index" do
  before(:each) do
    assign(:kicadnetlists, [
      stub_model(Kicadnetlist),
      stub_model(Kicadnetlist)
    ])
  end

  it "renders a list of kicadnetlists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
