require 'spec_helper'

describe "components/show" do
  before(:each) do
    @component = assign(:component, stub_model(Component,
      :name => "Name",
      :manufacturer => "Manufacturer",
      :footprint => "Footprint",
      :description => "MyText",
      :datasheet_url => "Datasheet Url",
      :manufacturer_cmp_url => "Manufacturer Cmp Url",
      :mpn => "Mpn",
      :octopart_uid => "Octopart Uid",
      :octopart_url => "Octopart Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Manufacturer/)
    rendered.should match(/Footprint/)
    rendered.should match(/MyText/)
    rendered.should match(/Datasheet Url/)
    rendered.should match(/Manufacturer Cmp Url/)
    rendered.should match(/Mpn/)
    rendered.should match(/Octopart Uid/)
    rendered.should match(/Octopart Url/)
  end
end
