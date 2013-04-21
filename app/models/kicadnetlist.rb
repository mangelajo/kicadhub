require 'nokogiri'
require 'pry'
class Kicadnetlist < ActiveRecord::Base
  attr_accessible :date, :tool,:xml,:pcb_id
  has_attached_file :xml
  has_many :references
  has_many :components, :through => :references

  belongs_to :pcb
  before_save :scan_xml


  def render_assembly
    self.pcb.assembly_guides.destroy_all unless self.pcb.nil?
  end

  # data building

  def render_references(netlist_components)
    self.references.destroy_all
    netlist_components.each do |component|
      self.references << Reference.create_from_netlist_component(component,self)
    end
  end


  # XML Scanning

  def xml_contents
    xml.save
    File.open(xml.path,'r') do |f|
      return f.read
    end
  end

  def scan_xml
    return unless @components.nil?
    doc = Nokogiri::XML::Document.parse(xml_contents)    { |config| config.nonet }
    self.tool = doc.search('design/tool').first.children.text
    render_references( scan_components(doc.search('comp')))
  end


  def scan_components(xml_components)
    components = []
    xml_components.each do |c|
      cmp= {}

      ref = c.attributes['ref'].value

      if ref.nil?
        puts "why am I nil?, who am I? #{c.inspect}"
      end

      cmp['ref'] = c.attributes['ref'].value

      %w[value footprint datasheet].each {|field|
        cmp[field] = c.search(field).first.text
      }
      libsource = c.search('libsource').first
      cmp['schlib_name'] = libsource.attributes['lib'].value
      cmp['schlib_part'] = libsource.attributes['part'].value

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
