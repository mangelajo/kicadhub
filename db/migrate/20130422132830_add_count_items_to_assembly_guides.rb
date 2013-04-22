class AddCountItemsToAssemblyGuides < ActiveRecord::Migration
  def change
    add_column :assembly_guides, :items, :integer
  end
end
