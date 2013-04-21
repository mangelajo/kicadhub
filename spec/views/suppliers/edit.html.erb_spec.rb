require 'spec_helper'

describe "suppliers/edit" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier))
  end

  it "renders the edit supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do
    end
  end
end
