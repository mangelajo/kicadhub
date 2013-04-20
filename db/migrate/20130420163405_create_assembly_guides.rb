class CreateAssemblyGuides < ActiveRecord::Migration
  def change
    create_table :assembly_guides do |t|
      t.string :description
      t.references :pcb

      t.timestamps
    end
    add_index :assembly_guides, :pcb_id
  end
end
