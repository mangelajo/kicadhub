class AddImagesToAssemblyStep < ActiveRecord::Migration
  def self.up
    drop_attached_file :assembly_steps, :preview

    change_table :assembly_steps do |t|
      t.attachment :front
      t.attachment :back

    end
  end

  def self.down
    drop_attached_file :assembly_steps, :front
    drop_attached_file :assembly_steps, :back

    change_table :assembly_steps do |t|
      t.attachment :preview

    end
  end
end
