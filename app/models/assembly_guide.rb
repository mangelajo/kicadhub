class AssemblyGuide < ActiveRecord::Base
  belongs_to :pcb
  has_many :assembly_steps ,  :dependent => :destroy

  attr_accessible :description, :items, :pcb_id, :assembly_top, :assembly_bottom
  has_attached_file :assembly_top , :styles => { :thumb => "300x300" }
  has_attached_file :assembly_bottom , :styles => { :thumb => "300x300" }

  after_initialize :check_items

  def check_items
    if items.nil?
      items = assembly_steps.count
      self.save!
    end
  end


  def self.generate_for_pcb_and_netlist(pcb,netlist)

    files=%x[/Applications/KiCad/python #{File.join(Rails.root, 'lib','system','showcomponents.py')} #{pcb.file.path}].split("\n")

    if files.length == 2
      assy = AssemblyGuide.create(description:"#{pcb.title} Assembly Guide")

      File.open(files[1]) { |f| assy.assembly_top = f }
      File.open(files[0]) { |f| assy.assembly_bottom = f }
      assy.pcb = pcb
      assy.save!

      assy.regenerate_steps

      return assy
    end
  end

  def regenerate_steps
    assembly_steps.delete_all

    index = 1

    pcb.kicadnetlist.references.group(:component_id).each do |reference|
      component = reference.component
      references = pcb.kicadnetlist.references.where(component_id:component.id)
      step = AssemblyStep.create_for_pcb_and_references(pcb,references)
      step.index = index
      index = index + 1
      step.save!
      self.assembly_steps << step
    end

    self.items = index-1
    self.save!
  end

end
