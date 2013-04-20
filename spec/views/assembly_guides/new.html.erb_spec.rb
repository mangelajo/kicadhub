require 'spec_helper'

describe "assembly_guides/new" do
  before(:each) do
    assign(:assembly_guide, stub_model(AssemblyGuide,
      :description => "MyString",
      :pcb => nil
    ).as_new_record)
  end

  it "renders new assembly_guide form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", assembly_guides_path, "post" do
      assert_select "input#assembly_guide_description[name=?]", "assembly_guide[description]"
      assert_select "input#assembly_guide_pcb[name=?]", "assembly_guide[pcb]"
    end
  end
end
