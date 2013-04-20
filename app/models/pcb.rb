class Pcb < ActiveRecord::Base
  attr_accessible :description, :title
  has_attached_file :file
  has_attached_file :preview
end
