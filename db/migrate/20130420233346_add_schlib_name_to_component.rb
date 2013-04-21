class AddSchlibNameToComponent < ActiveRecord::Migration
  def change
    add_column :components, :schlib_name, :string
  end
end
