class Component < ActiveRecord::Base
  attr_accessible :datasheet_url, :schlib_part, :schlib_name, :description, :value, :footprint, :manufacturer, :manufacturer_cmp_url, :mpn, :name, :octopart_uid, :octopart_url

  has_and_belongs_to_many :supplier_skus
  has_many :references
  has_many :kicadnetlists , :through => :references
  has_many :pcbs , :through =>:kicadnetlists

  def self.find_or_create_from_netlist_data(compo,netlist)

    #try to match the component
    matches = netlist.components.where( :value       =>compo.value,
                                        :footprint   =>compo.footprint,
                                        :schlib_part =>compo.schlib_part,
                                        :schlib_name =>compo.schlib_name)

    if matches.empty?
      component = Component.create(self.data_from_compo(compo))
      netlist.components << component
      return component
    else
      component = matches.first
    end

    component.scan_for_skus(compo)
    return component
  end

  def self.data_from_compo(compo)
      d = {}
      %w[footprint value schlib_part schlib_name].each {|k| d[k]=compo[k]}
      compo.fields.each do |k,v|
        d = self.data_from_field(k,v).merge d
      end
      return d
  end

  def self.get_hyphened_data(data)
    res = [data.match(/([^-]+)/).to_s.trimall]
    second = data.match(/-(.+)/)
    unless second.nil?
      res.append(second.to_s.ltrim('-').trimall)
    end
    return res
  end

  def self.data_from_field(key,value)
      if key.downcase.include?"manufacturer"
        data = self.get_hyphened_data(value)
        d = { manufacturer: data[0] }
        d[:mpn] = data[1] if data.count==2
        return d
      end
      return {}
  end

  def scan_for_skus(compo)
    compo.fields.each do |key,value|
      if key.downcase.include?"supplier"
        data = Component.get_hyphened_data(value)
        if data.count==2
           supplier = Supplier.find_by_name(data[0])
           if supplier.nil?
             supplier = Supplier.create(name:data[0])
             supplier.save!
           end
           sku = supplier.supplier_skus.find_by_sku(data[1])
           if sku.nil?
             sku = SupplierSku.create(sku:data[1],supplier_id:supplier.id)
           end
           self.supplier_skus << sku unless self.supplier_skus.include? sku
        end
      end
    end

  end

end
