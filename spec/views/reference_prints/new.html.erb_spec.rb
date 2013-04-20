require 'spec_helper'

describe "reference_prints/new" do
  before(:each) do
    assign(:reference_print, stub_model(ReferencePrint,
      :name => "MyString",
      :type => "",
      :assembly_guide => nil,
      :reference => nil,
      :index => 1
    ).as_new_record)
  end

  it "renders new reference_print form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reference_prints_path, "post" do
      assert_select "input#reference_print_name[name=?]", "reference_print[name]"
      assert_select "input#reference_print_type[name=?]", "reference_print[type]"
      assert_select "input#reference_print_assembly_guide[name=?]", "reference_print[assembly_guide]"
      assert_select "input#reference_print_reference[name=?]", "reference_print[reference]"
      assert_select "input#reference_print_index[name=?]", "reference_print[index]"
    end
  end
end
