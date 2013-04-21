class Supplier < ActiveRecord::Base
  attr_accessible :name, :url
  has_many :supplier_skus
end
