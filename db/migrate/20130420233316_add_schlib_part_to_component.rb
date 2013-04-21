class AddSchlibPartToComponent < ActiveRecord::Migration
  def change
    add_column :components, :schlib_part, :string
  end
end
