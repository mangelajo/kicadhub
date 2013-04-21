require 'spec_helper'

describe "supplier_skus/new" do
  before(:each) do
    assign(:supplier_sku, stub_model(SupplierSku,
      :sku => "MyString",
      :moq => 1,
      :prices => "MyText",
      :product_url => "MyString",
      :in_stock_qty => 1,
      :on_order_qty => 1,
      :factory_lead_days => 1,
      :factory_pack_quantity => 1,
      :order_multiple => 1,
      :packaging => "MyString",
      :is_authorized => false
    ).as_new_record)
  end

  it "renders new supplier_sku form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supplier_skus_path, "post" do
      assert_select "input#supplier_sku_sku[name=?]", "supplier_sku[sku]"
      assert_select "input#supplier_sku_moq[name=?]", "supplier_sku[moq]"
      assert_select "textarea#supplier_sku_prices[name=?]", "supplier_sku[prices]"
      assert_select "input#supplier_sku_product_url[name=?]", "supplier_sku[product_url]"
      assert_select "input#supplier_sku_in_stock_qty[name=?]", "supplier_sku[in_stock_qty]"
      assert_select "input#supplier_sku_on_order_qty[name=?]", "supplier_sku[on_order_qty]"
      assert_select "input#supplier_sku_factory_lead_days[name=?]", "supplier_sku[factory_lead_days]"
      assert_select "input#supplier_sku_factory_pack_quantity[name=?]", "supplier_sku[factory_pack_quantity]"
      assert_select "input#supplier_sku_order_multiple[name=?]", "supplier_sku[order_multiple]"
      assert_select "input#supplier_sku_packaging[name=?]", "supplier_sku[packaging]"
      assert_select "input#supplier_sku_is_authorized[name=?]", "supplier_sku[is_authorized]"
    end
  end
end
