require 'nokogiri'
require 'pry'
class Kicadnetlist < ActiveRecord::Base
  attr_accessible :date, :tool,:xml
  has_attached_file :xml

  before_save :scan_xml

  def xml_contents
    xml.save
    File.open(xml.path,'r') do |f|
      return f.read
    end
  end

  def scan_xml
    doc = Nokogiri::XML::Document.parse(xml_contents)    { |config| config.nonet }
    @components = scan_components(doc.search('comp'))

    binding.pry
  end

  def scan_components(xml_components)
    components = []
    xml_components.each do |c|
      cmp= {}

      cmp['ref'] = c.attributes['ref'].value

      %w[value footprint datasheet].each {|field|
        cmp[field] = c.search(field).first.text
      }

      cmp['fields'] = scan_fields( c.search('fields/field') )

      components.append(Hashie::Mash.new(cmp))
    end
    return components
  end

  def scan_fields(xml_fields)
    fields = {}
    xml_fields.each do |f|
      name = f.attributes['name'].value
      value = f.children.text
      fields[name]=value
    end
    return fields
  end


end
