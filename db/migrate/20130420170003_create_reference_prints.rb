class CreateReferencePrints < ActiveRecord::Migration
  def change
    create_table :reference_prints do |t|
      t.string :name
      t.string :type
      t.references :assembly_guide
      t.references :reference
      t.integer :index

      t.timestamps
    end
    add_index :reference_prints, :assembly_guide_id
    add_index :reference_prints, :reference_id
  end
end
