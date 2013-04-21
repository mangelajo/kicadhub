class AddValueColumnToComponent < ActiveRecord::Migration
  def change
    add_column :components, :value, :string
  end
end
