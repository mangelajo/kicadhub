class CreateKicadnetlists < ActiveRecord::Migration
  def change
    create_table :kicadnetlists do |t|
      t.datetime :date
      t.string :tool
      t.attachment :xml
      t.references :pcb
      t.timestamps
    end
    add_index :kicadnetlists, :pcb_id
  end
end
