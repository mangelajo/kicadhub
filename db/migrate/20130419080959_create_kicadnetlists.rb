class CreateKicadnetlists < ActiveRecord::Migration
  def change
    create_table :kicadnetlists do |t|
      t.datetime :date
      t.string :tool
      t.attachment :xml

      t.timestamps
    end
  end
end
