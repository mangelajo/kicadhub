class AddComponentToAssemblyStep < ActiveRecord::Migration
  def change
    add_column :assembly_steps, :component_id, :integer
    add_column :references, :assembly_step_id, :integer
    remove_column :assembly_steps, :reference_id
    add_index :assembly_steps, :component_id
    add_index :references, :assembly_step_id
  end


end
