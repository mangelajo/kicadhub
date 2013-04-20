require 'spec_helper'

describe "reference_prints/edit" do
  before(:each) do
    @reference_print = assign(:reference_print, stub_model(ReferencePrint,
      :name => "MyString",
      :type => "",
      :assembly_guide => nil,
      :reference => nil,
      :index => 1
    ))
  end

  it "renders the edit reference_print form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reference_print_path(@reference_print), "post" do
      assert_select "input#reference_print_name[name=?]", "reference_print[name]"
      assert_select "input#reference_print_type[name=?]", "reference_print[type]"
      assert_select "input#reference_print_assembly_guide[name=?]", "reference_print[assembly_guide]"
      assert_select "input#reference_print_reference[name=?]", "reference_print[reference]"
      assert_select "input#reference_print_index[name=?]", "reference_print[index]"
    end
  end
end
