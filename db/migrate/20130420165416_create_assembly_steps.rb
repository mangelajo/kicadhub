class CreateAssemblySteps < ActiveRecord::Migration
  def change
    create_table :assembly_steps do |t|
      t.string :name
      t.references :assembly_guide
      t.references :reference
      t.integer :index

      t.timestamps
    end
    add_index :assembly_steps, :assembly_guide_id
    add_index :assembly_steps, :reference_id
  end
end
