require 'spec_helper'

describe "components/edit" do
  before(:each) do
    @component = assign(:component, stub_model(Component,
      :name => "MyString",
      :manufacturer => "MyString",
      :footprint => "MyString",
      :description => "MyText",
      :datasheet_url => "MyString",
      :manufacturer_cmp_url => "MyString",
      :mpn => "MyString",
      :octopart_uid => "MyString",
      :octopart_url => "MyString"
    ))
  end

  it "renders the edit component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", component_path(@component), "post" do
      assert_select "input#component_name[name=?]", "component[name]"
      assert_select "input#component_manufacturer[name=?]", "component[manufacturer]"
      assert_select "input#component_footprint[name=?]", "component[footprint]"
      assert_select "textarea#component_description[name=?]", "component[description]"
      assert_select "input#component_datasheet_url[name=?]", "component[datasheet_url]"
      assert_select "input#component_manufacturer_cmp_url[name=?]", "component[manufacturer_cmp_url]"
      assert_select "input#component_mpn[name=?]", "component[mpn]"
      assert_select "input#component_octopart_uid[name=?]", "component[octopart_uid]"
      assert_select "input#component_octopart_url[name=?]", "component[octopart_url]"
    end
  end
end
