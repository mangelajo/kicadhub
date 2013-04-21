class Reference < ActiveRecord::Base
  belongs_to :kicadnetlist
  belongs_to :component
  attr_accessible :name , :component_id, :kicadnetlist_id

  def self.create_from_netlist_component(netlist_component,netlist)

    component = Component.find_or_create_from_netlist_data(netlist_component,netlist)

    return Reference.create(name:netlist_component.ref,
                            component_id: component.id,
                            kicadnetlist_id: netlist.id)

  end
end
