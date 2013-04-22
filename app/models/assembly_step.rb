class AssemblyStep < ActiveRecord::Base
  belongs_to :assembly_guide
  has_many :references
  belongs_to :component
  attr_accessible :index, :name
  has_attached_file :front , :styles => { :thumb => "300x300" }
  has_attached_file :back , :styles => {  :thumb => "300x300" }

  def self.create_for_pcb_and_references(pcb,references)

    reference_list = (references.map{|r| r.name}).join(' ')

    files=%x[/Applications/KiCad/python #{File.join(Rails.root, 'lib','system','showcomponents.py')} #{pcb.file.path} #{reference_list}].split("\n")

    if files.length == 2
      step = AssemblyStep.create() #description:"#{pcb.title} Assembly Guide"

      File.open(files[1]) { |f| step.front = f }
      File.open(files[0]) { |f| step.back = f }

      step.save!
      step.component = references.first.component

      references.each do  |r|
        r.assembly_step = step
        r.save!
      end



      return step
    end

  end
end
