class Reference < ActiveRecord::Base
  belongs_to :kicadnetlist
  belongs_to :component
  attr_accessible :name

  def self.create_from_netlist_component(netlist_component)


  end
end
