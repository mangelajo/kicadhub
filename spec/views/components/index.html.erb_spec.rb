require 'spec_helper'

describe "components/index" do
  before(:each) do
    assign(:components, [
      stub_model(Component,
        :name => "Name",
        :manufacturer => "Manufacturer",
        :footprint => "Footprint",
        :description => "MyText",
        :datasheet_url => "Datasheet Url",
        :manufacturer_cmp_url => "Manufacturer Cmp Url",
        :mpn => "Mpn",
        :octopart_uid => "Octopart Uid",
        :octopart_url => "Octopart Url"
      ),
      stub_model(Component,
        :name => "Name",
        :manufacturer => "Manufacturer",
        :footprint => "Footprint",
        :description => "MyText",
        :datasheet_url => "Datasheet Url",
        :manufacturer_cmp_url => "Manufacturer Cmp Url",
        :mpn => "Mpn",
        :octopart_uid => "Octopart Uid",
        :octopart_url => "Octopart Url"
      )
    ])
  end

  it "renders a list of components" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => "Footprint".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Datasheet Url".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer Cmp Url".to_s, :count => 2
    assert_select "tr>td", :text => "Mpn".to_s, :count => 2
    assert_select "tr>td", :text => "Octopart Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Octopart Url".to_s, :count => 2
  end
end
