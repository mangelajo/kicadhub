class AddAttachmentPreviewToPcbs < ActiveRecord::Migration
  def self.up
    change_table :pcbs do |t|
      t.attachment :preview
    end
  end

  def self.down
    drop_attached_file :pcbs, :preview
  end
end
