class AssemblyGuide < ActiveRecord::Base
  belongs_to :pcb
  attr_accessible :description
end
