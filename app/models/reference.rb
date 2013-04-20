class Reference < ActiveRecord::Base
  belongs_to :kicadnetlist
  belongs_to :component
  attr_accessible :name
end
