class Pcb < ActiveRecord::Base
  attr_accessible :description, :title, :file, :preview
  has_attached_file :file
  has_attached_file :preview
  has_many :kicadnetlists
  has_many :references , :through => :kicadnetlists
  has_many :assembly_guides
  has_many :reference_prints, :through => :assembly_guides
end
