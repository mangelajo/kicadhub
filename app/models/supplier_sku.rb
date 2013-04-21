class SupplierSku < ActiveRecord::Base
  attr_accessible :factory_lead_days, :factory_pack_quantity, :in_stock_qty, :is_authorized, :last_updated, :moq, :on_order_eta, :on_order_qty, :order_multiple, :packaging, :prices, :product_url, :sku, :component_id,:supplier_id
  has_and_belongs_to_many :components
  belongs_to :supplier
end
