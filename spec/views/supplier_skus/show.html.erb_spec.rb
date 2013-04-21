require 'spec_helper'

describe "supplier_skus/show" do
  before(:each) do
    @supplier_sku = assign(:supplier_sku, stub_model(SupplierSku,
      :sku => "Sku",
      :moq => 1,
      :prices => "MyText",
      :product_url => "Product Url",
      :in_stock_qty => 2,
      :on_order_qty => 3,
      :factory_lead_days => 4,
      :factory_pack_quantity => 5,
      :order_multiple => 6,
      :packaging => "Packaging",
      :is_authorized => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sku/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Product Url/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/Packaging/)
    rendered.should match(/false/)
  end
end
