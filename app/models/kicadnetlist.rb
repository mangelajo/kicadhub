class Kicadnetlist < ActiveRecord::Base
  attr_accessible :date, :tool,:xml
  has_attached_file :xml
end
