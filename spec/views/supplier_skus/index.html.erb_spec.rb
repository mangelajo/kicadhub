require 'spec_helper'

describe "supplier_skus/index" do
  before(:each) do
    assign(:supplier_skus, [
      stub_model(SupplierSku,
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
      ),
      stub_model(SupplierSku,
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
      )
    ])
  end

  it "renders a list of supplier_skus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Product Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "Packaging".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
