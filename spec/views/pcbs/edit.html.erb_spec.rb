require 'spec_helper'

describe "pcbs/edit" do
  before(:each) do
    @pcb = assign(:pcb, stub_model(Pcb,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit pcb form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pcb_path(@pcb), "post" do
      assert_select "input#pcb_title[name=?]", "pcb[title]"
      assert_select "textarea#pcb_description[name=?]", "pcb[description]"
    end
  end
end
