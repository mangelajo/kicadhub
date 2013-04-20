require 'spec_helper'

describe "assembly_steps/new" do
  before(:each) do
    assign(:assembly_step, stub_model(AssemblyStep,
      :name => "MyString",
      :assemblyguide => nil,
      :reference => nil,
      :index => 1
    ).as_new_record)
  end

  it "renders new assembly_step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", assembly_steps_path, "post" do
      assert_select "input#assembly_step_name[name=?]", "assembly_step[name]"
      assert_select "input#assembly_step_assemblyguide[name=?]", "assembly_step[assemblyguide]"
      assert_select "input#assembly_step_reference[name=?]", "assembly_step[reference]"
      assert_select "input#assembly_step_index[name=?]", "assembly_step[index]"
    end
  end
end
