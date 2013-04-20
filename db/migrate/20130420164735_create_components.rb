class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.string :manufacturer
      t.string :footprint
      t.text :description
      t.string :datasheet_url
      t.string :manufacturer_cmp_url
      t.string :mpn
      t.string :octopart_uid
      t.string :octopart_url

      t.timestamps
    end
  end
end
