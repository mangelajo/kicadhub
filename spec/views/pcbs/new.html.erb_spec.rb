require 'spec_helper'

describe "pcbs/new" do
  before(:each) do
    assign(:pcb, stub_model(Pcb,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new pcb form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pcbs_path, "post" do
      assert_select "input#pcb_title[name=?]", "pcb[title]"
      assert_select "textarea#pcb_description[name=?]", "pcb[description]"
    end
  end
end
