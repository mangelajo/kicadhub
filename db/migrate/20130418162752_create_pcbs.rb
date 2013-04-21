class CreatePcbs < ActiveRecord::Migration
  def change
    create_table :pcbs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
