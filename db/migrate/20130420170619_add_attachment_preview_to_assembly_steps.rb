class AddAttachmentPreviewToAssemblySteps < ActiveRecord::Migration
  def self.up
    change_table :assembly_steps do |t|
      t.attachment :preview
    end
  end

  def self.down
    drop_attached_file :assembly_steps, :preview
  end
end
