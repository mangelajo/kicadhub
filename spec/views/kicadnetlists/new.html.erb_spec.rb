require 'spec_helper'

describe "kicadnetlists/new" do
  before(:each) do
    assign(:kicadnetlist, stub_model(Kicadnetlist).as_new_record)
  end

  it "renders new kicadnetlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", kicadnetlists_path, "post" do
    end
  end
end
