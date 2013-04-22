class Component < ActiveRecord::Base
  attr_accessible :datasheet_url, :schlib_part, :schlib_name, :description, :value, :footprint, :manufacturer, :manufacturer_cmp_url, :mpn, :name, :octopart_uid, :octopart_url

  has_and_belongs_to_many :supplier_skus
  has_many :references
  has_many :kicadnetlists , :through => :references
  has_many :pcbs , :through =>:kicadnetlists

  after_initialize :check_octopart

  def self.find_or_create_from_netlist_data(compo,netlist)

    #try to match the component
    matches = netlist.components.where( :value       =>compo.value,
                                        :footprint   =>compo.footprint,
                                        :schlib_part =>compo.schlib_part,
                                        :schlib_name =>compo.schlib_name)

    if matches.empty?
      matches = self.try_match_component(compo,netlist)
    end

    if matches.empty?
      component = Component.create(self.data_from_compo(compo))
    else
      component = matches.first
    end

    component.scan_for_skus(compo)
    return component
  end

  # TODO: Match components not only inside netlist, idea 2) try to match them later
  # in a requeue task, by footprint data, or octopart id where available
  def self.try_match_component(compo,netlist)
    return []
  end

  def check_octopart
    match_octopart if self.octopart_uid.nil?

  end

  def match_octopart

    query = {}

    query['mpn'] = self.mpn unless self.mpn.nil?
    query['mpn_or_sku'] = self.value unless query.keys().include? 'mpn'
    query['sku'] = self.supplier_skus.first.sku unless self.supplier_skus.count.zero?

    item = OctopartQueryCache.match(query).results.first.items.first
    unless item.nil?
      parse_octopart_item item
      parse_octopart_offers item.offers
    end
  end

  def parse_octopart_offers(offers)

    offers.each  do |offer|
      sku = SupplierSku.parse_octopart_offer_for_component(offer,self)
      self.supplier_skus << sku unless self.supplier_skus.include? sku
    end

  end

  def parse_octopart_item(item)
    self.octopart_uid = item.uid
    self.octopart_url = item.octopart_url
    self.mpn = item.mpn if self.mpn.nil?
    self.manufacturer = item.manufacturer.name if self.manufacturer.nil?
    self.name = item.mpn if self.name.nil?

    self.save!

  end


  # netlist component scanning

  def self.data_from_compo(compo)
      d = {}
      %w[footprint value schlib_part schlib_name].each {|k| d[k]=compo[k]}
      compo.fields.each do |k,v|
        d = self.data_from_field(k,v).merge d
      end
      d['datasheet_url']=compo.datasheet if not compo.datasheet.nil? and compo.datasheet.start_with? 'http://'
      d['name']=compo.fields.keywords
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
        value.gsub!('Digi-Key','Digikey')
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
           supplier = Supplier.find_or_create_by_name(data[0])
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
