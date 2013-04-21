class SupplierSku < ActiveRecord::Base
  attr_accessible :factory_lead_days, :factory_pack_quantity, :in_stock_qty, :is_authorized, :last_updated, :moq,
                  :on_order_eta, :on_order_qty, :order_multiple, :packaging, :prices, :product_url,
                  :sku,:supplier_id
  serialize :prices
  has_and_belongs_to_many :components
  belongs_to :supplier

  def self.parse_octopart_offer_for_component(offer,component)

    supplier = Supplier.find_or_create_by_name(offer.seller.name)
    supplier_sku = supplier.supplier_skus.find_by_sku(offer.sku)

    data = self.get_octopart_offer_data(offer)
    data['supplier_id']=supplier.id

    if supplier_sku.nil?
      return SupplierSku.create(data)
    else
      supplier_sku.update_attributes!(data)
      supplier_sku.save!

      return supplier_sku
    end

    component.supplier_skus << supplier_sku unless  component.supplier_skus.include? supplier_sku

  end

  def self.get_octopart_offer_data(offer)
    data = {}

    data['sku']= offer.sku
    data['in_stock_qty'] = offer.in_stock_quantity
    data['on_order_eta'] = offer.on_order_eta
    data['last_updated'] = offer.last_updated
    data['moq'] = offer.moq
    data['product_url'] = offer.product_url
    data['factory_pack_quantity'] = offer.factory_pack_quantity
    data['prices'] = offer.prices
    data['is_authorized'] = offer.is_authorized
    data['packaging'] = offer.packaging
    data['order_multiple'] = offer.order_multiple
    data['factory_lead_days'] = offer.factory_lead_days
    return data
  end
end
