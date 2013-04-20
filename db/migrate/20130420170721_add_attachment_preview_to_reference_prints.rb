class AddAttachmentPreviewToReferencePrints < ActiveRecord::Migration
  def self.up
    change_table :reference_prints do |t|
      t.attachment :preview
    end
  end

  def self.down
    drop_attached_file :reference_prints, :preview
  end
end
