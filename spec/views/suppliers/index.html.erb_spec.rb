require 'spec_helper'

describe "suppliers/index" do
  before(:each) do
    assign(:suppliers, [
      stub_model(Supplier),
      stub_model(Supplier)
    ])
  end

  it "renders a list of suppliers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
