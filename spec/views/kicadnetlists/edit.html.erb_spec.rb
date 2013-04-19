require 'spec_helper'

describe "kicadnetlists/edit" do
  before(:each) do
    @kicadnetlist = assign(:kicadnetlist, stub_model(Kicadnetlist))
  end

  it "renders the edit kicadnetlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", kicadnetlist_path(@kicadnetlist), "post" do
    end
  end
end
