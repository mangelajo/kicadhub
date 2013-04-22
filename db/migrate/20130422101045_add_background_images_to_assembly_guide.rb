class AddBackgroundImagesToAssemblyGuide < ActiveRecord::Migration
  def self.up
    change_table :assembly_guides do |t|
      t.attachment :assembly_top
      t.attachment :assembly_bottom
    end
  end

  def self.down
    drop_attached_file :assembly_guides, :assembly_top
    drop_attached_file :assembly_guides, :assembly_bottom
  end
end
