class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.references :kicadnetlist
      t.references :component

      t.timestamps
    end
    add_index :references, :kicadnetlist_id
    add_index :references, :component_id
  end
end
