class AssemblyStep < ActiveRecord::Base
  belongs_to :assembly_guide
  belongs_to :reference
  attr_accessible :index, :name
  has_attached_file :file
  has_attached_file :preview
end
