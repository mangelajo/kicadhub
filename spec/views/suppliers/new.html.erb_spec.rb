require 'spec_helper'

describe "suppliers/new" do
  before(:each) do
    assign(:supplier, stub_model(Supplier).as_new_record)
  end

  it "renders new supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suppliers_path, "post" do
    end
  end
end
