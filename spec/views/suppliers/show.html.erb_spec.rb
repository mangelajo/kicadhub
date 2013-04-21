require 'spec_helper'

describe "suppliers/show" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
